<?php
session_start();
require_once 'config/database.php';

// Ensure the user is logged in and is a student
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'student') {
    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $student_id = $_SESSION['user_id'];
    $course_id = $_POST['course_id']; // This is the unique ID from upcoming_courses

    if (empty($course_id)) {
        header("Location: dashboard.php?error=nocourse");
        exit();
    }

    $pdo = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);

    // Check if the student is already enrolled in this specific course offering
    $stmt_check = $pdo->prepare("SELECT * FROM student_enrollments WHERE student_id = ? AND course_id = ?");
    $stmt_check->execute([$student_id, $course_id]);
    if ($stmt_check->rowCount() > 0) {
        header("Location: dashboard.php?status=enrolled");
        exit();
    }

    // Check course limit
    $stmt_count = $pdo->prepare("SELECT COUNT(*) FROM student_enrollments WHERE student_id = ?");
    $stmt_count->execute([$student_id]);
    if ($stmt_count->fetchColumn() >= 6) {
        header("Location: dashboard.php?error=limit");
        exit();
    }

    // Get the section from the upcoming_courses table using the ID
    $stmt_get_section = $pdo->prepare("SELECT section FROM upcoming_courses WHERE id = ?");
    $stmt_get_section->execute([$course_id]);
    $course_info = $stmt_get_section->fetch(PDO::FETCH_ASSOC);

    if (!$course_info) {
        // Handle error if course ID is invalid
        header("Location: dashboard.php?error=invalidcourse");
        exit();
    }
    $section = $course_info['section'];

    // Insert the new enrollment including the section
    $stmt_insert = $pdo->prepare("INSERT INTO student_enrollments (student_id, course_id, section) VALUES (?, ?, ?)");
    
    if ($stmt_insert->execute([$student_id, $course_id, $section])) {
        header("Location: dashboard.php?status=added");
        exit();
    } else {
        header("Location: dashboard.php?error=db");
        exit();
    }
} else {
    header("Location: dashboard.php");
    exit();
}
?>