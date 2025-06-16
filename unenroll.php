<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['enrollment_id'])) {
    header("Location: profile.php?error=Invalid request.");
    exit();
}

require_once 'config/database.php';

$enrollment_id = $_POST['enrollment_id'];

try {
    $database = new Database();
    $db = $database->getConnection();

    // Get user ID to ensure ownership
    $userQuery = "SELECT id FROM users WHERE email = ?";
    $userStmt = $db->prepare($userQuery);
    $userStmt->execute([$_SESSION["useremail"]]);
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        header("Location: profile.php?error=User not found.");
        exit();
    }
    $userId = $user['id'];

    // Delete the enrollment record, ensuring the user owns it
    $deleteQuery = "DELETE FROM student_enrollments WHERE id = ? AND student_id = ?";
    $deleteStmt = $db->prepare($deleteQuery);
    $deleteStmt->execute([$enrollment_id, $userId]);

    if ($deleteStmt->rowCount() > 0) {
        header("Location: profile.php?success=Successfully unenrolled from the course.");
    } else {
        header("Location: profile.php?error=Could not unenroll. You may not have permission or the enrollment does not exist.");
    }
    exit();

} catch (PDOException $e) {
    header("Location: profile.php?error=Database error occurred.");
    exit();
}
?> 