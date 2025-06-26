<?php
header('Content-Type: application/json');

require_once 'config/database.php';

if (!isset($_GET['faculty_id']) || empty($_GET['faculty_id'])) {
    echo json_encode(['error' => 'Faculty ID is required.']);
    exit;
}

$faculty_id = $_GET['faculty_id'];

try {
    $database = new Database();
    $db = $database->getConnection();

    $stmt = $db->prepare("SELECT day_of_week, start_time, end_time FROM counselling_times WHERE faculty_id = ? ORDER BY FIELD(day_of_week, 'Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'), start_time");
    $stmt->execute([$faculty_id]);
    
    $schedule = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($schedule);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
} 