<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

try {
    $database = new Database();
    $db = $database->getConnection();
    
    $query = $db->prepare("SELECT * FROM faculty WHERE email = ?");
    $query->execute([$_SESSION['useremail']]);
    $faculty = $query->fetch(PDO::FETCH_ASSOC);
    
    if (!$faculty) {
        session_destroy();
        header("Location: login.php?error=Faculty not found");
        exit();
    }
    
    // Fetch active courses
    $courses_query = "SELECT * FROM courses WHERE faculty_id = ?";
    $courses_stmt = $db->prepare($courses_query);
    $courses_stmt->execute([$faculty['id']]);
    $courses = $courses_stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Count total students
    $students_query = "SELECT COUNT(DISTINCT student_id) as total FROM course_enrollments WHERE course_id IN (SELECT id FROM courses WHERE faculty_id = ?)";
    $students_stmt = $db->prepare($students_query);
    $students_stmt->execute([$faculty['id']]);
    $total_students = $students_stmt->fetch(PDO::FETCH_ASSOC)['total'];
    
} catch (PDOException $e) {
    header("Location: login.php?error=Database Error: " . urlencode($e->getMessage()));
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Dashboard - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="styles.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- <script>
        $(document).ready(function () {

            $('#content').load("header.php");

        });
    </script>
    <script>
        $(document).ready(function () {

            $('#content1').load("sidebar.php");

        });
    </script> -->

</head>

<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Welcome, <?php echo htmlspecialchars($faculty['name']); ?></h1>
            <p class="text-muted">Manage your courses and student requests</p>
        </section>

        <?php if (isset($error)): ?>
            <div class="alert alert-error">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php else: ?>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <div class="card">
                    <h2 class="text-xl font-semibold mb-4">Quick Access</h2>
                    <div class="space-y-4">
                        <a href="approve_time_slots.php" class="btn btn-primary w-full">
                            Approve Time Slots
                        </a>
                        <a href="manage_courses.php" class="btn btn-secondary w-full">
                            Manage Courses
                        </a>
                    </div>
                </div>

                <div class="card">
                    <h2 class="text-xl font-semibold mb-4">Course Overview</h2>
                    <div class="space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-muted">Active Courses</span>
                            <span class="font-semibold"><?php echo count($courses); ?></span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-muted">Total Students</span>
                            <span class="font-semibold"><?php echo $total_students; ?></span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <h2 class="text-xl font-semibold mb-4">Recent Activities</h2>
                    <div class="space-y-4">
                        <?php if (!empty($courses)): ?>
                            <?php foreach (array_slice($courses, 0, 3) as $course): ?>
                                <div class="flex items-center space-x-4">
                                    <div class="flex-1">
                                        <h3 class="font-semibold"><?php echo htmlspecialchars($course['name']); ?></h3>
                                        <p class="text-sm text-muted"><?php echo htmlspecialchars($course['code']); ?></p>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <p class="text-muted">No active courses</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </main>

    <script src="faculty_dashboard.js"></script>
</body>

</html>