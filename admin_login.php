<?php
require_once 'config/database.php';
session_start();

$message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    
    try {
        $db = (new Database())->getConnection();
        $stmt = $db->prepare("SELECT * FROM users WHERE email = ? AND role = 'admin'");
        $stmt->execute([$email]);
        $admin = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($admin && (password_verify($password, $admin['password']) || $admin['password'] === md5($password))) {
            $_SESSION['admin_email'] = $admin['email'];
            $_SESSION['admin_id'] = $admin['id'];
            header('Location: admin_dashboard.php');
            exit();
        } else {
            $message = 'Invalid credentials.';
        }
    } catch (PDOException $e) {
        $message = 'Database error: ' . $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
</head>
<body class="auth-page">
    <div class="auth-container">
        <!-- Left Box - Branding and Message -->
        <div class="auth-left">
            <a href="index.php" class="back-home">
                <i class='bx bx-arrow-back'></i>
                Back to Home
            </a>
            <div class="auth-brand">
                <span class="text-4xl">🎓</span>
                <h1 class="text-3xl font-bold">CampusLynk</h1>
            </div>
            <div class="auth-message">
                <h2 class="text-2xl font-semibold mb-4">Admin Portal</h2>
                <p class="text-lg text-muted">Access the administrative dashboard to manage campus resources and schedules.</p>
            </div>
        </div>

        <!-- Right Box - Login Form -->
        <div class="auth-right">
            <div class="auth-form-container">
                <h2 class="text-2xl font-semibold mb-6">Admin Login</h2>
                <?php if ($message): ?>
                    <div class="alert alert-error mb-4"><?php echo htmlspecialchars($message); ?></div>
                <?php endif; ?>
                <form method="POST" class="auth-form">
                    <div class="form-group">
                        <label class="form-label">Email</label>
                        <div class="input-with-icon">
                            <i class='bx bx-envelope'></i>
                            <input type="email" name="email" required class="form-input" placeholder="Enter your email">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Password</label>
                        <div class="input-with-icon">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" name="password" required class="form-input" placeholder="Enter your password">
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-full">Sign In</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html> 