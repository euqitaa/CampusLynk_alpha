<?php

require_once 'config/database.php';

header('Content-Type: application/json');

if (!isset($_GET['course_code']) || empty($_GET['course_code'])) {
    echo json_encode([]);
    exit;
}

$course_code = $_GET['course_code'];
$sections = [];

try {
    $database = new Database();
    $db = $database->getConnection();

    $query = $db->prepare("SELECT DISTINCT section FROM upcoming_courses WHERE course_code = ? ORDER BY section");
    $query->execute([$course_code]);
    
    $sections = $query->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($sections);

} catch (PDOException $e) {
    // In a real application, you'd want to log this error.
    http_response_code(500);
    echo json_encode(['error' => 'Database error']);
} 