<?php
session_start();
if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

if (!isset($_POST['course_code']) || empty($_POST['course_code'])) {
    header('Location: course_materials.php?msg=No course code provided.&error=1');
    exit();
}
// Allow spaces in course code for folder name, but remove dangerous characters
$course_code = preg_replace('/[^A-Za-z0-9 _\-]/', '', $_POST['course_code']);
$user_email = $_SESSION['useremail'];
$user_role = isset($_SESSION['role']) ? $_SESSION['role'] : 'student';

if (!isset($_FILES['material_file']) || $_FILES['material_file']['error'] !== UPLOAD_ERR_OK) {
    header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=File upload error.&error=1');
    exit();
}
$file = $_FILES['material_file'];
if (strtolower(pathinfo($file['name'], PATHINFO_EXTENSION)) !== 'pdf') {
    header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=Only PDF files allowed.&error=1');
    exit();
}
$filename = basename($file['name']);

if ($user_role === 'faculty') {
    $target_dir = __DIR__ . "/study_materials/" . $course_code;
    if (!is_dir($target_dir)) {
        if (!mkdir($target_dir, 0777, true)) {
            header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=Failed to create course folder.&error=1');
            exit();
        }
    }
    $target_file = $target_dir . '/' . $filename;
    if (!move_uploaded_file($file['tmp_name'], $target_file)) {
        header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=Failed to save file.&error=1');
        exit();
    }
    header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=File uploaded successfully.');
    exit();
} else {
    // Student: Save to pending_materials and insert DB record
    $pending_dir = __DIR__ . "/pending_materials/" . $course_code;
    if (!is_dir($pending_dir)) {
        if (!mkdir($pending_dir, 0777, true)) {
            header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=Failed to create pending folder.&error=1');
            exit();
        }
    }
    $pending_file = $pending_dir . '/' . $filename;
    if (!move_uploaded_file($file['tmp_name'], $pending_file)) {
        header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=Failed to save file for review.&error=1');
        exit();
    }
    // Insert pending record in DB
    require_once 'config/database.php';
    $db = (new Database())->getConnection();
    $stmt = $db->prepare("INSERT INTO pending_materials (course_code, filename, uploader_email, uploaded_at, status, original_path) VALUES (?, ?, ?, NOW(), 'pending', ?)");
    $stmt->execute([$course_code, $filename, $user_email, $pending_file]);
    header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=File submitted for admin review.');
    exit();
} 