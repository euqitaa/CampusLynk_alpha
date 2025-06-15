<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();

try {
    // Fetch user data
    $userQuery = "SELECT name FROM users WHERE email = ?";
    $userStmt = $db->prepare($userQuery);
    $userStmt->execute([$_SESSION["useremail"]]);
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    // Fetch exam schedule
    $query = "SELECT * FROM exam_schedule ORDER BY exam_date ASC";
    $stmt = $db->prepare($query);
    $stmt->execute();
    $exams = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    echo "<script>alert('Database Error: " . $e->getMessage() . "');</script>";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Schedule - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/exam-schedule.css">
</head>

<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Exam Schedule</h1>
            <p class="text-muted">View your upcoming exams and their details</p>
        </section>

        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Exam Date</th>
                        <th>Time</th>
                        <th>Room</th>
                        <th>Duration</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (isset($exams) && !empty($exams)): ?>
                        <?php foreach ($exams as $exam): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($exam['course_name']); ?></td>
                                <td class="exam-date"><?php echo date('M j, Y', strtotime($exam['exam_date'])); ?></td>
                                <td class="exam-time"><?php echo htmlspecialchars($exam['exam_time']); ?></td>
                                <td><span class="room-number"><?php echo htmlspecialchars($exam['room_number']); ?></span></td>
                                <td><span class="duration"><?php echo htmlspecialchars($exam['duration']); ?> hours</span></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="5">
                                <div class="empty-state">
                                    <i class='bx bx-calendar-x'></i>
                                    <p>No exams scheduled at the moment</p>
                                </div>
                            </td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html> 