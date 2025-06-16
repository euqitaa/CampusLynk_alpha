<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();
$user = null;
$enrolled_courses = [];

try {
    // Fetch user data
    $userQuery = "SELECT * FROM users WHERE email = ?";
    $userStmt = $db->prepare($userQuery);
    $userStmt->execute([$_SESSION["useremail"]]);
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $userId = $user['id'];

        // Fetch enrolled courses
        $coursesQuery = "
            SELECT 
                se.id as enrollment_id,
                uc.course_code,
                uc.course_title,
                uc.section
            FROM student_enrollments se
            JOIN upcoming_courses uc ON se.course_id = uc.id
            WHERE se.student_id = ?
            ORDER BY uc.course_title
        ";
        $coursesStmt = $db->prepare($coursesQuery);
        $coursesStmt->execute([$userId]);
        $enrolled_courses = $coursesStmt->fetchAll(PDO::FETCH_ASSOC);
    } else {
        // Handle user not found
        session_destroy();
        header("Location: login.php?error=User not found");
        exit();
    }
} catch (PDOException $e) {
    // Handle DB error
    die("Database error. Please try again later.");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/profile.css">
</head>
<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="profile-header">
            <div class="avatar">
                <i class='bx bxs-user'></i>
            </div>
            <div class="profile-info">
                <h1><?php echo isset($user['name']) ? htmlspecialchars($user['name']) : 'User'; ?></h1>
                <p class="text-muted"><?php echo isset($user['email']) ? htmlspecialchars($user['email']) : 'No email provided'; ?></p>
                <?php if (isset($user['role'])): ?>
                    <span class="role-badge"><?php echo htmlspecialchars(ucfirst($user['role'])); ?></span>
                <?php endif; ?>
            </div>
        </section>
        
        <?php if (isset($_GET['success'])): ?>
            <div class="alert alert-success"><?php echo htmlspecialchars($_GET['success']); ?></div>
        <?php endif; ?>
        <?php if (isset($_GET['error'])): ?>
            <div class="alert alert-danger"><?php echo htmlspecialchars($_GET['error']); ?></div>
        <?php endif; ?>

        <section class="enrolled-courses">
            <h2>My Courses</h2>
            <div class="courses-list">
                <?php if (empty($enrolled_courses)): ?>
                    <p>You are not enrolled in any courses.</p>
                <?php else: ?>
                    <?php foreach ($enrolled_courses as $course): ?>
                        <div class="course-item">
                            <div class="course-details">
                                <h3 class="course-title"><?php echo htmlspecialchars($course['course_title']); ?></h3>
                                <p class="course-meta"><?php echo htmlspecialchars($course['course_code']); ?> - Section <?php echo htmlspecialchars($course['section']); ?></p>
                            </div>
                            <form action="unenroll.php" method="POST" onsubmit="return confirm('Are you sure you want to unenroll from this course?');">
                                <input type="hidden" name="enrollment_id" value="<?php echo $course['enrollment_id']; ?>">
                                <button type="submit" class="btn-unenroll">
                                    <i class='bx bx-trash'></i>
                                    <span>Remove</span>
                                </button>
                            </form>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </section>
    </main>
</body>
</html> 