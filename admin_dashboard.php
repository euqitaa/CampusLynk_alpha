<?php
session_start();
require_once 'config/database.php';

if (!isset($_SESSION['admin_email']) || empty($_SESSION['admin_email'])) {
    header('Location: admin_login.php');
    exit();
}

try {
    $db = (new Database())->getConnection();
    $stmt = $db->prepare("SELECT * FROM users WHERE email = ? AND role = 'admin'");
    $stmt->execute([$_SESSION['admin_email']]);
    $admin = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$admin) {
        header('Location: admin_login.php');
        exit();
    }
} catch (PDOException $e) {
    die('Database error: ' . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
</head>
<body>
    <?php include 'admin_sidebar.php'; ?>
    <main class="admin-content">
        <div class="admin-header">
            <div>
                <h1 class="text-2xl font-bold">Admin Dashboard</h1>
                <p class="text-muted">Welcome back, <?php echo htmlspecialchars($admin['name']); ?></p>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h3 class="card-title">Quick Stats</h3>
                <div class="mt-4">
                    <p>Total Courses: <span class="font-semibold">0</span></p>
                    <p>Total Schedules: <span class="font-semibold">0</span></p>
                    <p>Total Users: <span class="font-semibold">0</span></p>
                </div>
            </div>
        </div>
    </main>
</body>
</html> 