<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();

// Move timeOverlap function here so it is only declared once
function timeOverlap($t1, $t2) {
    // Assume format is 'HH:MM-HH:MM' or 'HH:MM'
    if (strpos($t1, '-') !== false) list($s1, $e1) = explode('-', $t1);
    else $s1 = $e1 = $t1;
    if (strpos($t2, '-') !== false) list($s2, $e2) = explode('-', $t2);
    else $s2 = $e2 = $t2;
    return !($e1 <= $s2 || $e2 <= $s1);
}

// Get all available courses
$courses = [];
try {
    $query = "SELECT DISTINCT course_code, course_title FROM course_schedules ORDER BY course_code";
    $stmt = $db->prepare($query);
    $stmt->execute();
    $courses = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "<script>alert('Database Error: " . $e->getMessage() . "');</script>";
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['selected_courses'])) {
    $selected_courses = $_POST['selected_courses'];
    $suggested_routines = [];
    
    try {
        // Get all possible schedules for selected courses
        $placeholders = str_repeat('?,', count($selected_courses) - 1) . '?';
        $query = "SELECT * FROM course_schedules WHERE course_code IN ($placeholders)";
        $stmt = $db->prepare($query);
        $stmt->execute($selected_courses);
        $all_schedules = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        // Group schedules by course
        $course_schedules = [];
        foreach ($all_schedules as $schedule) {
            $course_schedules[$schedule['course_code']][] = $schedule;
        }
        
        // Generate all possible combinations
        function generateCombinations($course_schedules, $current = [], $index = 0) {
            if ($index >= count($course_schedules)) {
                return [$current];
            }
            
            $course_code = array_keys($course_schedules)[$index];
            $schedules = $course_schedules[$course_code];
            $combinations = [];
            
            foreach ($schedules as $schedule) {
                $new_current = array_merge($current, [$schedule]);
                $combinations = array_merge($combinations, generateCombinations($course_schedules, $new_current, $index + 1));
            }
            
            return $combinations;
        }
        
        $all_combinations = generateCombinations($course_schedules);
        
        // Filter valid combinations (no time conflicts)
        foreach ($all_combinations as $combination) {
            $is_valid = true;
            $days_with_classes = [];
            $classes_per_day = [];

            // Check for time conflicts for all days/times
            for ($i = 0; $i < count($combination); $i++) {
                for ($j = $i + 1; $j < count($combination); $j++) {
                    $days_i = array_filter([$combination[$i]['day1'], $combination[$i]['day2']]);
                    $days_j = array_filter([$combination[$j]['day1'], $combination[$j]['day2']]);
                    $times_i = array_filter([$combination[$i]['time1'], $combination[$i]['time2']]);
                    $times_j = array_filter([$combination[$j]['time1'], $combination[$j]['time2']]);
                    foreach ($days_i as $idx_i => $day_i) {
                        foreach ($days_j as $idx_j => $day_j) {
                            if ($day_i === $day_j) {
                                if (isset($times_i[$idx_i]) && isset($times_j[$idx_j])) {
                                    if (timeOverlap($times_i[$idx_i], $times_j[$idx_j])) {
                                        $is_valid = false;
                                        break 3;
                                    }
                                }
                            }
                        }
                    }
                }
                if ($is_valid) {
                    foreach (array_filter([$combination[$i]['day1'], $combination[$i]['day2']]) as $day) {
                        $days_with_classes[$day] = true;
                        $classes_per_day[$day] = ($classes_per_day[$day] ?? 0) + 1;
                        if ($classes_per_day[$day] > 3) {
                            $is_valid = false;
                            break 2;
                        }
                    }
                }
            }
            if ($is_valid) {
                $suggested_routines[] = [
                    'schedules' => $combination,
                    'total_days' => count($days_with_classes),
                    'max_classes_per_day' => empty($classes_per_day) ? 0 : max($classes_per_day)
                ];
            }
        }
        
        // Sort routines by total days and max classes per day
        usort($suggested_routines, function($a, $b) {
            if ($a['total_days'] !== $b['total_days']) {
                return $a['total_days'] - $b['total_days'];
            }
            return $a['max_classes_per_day'] - $b['max_classes_per_day'];
        });
        
        // Save the best routine to database
        if (!empty($suggested_routines)) {
            $best_routine = $suggested_routines[0];
            
            // Get user ID
            $user_query = "SELECT id FROM users WHERE email = ?";
            $user_stmt = $db->prepare($user_query);
            $user_stmt->execute([$_SESSION['useremail']]);
            $user = $user_stmt->fetch(PDO::FETCH_ASSOC);
            
            if ($user) {
                // Insert routine
                $routine_query = "INSERT INTO suggested_routines (student_id, routine_name, total_days, max_classes_per_day) 
                                VALUES (?, ?, ?, ?)";
                $routine_stmt = $db->prepare($routine_query);
                $routine_stmt->execute([
                    $user['id'],
                    'Suggested Routine ' . date('Y-m-d H:i:s'),
                    $best_routine['total_days'],
                    $best_routine['max_classes_per_day']
                ]);
                
                $routine_id = $db->lastInsertId();
                
                // Insert routine courses
                $course_query = "INSERT INTO suggested_routine_courses (routine_id, course_schedule_id) VALUES (?, ?)";
                $course_stmt = $db->prepare($course_query);
                
                foreach ($best_routine['schedules'] as $schedule) {
                    $course_stmt->execute([$routine_id, $schedule['id']]);
                }
            }
        }
        
    } catch (PDOException $e) {
        echo "<script>alert('Database Error: " . $e->getMessage() . "');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Routine Suggestor - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <style>
        .course-selection {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }
        
        .course-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .course-item {
            display: flex;
            align-items: center;
            padding: 0.5rem;
            border: 1px solid #e2e8f0;
            border-radius: 4px;
        }
        
        .course-item input[type="checkbox"] {
            margin-right: 0.5rem;
        }
        
        .suggested-routine {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .routine-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        
        .routine-table th,
        .routine-table td {
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
            text-align: left;
        }
        
        .routine-table th {
            background: #f8fafc;
            font-weight: 600;
        }
        
        .submit-btn {
            background: #4f46e5;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            margin-top: 1rem;
        }
        
        .submit-btn:hover {
            background: #4338ca;
        }
    </style>
</head>
<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Routine Suggestor</h1>
            <p class="text-muted">Select your courses and get the best possible routine</p>
        </section>

        <form method="POST" action="">
            <div class="course-selection">
                <h2>Select Your Courses</h2>
                <div class="course-list">
                    <?php foreach ($courses as $course): ?>
                        <div class="course-item">
                            <input type="checkbox" name="selected_courses[]" value="<?php echo htmlspecialchars($course['course_code']); ?>" id="course_<?php echo htmlspecialchars($course['course_code']); ?>">
                            <label for="course_<?php echo htmlspecialchars($course['course_code']); ?>">
                                <?php echo htmlspecialchars($course['course_code'] . ' - ' . $course['course_title']); ?>
                            </label>
                        </div>
                    <?php endforeach; ?>
                </div>
                <button type="submit" class="submit-btn">Generate Routine</button>
            </div>
        </form>

        <?php if (isset($suggested_routines) && !empty($suggested_routines)): ?>
            <div class="suggested-routine">
                <h2>Best Suggested Routine</h2>
                <p>Total Days: <?php echo $suggested_routines[0]['total_days']; ?></p>
                <p>Maximum Classes per Day: <?php echo $suggested_routines[0]['max_classes_per_day']; ?></p>
                <table class="routine-table">
                    <thead>
                        <tr>
                            <th>Program</th>
                            <th>Course</th>
                            <th>Section</th>
                            <th>Room(s)</th>
                            <th>Day(s)</th>
                            <th>Time(s)</th>
                            <th>Faculty Name</th>
                            <th>Faculty Initial</th>
                            <th>Credit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($suggested_routines[0]['schedules'] as $schedule): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($schedule['program']); ?></td>
                                <td><?php echo htmlspecialchars($schedule['course_code'] . ' - ' . $schedule['course_title']); ?></td>
                                <td><?php echo htmlspecialchars($schedule['section']); ?></td>
                                <td><?php echo htmlspecialchars($schedule['room1']); ?><?php if (!empty($schedule['room2'])) echo ', ' . htmlspecialchars($schedule['room2']); ?></td>
                                <td><?php echo htmlspecialchars($schedule['day1']); ?><?php if (!empty($schedule['day2'])) echo ', ' . htmlspecialchars($schedule['day2']); ?></td>
                                <td><?php echo htmlspecialchars($schedule['time1']); ?><?php if (!empty($schedule['time2'])) echo ', ' . htmlspecialchars($schedule['time2']); ?></td>
                                <td><?php echo htmlspecialchars($schedule['faculty_name']); ?></td>
                                <td><?php echo htmlspecialchars($schedule['faculty_initial']); ?></td>
                                <td><?php echo htmlspecialchars($schedule['credit']); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php endif; ?>
    </main>
</body>
</html> 