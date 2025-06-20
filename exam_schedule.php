<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();
$exams = [];

try {
    // Fetch user id
    $userQuery = "SELECT id FROM users WHERE email = ?";
    $userStmt = $db->prepare($userQuery);
    $userStmt->execute([$_SESSION["useremail"]]);
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $userId = $user['id'];

        // Fetch the student's exam schedule by joining enrollments with exam tables
        $examQuery = "
            SELECT 
                ex.course_title,
                ex.course_code,
                ex.date,
                ex.day,
                ex.time,
                ex.section
            FROM student_enrollments se
            JOIN upcoming_courses uc ON se.course_id = uc.id
            JOIN cse_exams ex ON uc.course_code = ex.course_code AND se.section = ex.section
            WHERE se.student_id = ?
            ORDER BY ex.date, ex.time
        ";
        
        $examStmt = $db->prepare($examQuery);
        $examStmt->execute([$userId]);
        $exams = $examStmt->fetchAll(PDO::FETCH_ASSOC);
    }
} catch(PDOException $e) {
    // A more user-friendly error message
    echo "<p>Could not retrieve exam schedule. Please try again later.</p>";
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
                        <th>Code</th>
                        <th>Date</th>
                        <th>Day</th>
                        <th>Time</th>
                        <th>Section</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (!empty($exams)): ?>
                        <?php foreach ($exams as $exam): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($exam['course_title']); ?></td>
                                <td><?php echo htmlspecialchars($exam['course_code']); ?></td>
                                <td class="exam-date"><?php echo date('M j, Y', strtotime($exam['date'])); ?></td>
                                <td><?php echo htmlspecialchars($exam['day']); ?></td>
                                <td class="exam-time"><?php echo htmlspecialchars(substr($exam['time'], 0, 5)); ?></td>
                                <td><?php echo htmlspecialchars($exam['section']); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="6">
                                <div class="empty-state">
                                    <i class='bx bx-calendar-x'></i>
                                    <p>No exams scheduled for your enrolled courses</p>
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