<?php
require_once 'config/database.php';
require 'vendor/autoload.php'; // You'll need to install smalot/pdfparser via composer

use Smalot\PdfParser\Parser;

function parseTime($timeStr) {
    // Convert time string to 24-hour format
    $time = DateTime::createFromFormat('h:i A', trim($timeStr));
    if ($time) {
        return $time->format('H:i:s');
    }
    return null;
}

function importSchedule() {
    $database = new Database();
    $db = $database->getConnection();
    
    try {
        // Parse PDF
        $parser = new Parser();
        $pdf = $parser->parseFile('upcoming_class_routine.pdf');
        $text = $pdf->getText();
        
        // Split text into lines
        $lines = explode("\n", $text);
        
        // Process each line
        $current_semester = '';
        $current_course = '';
        $current_section = '';
        $current_day = '';
        $current_time = '';
        $current_room = '';
        $current_faculty = '';
        
        $schedules = [];
        
        foreach ($lines as $line) {
            $line = trim($line);
            
            // Skip empty lines
            if (empty($line)) continue;
            
            // Check for semester
            if (preg_match('/Semester:\s*([^\n]+)/i', $line, $matches)) {
                $current_semester = trim($matches[1]);
                continue;
            }
            
            // Check for course code and title
            if (preg_match('/^([A-Z]+\s+\d+[A-Z]*)\s*-\s*([^\n]+)/', $line, $matches)) {
                $current_course = trim($matches[1]);
                $current_title = trim($matches[2]);
                continue;
            }
            
            // Check for section
            if (preg_match('/Section:\s*([A-Z0-9]+)/i', $line, $matches)) {
                $current_section = trim($matches[1]);
                continue;
            }
            
            // Check for day and time
            if (preg_match('/(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\s*:\s*(\d{1,2}:\d{2}\s*[AP]M\s*-\s*\d{1,2}:\d{2}\s*[AP]M)/i', $line, $matches)) {
                $current_day = trim($matches[1]);
                $time_parts = explode('-', $matches[2]);
                $start_time = parseTime(trim($time_parts[0]));
                $end_time = parseTime(trim($time_parts[1]));
                
                if ($start_time && $end_time) {
                    $schedules[] = [
                        'course_code' => $current_course,
                        'course_title' => $current_title,
                        'section' => $current_section,
                        'day' => $current_day,
                        'start_time' => $start_time,
                        'end_time' => $end_time,
                        'room' => $current_room,
                        'faculty' => $current_faculty,
                        'semester' => $current_semester
                    ];
                }
                continue;
            }
            
            // Check for room
            if (preg_match('/Room:\s*([^\n]+)/i', $line, $matches)) {
                $current_room = trim($matches[1]);
                continue;
            }
            
            // Check for faculty
            if (preg_match('/Faculty:\s*([^\n]+)/i', $line, $matches)) {
                $current_faculty = trim($matches[1]);
                continue;
            }
        }
        
        // Insert schedules into database
        $query = "INSERT INTO course_schedules (course_code, course_title, section, day, start_time, end_time, room, faculty, semester) 
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $db->prepare($query);
        
        foreach ($schedules as $schedule) {
            try {
                $stmt->execute([
                    $schedule['course_code'],
                    $schedule['course_title'],
                    $schedule['section'],
                    $schedule['day'],
                    $schedule['start_time'],
                    $schedule['end_time'],
                    $schedule['room'],
                    $schedule['faculty'],
                    $schedule['semester']
                ]);
            } catch (PDOException $e) {
                // Skip duplicate entries
                if ($e->getCode() == 23000) continue;
                throw $e;
            }
        }
        
        echo "Schedule imported successfully!";
        
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}

// Run the import
importSchedule();
?> 