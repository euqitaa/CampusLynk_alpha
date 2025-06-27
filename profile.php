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

        // After fetching $user, fetch university_id if student
        $university_id = null;
        if ($user && isset($user['role']) && $user['role'] === 'student') {
            $stmt = $db->prepare("SELECT university_id FROM student_id_table WHERE user_id = ?");
            $stmt->execute([$user['id']]);
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) $university_id = $row['university_id'];
        }
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
                <h1><?php echo isset($user['username']) ? '@' . htmlspecialchars($user['username']) : 'User'; ?></h1>
                <p class="text-muted"><?php echo isset($user['email']) ? htmlspecialchars($user['email']) : 'No email provided'; ?></p>
                <?php if (isset($user['role'])): ?>
                    <span class="role-badge"><?php echo htmlspecialchars(ucfirst($user['role'])); ?></span>
                <?php endif; ?>
                <?php if ($university_id): ?>
                    <div class="student-id" style="margin-top:0.5rem; color:#64748b; font-size:1rem;">
                        <strong>ID:</strong> <?php echo htmlspecialchars($university_id); ?>
                    </div>
                <?php endif; ?>
            </div>
        </section>
        
        <?php if (isset($_GET['success'])): ?>
            <div class="alert alert-success"><?php echo htmlspecialchars($_GET['success']); ?></div>
        <?php endif; ?>
        <?php if (isset($_GET['error'])): ?>
            <div class="alert alert-danger"><?php echo htmlspecialchars($_GET['error']); ?></div>
        <?php endif; ?>
        <section class="profile-edit-section">
            <h2>Edit Profile</h2>
            <form action="update_profile.php" method="POST" class="form-grid" style="max-width: 420px;">
                <div class="form-group">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" name="name" id="name" class="form-input" value="<?php echo htmlspecialchars($user['name']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" name="username" id="username" class="form-input" value="<?php echo htmlspecialchars($user['username']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" id="email" class="form-input" value="<?php echo htmlspecialchars($user['email']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="current_password" class="form-label">Current Password</label>
                    <input type="password" name="current_password" id="current_password" class="form-input" required placeholder="Enter current password to save changes">
                </div>
                <div class="form-group">
                    <label for="new_password" class="form-label">New Password <span style="color: #888; font-weight: 400;">(leave blank to keep current)</span></label>
                    <input type="password" name="new_password" id="new_password" class="form-input" placeholder="Enter new password (optional)">
                </div>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </form>
        </section>
    </main>
</body>
</html> 