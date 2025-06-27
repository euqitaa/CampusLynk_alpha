<?php
session_start();
header('Content-Type: application/json');
require_once 'config/database.php';

// Check if user is logged in and is a student
if (!isset($_SESSION['useremail']) || !isset($_SESSION['role']) || $_SESSION['role'] !== 'student') {
    http_response_code(403);
    echo json_encode(['error' => 'You must be logged in as a student to make a request.']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);

if (!$input || !isset($input['faculty_id']) || !isset($input['requested_time'])) {
    http_response_code(400);
    echo json_encode(['error' => 'Invalid input. Faculty ID and time slot are required.']);
    exit;
}

$faculty_id = $input['faculty_id'];
$requested_time = $input['requested_time'];
$student_email = $_SESSION['useremail'];

try {
    $database = new Database();
    $db = $database->getConnection();

    // Get student ID from email
    $student_stmt = $db->prepare("SELECT id FROM users WHERE email = ?");
    $student_stmt->execute([$student_email]);
    $student = $student_stmt->fetch(PDO::FETCH_ASSOC);
    if (!$student) {
        http_response_code(404);
        echo json_encode(['error' => 'Student user not found.']);
        exit;
    }
    $student_id = $student['id'];
    
    // Check for existing pending request for the same slot with the same faculty
    $check_stmt = $db->prepare("SELECT id FROM counselling_requests WHERE student_id = ? AND faculty_id = ? AND requested_time = ? AND status = 'pending'");
    $check_stmt->execute([$student_id, $faculty_id, $requested_time]);
    if ($check_stmt->fetch()) {
        http_response_code(409); // Conflict
        echo json_encode(['error' => 'You already have a pending request for this time slot with this faculty member.']);
        exit;
    }

    // Insert new request
    $insert_stmt = $db->prepare("INSERT INTO counselling_requests (student_id, faculty_id, requested_time, status) VALUES (?, ?, ?, 'pending')");
    $insert_stmt->execute([$student_id, $faculty_id, $requested_time]);

    echo json_encode(['success' => 'Your request has been sent successfully.']);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
} 