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
    $query = "SELECT course_code, MIN(course_title) AS course_title, MIN(id) AS id FROM upcoming_courses GROUP BY course_code ORDER BY MIN(course_title)";
    $stmt = $db->prepare($query);
    $stmt->execute();
    $courses = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
            <?php foreach ($courses as $course): ?>
            <div class="course-card">
                <h3 class="course-title"><?php echo htmlspecialchars($course['course_title']); ?></h3>
                <p class="course-description"><?php echo htmlspecialchars($course['course_code']); ?></p>
                <a href="view_materials.php?course_id=<?php echo $course['id']; ?>" class="btn-view-materials">
                    <i class='bx bx-book-open'></i>
                    <span>View Materials</span>
                </a>
            </div>
            <?php endforeach; ?>
        </div>
    </main>
</body>

</html>

?>