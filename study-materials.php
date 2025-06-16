<?php

session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();
$courses = [];

try {
    // Fetch user id
    $userQuery = $db->prepare("SELECT id FROM users WHERE email = ?");
    $userQuery->execute([$_SESSION['useremail']]);
    $user = $userQuery->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $userId = $user['id'];

        // Fetch only the courses the student is enrolled in
        $query = "
            SELECT
                uc.course_code,
                MIN(uc.course_title) AS course_title
            FROM student_enrollments se
            JOIN upcoming_courses uc ON se.course_id = uc.id
            WHERE se.student_id = ?
            GROUP BY uc.course_code
            ORDER BY MIN(uc.course_title)
        ";
        $stmt = $db->prepare($query);
        $stmt->execute([$userId]);
        $courses = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
    <title>Study Materials - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/study-materials.css">
</head>

<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Study Materials</h1>
            <p class="text-muted">Access your course materials and resources</p>
        </section>

        <div class="course-grid">
            <?php if (empty($courses)): ?>
                <div class="empty-state-container">
                    <p>You are not enrolled in any courses yet. Please enroll in a course to see its materials.</p>
                </div>
            <?php else: ?>
                <?php foreach ($courses as $course): ?>
                <div class="course-card">
                    <h3 class="course-title"><?php echo htmlspecialchars($course['course_title']); ?></h3>
                    <p class="course-description"><?php echo htmlspecialchars($course['course_code']); ?></p>
                    <a href="course_materials.php?course_code=<?php echo urlencode($course['course_code']); ?>" class="btn-view-materials">
                        <i class='bx bx-book-open'></i>
                        <span>View Materials</span>
                    </a>
                </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </main>
</body>

</html>