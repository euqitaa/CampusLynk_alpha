<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();

try {
    // Fetch user data
    $userQuery = "SELECT name FROM users WHERE email = ?";
    $userStmt = $db->prepare($userQuery);
    $userStmt->execute([$_SESSION["useremail"]]);
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    echo "<script>alert('Database Error: " . $e->getMessage() . "');</script>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Routine - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/class-routine.css">
</head>

<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Class Routine</h1>
            <p class="text-muted">View your class schedule for the semester</p>
        </section>

        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Time</th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $timeSlots = [
                        '9:00 AM - 10:30 AM',
                        '10:45 AM - 12:15 PM',
                        '12:30 PM - 2:00 PM',
                        '2:15 PM - 3:45 PM',
                        '4:00 PM - 5:30 PM'
                    ];

                    foreach ($timeSlots as $time) {
                        echo '<tr>';
                        echo '<td>' . htmlspecialchars($time) . '</td>';
                        for ($i = 0; $i < 5; $i++) {
                            echo '<td><div class="class-cell">
                                    <span class="class-name">Class ' . ($i + 1) . '</span>
                                    <span class="class-info">Room 101</span>
                                  </div></td>';
                        }
                        echo '</tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </main>
</body>

</html>