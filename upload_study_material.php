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
$course_code = preg_replace('/[^A-Za-z0-9_\-]/', '', $_POST['course_code']);
$target_dir = __DIR__ . "/study_materials/" . $course_code;
if (!is_dir($target_dir)) {
    if (!mkdir($target_dir, 0777, true)) {
        header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=Failed to create course folder.&error=1');
        exit();
    }
}
if (!isset($_FILES['material_file']) || $_FILES['material_file']['error'] !== UPLOAD_ERR_OK) {
    header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=File upload error.&error=1');
    exit();
}
$file = $_FILES['material_file'];
if (strtolower(pathinfo($file['name'], PATHINFO_EXTENSION)) !== 'pdf') {
    header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=Only PDF files allowed.&error=1');
    exit();
}
$target_file = $target_dir . '/' . basename($file['name']);
if (!move_uploaded_file($file['tmp_name'], $target_file)) {
    header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=Failed to save file.&error=1');
    exit();
}
header('Location: course_materials.php?course_code=' . urlencode($course_code) . '&msg=File uploaded successfully.');
exit(); 