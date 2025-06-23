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
        .shadcn-card { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); padding: 2rem; margin-bottom: 2rem; }
        .shadcn-label { font-weight: 600; margin-bottom: 0.5rem; display: block; }
        .shadcn-search { width: 100%; padding: 0.75rem 1rem; border: 1px solid #e5e7eb; border-radius: 8px; font-size: 1rem; margin-bottom: 1rem; }
        .shadcn-dropdown { max-height: 200px; overflow-y: auto; border: 1px solid #e5e7eb; border-radius: 8px; background: #fff; position: absolute; width: 100%; z-index: 10; }
        .shadcn-dropdown-item { padding: 0.5rem 1rem; cursor: pointer; }
        .shadcn-dropdown-item:hover { background: #f3f4f6; }
        .shadcn-chips { display: flex; flex-wrap: wrap; gap: 0.5rem; margin-bottom: 1rem; }
        .shadcn-chip { background: #f3f4f6; border-radius: 999px; padding: 0.4rem 1rem; display: flex; align-items: center; font-size: 0.95rem; }
        .shadcn-chip-remove { margin-left: 0.5rem; color: #888; cursor: pointer; font-size: 1.1rem; }
        .shadcn-btn { background: #111827; color: #fff; border: none; border-radius: 8px; padding: 0.7rem 1.5rem; font-weight: 600; font-size: 1rem; cursor: pointer; transition: background 0.2s; }
        .shadcn-btn:hover { background: #374151; }
        .routine-table { width: 100%; border-collapse: collapse; margin-top: 2rem; }
        .routine-table th, .routine-table td { border: 1px solid #e5e7eb; padding: 0.5rem 1rem; text-align: left; }
        .routine-table th { background: #f9fafb; }
        .routine-alternatives { margin-top: 2rem; }
        .routine-alternatives h3 { margin-bottom: 1rem; }
    </style>
</head>
<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Routine Suggestor</h1>
            <p class="text-muted">Select your courses and get the best possible routine</p>
        </section>

        <div class="shadcn-card">
            <form id="routineForm" method="post">
                <label class="shadcn-label">Select Courses</label>
                <div style="position:relative; max-width:500px;">
                    <input type="text" id="courseSearch" class="shadcn-search" placeholder="Search and select courses..." autocomplete="off">
                    <div id="dropdown" class="shadcn-dropdown" style="display:none;"></div>
                </div>
                <div class="shadcn-chips" id="selectedChips"></div>
                <button type="submit" class="shadcn-btn">Generate Routine</button>
            </form>
        </div>

        <div id="routineResults">
            <?php if (isset($suggested_routines) && !empty($suggested_routines)): ?>
                <h2>Best Suggested Routine</h2>
                <?php $best = $suggested_routines[0]; ?>
                <table class="routine-table">
                    <thead>
                        <tr>
                            <th>Course</th><th>Section</th><th>Room 1</th><th>Room 2</th><th>Day 1</th><th>Time 1</th><th>Day 2</th><th>Time 2</th><th>Faculty</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($best['schedules'] as $row): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['course_code']); ?></td>
                            <td><?php echo htmlspecialchars($row['section']); ?></td>
                            <td><?php echo htmlspecialchars($row['room1']); ?></td>
                            <td><?php echo htmlspecialchars($row['room2']); ?></td>
                            <td><?php echo htmlspecialchars($row['day1']); ?></td>
                            <td><?php echo htmlspecialchars($row['time1']); ?></td>
                            <td><?php echo htmlspecialchars($row['day2']); ?></td>
                            <td><?php echo htmlspecialchars($row['time2']); ?></td>
                            <td><?php echo htmlspecialchars($row['faculty_name']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
                <?php if (count($suggested_routines) > 1): ?>
                <div class="routine-alternatives">
                    <h3>Other Possible Routines</h3>
                    <?php for ($i = 1; $i < min(6, count($suggested_routines)); $i++): ?>
                        <table class="routine-table" style="margin-bottom:1.5rem;">
                            <thead>
                                <tr>
                                    <th>Course</th><th>Section</th><th>Room 1</th><th>Room 2</th><th>Day 1</th><th>Time 1</th><th>Day 2</th><th>Time 2</th><th>Faculty</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($suggested_routines[$i]['schedules'] as $row): ?>
                                <tr>
                                    <td><?php echo htmlspecialchars($row['course_code']); ?></td>
                                    <td><?php echo htmlspecialchars($row['section']); ?></td>
                                    <td><?php echo htmlspecialchars($row['room1']); ?></td>
                                    <td><?php echo htmlspecialchars($row['room2']); ?></td>
                                    <td><?php echo htmlspecialchars($row['day1']); ?></td>
                                    <td><?php echo htmlspecialchars($row['time1']); ?></td>
                                    <td><?php echo htmlspecialchars($row['day2']); ?></td>
                                    <td><?php echo htmlspecialchars($row['time2']); ?></td>
                                    <td><?php echo htmlspecialchars($row['faculty_name']); ?></td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php endfor; ?>
                </div>
                <?php endif; ?>
            <?php endif; ?>
        </div>
    </main>

    <script>
    // Inject allCourses for JS file
    window.allCourses = <?php echo json_encode($courses); ?>;
    </script>
    <script src="js/routine_suggestor.js"></script>
</body>
</html> 