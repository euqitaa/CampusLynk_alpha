<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();
$schedule = [];
$timeSlots = [];
$days = ['Sat', 'Sun', 'Tue', 'Wed'];

try {
    $userQuery = "SELECT id FROM users WHERE email = ?";
    $userStmt = $db->prepare($userQuery);
    $userStmt->execute([$_SESSION["useremail"]]);
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $userId = $user['id'];

        $routineQuery = "
            SELECT uc.course_code, uc.course_title, uc.section, uc.time, uc.day
            FROM student_enrollments se
            JOIN upcoming_courses uc ON se.course_id = uc.id
            WHERE se.student_id = ?
        ";
        $routineStmt = $db->prepare($routineQuery);
        $routineStmt->execute([$userId]);
        $enrolled_courses = $routineStmt->fetchAll(PDO::FETCH_ASSOC);

        $processed_courses = [];
        foreach ($enrolled_courses as $course) {
            $processed_courses[] = $course;
            if ($course['day'] === 'Sat') {
                $processed_courses[] = array_merge($course, ['day' => 'Tue']);
            }
            if ($course['day'] === 'Sun') {
                $processed_courses[] = array_merge($course, ['day' => 'Wed']);
            }
        }

        foreach ($processed_courses as $course) {
            if (in_array($course['day'], $days)) {
                $schedule[$course['time']][$course['day']] = $course;
                if (!in_array($course['time'], $timeSlots)) {
                    $timeSlots[] = $course['time'];
                }
            }
        }
        
        usort($timeSlots, function ($a, $b) {
            // Use DateTime objects for a reliable sort
            $timeA_str = trim(explode('-', $a)[0]);
            $timeB_str = trim(explode('-', $b)[0]);
            
            $timeA = DateTime::createFromFormat('h:i:A', $timeA_str);
            $timeB = DateTime::createFromFormat('h:i:A', $timeB_str);

            // Fallback for safety, though it shouldn't be needed now
            if ($timeA === false || $timeB === false) {
                return strtotime($timeA_str) <=> strtotime($timeB_str);
            }
            
            return $timeA <=> $timeB;
        });
    }

} catch (PDOException $e) {
    echo "<script>alert('Database Error: " . $e->getMessage() . "');</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Routine - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/class-routine.css">
</head>

<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Class Routine</h1>
            <p class="text-muted">Your personalized class schedule for the week</p>
        </section>

        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Time</th>
                        <?php foreach ($days as $day): ?>
                            <th><?php echo htmlspecialchars($day); ?></th>
                        <?php endforeach; ?>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($timeSlots)): ?>
                        <tr>
                            <td colspan="<?php echo count($days) + 1; ?>" style="text-align: center;">You are not enrolled in any courses.</td>
                        </tr>
                    <?php else: ?>
                        <?php foreach ($timeSlots as $time): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($time); ?></td>
                                <?php foreach ($days as $day): ?>
                                    <td>
                                        <?php if (isset($schedule[$time][$day])): 
                                            $class = $schedule[$time][$day];
                                        ?>
                                            <div class="class-cell">
                                                <span class="class-name"><?php echo htmlspecialchars($class['course_title']); ?></span>
                                                <span class="class-info"><?php echo htmlspecialchars($class['course_code']); ?> [<?php echo htmlspecialchars($class['section']); ?>]</span>
                                            </div>
                                        <?php else: ?>
                                            <div class="empty-cell"></div>
                                        <?php endif; ?>
                                    </td>
                                <?php endforeach; ?>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </main>
</body>

</html>