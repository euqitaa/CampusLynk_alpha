<?php
require_once 'config/database.php';

$email = $_GET['email'] ?? '';
$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $new_password = $_POST['new_password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';
    if (!$new_password || !$confirm_password) {
        $error = 'Please fill in all fields.';
    } elseif ($new_password !== $confirm_password) {
        $error = 'Passwords do not match.';
    } else {
        $database = new Database();
        $db = $database->getConnection();
        $stmt = $db->prepare('SELECT * FROM users WHERE email = ?');
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($user) {
            $hashed = password_hash($new_password, PASSWORD_DEFAULT);
            $update = $db->prepare('UPDATE users SET password = ? WHERE email = ?');
            $update->execute([$hashed, $email]);
            $success = 'Password updated successfully! <a href="login.php">Sign in</a>';
        } else {
            $error = 'Invalid email.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="auth.css">
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
                <h2 class="text-2xl font-semibold mb-4">Reset your password</h2>
                <p class="text-lg text-muted">Set a new password for your account below.</p>
            </div>
        </div>
        <!-- Right Box - Reset Password Form -->
        <div class="auth-right">
            <div class="auth-form-container" style="box-shadow: var(--shadow-md); background: var(--background); border-radius: var(--radius); padding: 2rem;">
                <h2 class="text-2xl font-semibold mb-6">Reset Password</h2>
                <?php if (!empty($error)): ?>
                    <div class="alert alert-error mb-4"><?php echo htmlspecialchars($error); ?></div>
                <?php endif; ?>
                <?php if (!empty($success)): ?>
                    <div class="alert alert-success mb-4"><?php echo $success; ?></div>
                <?php else: ?>
                <form action="reset_password.php" method="POST" class="auth-form">
                    <input type="hidden" name="email" value="<?php echo htmlspecialchars($email); ?>">
                    <div class="form-group">
                        <label class="form-label">New Password</label>
                        <div class="input-with-icon">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" name="new_password" required class="form-input" placeholder="Enter new password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Confirm New Password</label>
                        <div class="input-with-icon">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" name="confirm_password" required class="form-input" placeholder="Confirm new password">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-full">Reset Password</button>
                </form>
                <?php endif; ?>
                <p class="text-muted text-center mt-6">
                    <a href="login.php" class="text-primary font-medium">Back to Sign In</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html> 