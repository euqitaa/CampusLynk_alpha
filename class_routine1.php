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
$days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
foreach ($days as $day) {
    $schedule[$day] = [];
}

try {
    // Fetch user id
    $userQuery = "SELECT id, name FROM users WHERE email = ?";
    $userStmt = $db->prepare($userQuery);
    $userStmt->execute([$_SESSION["useremail"]]);
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $userId = $user['id'];

        // Fetch student's enrolled courses and their schedules
        $routineQuery = "
            SELECT 
                uc.course_code, 
                uc.course_title, 
                uc.section, 
                uc.time, 
                uc.day
            FROM student_enrollments se
            JOIN upcoming_courses uc ON se.course_id = uc.id
            WHERE se.student_id = ?
        ";
        $routineStmt = $db->prepare($routineQuery);
        $routineStmt->execute([$userId]);
        $enrolled_courses = $routineStmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($enrolled_courses as $course) {
            if (in_array($course['day'], $days)) {
                $schedule[$course['day']][] = $course;
            }
        }
    }

} catch(PDOException $e) {
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

        <div class="routine-container">
            <div class="days-grid">
                <?php foreach ($days as $day): ?>
                    <div class="day-column">
                        <div class="day-header"><?php echo $day; ?></div>
                        <div class="class-slots">
                            <?php if (!empty($schedule[$day])): ?>
                                <?php foreach ($schedule[$day] as $class): ?>
                                    <div class="class-card">
                                        <p class="class-time"><?php echo htmlspecialchars($class['time']); ?></p>
                                        <p class="class-title"><?php echo htmlspecialchars($class['course_title']); ?></p>
                                        <p class="class-code"><?php echo htmlspecialchars($class['course_code']); ?> [<?php echo htmlspecialchars($class['section']); ?>]</p>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <div class="no-class-card">
                                    <p>No classes scheduled</p>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </main>
</body>

</html>