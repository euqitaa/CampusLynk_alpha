<?php
require_once 'config/database.php';

$message = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name'] ?? '');
    $username = trim($_POST['username'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $role = $_POST['role'] ?? 'student';
    $university_id = $_POST['university_id'] ?? null;
    $password = $_POST['password'] ?? '';
    $password2 = $_POST['password2'] ?? '';

    if (empty($name) || empty($username) || empty($email) || empty($password) || empty($password2)) {
        $error = 'All fields are required.';
    } elseif ($password !== $password2) {
        $error = 'Passwords do not match.';
    } elseif (strlen($password) < 8) {
        $error = 'Password must be at least 8 characters long.';
    } elseif ($role === 'student' && (empty($university_id) || !preg_match('/^0[0-9]{8,}$/', $university_id))) {
        $error = 'A valid University ID is required for students.';
    } else {
        try {
            $db = (new Database())->getConnection();
            // Check if email or username already exists
            $stmt = $db->prepare("SELECT COUNT(*) FROM users WHERE email = ? OR username = ?");
            $stmt->execute([$email, $username]);
            if ($stmt->fetchColumn() > 0) {
                $error = 'Email or username already exists.';
            } else {
                $hash = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $db->prepare("INSERT INTO users (name, username, email, password, role) VALUES (?, ?, ?, ?, ?)");
                $stmt->execute([$name, $username, $email, $hash, $role]);
                // Optionally, store university_id in a separate table if needed
                header('Location: login.php?success=Account created successfully! Please sign in.');
                exit();
            }
        } catch (PDOException $e) {
            $error = 'Database error: ' . $e->getMessage();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - CampusLynk</title>
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
                <h2 class="text-2xl font-semibold mb-4">Join Our Community!</h2>
                <p class="text-lg text-muted">Create your account to access study materials, connect with faculty, and stay updated with campus events.</p>
            </div>
        </div>

        <!-- Right Box - Signup Form -->
        <div class="auth-right">
            <div class="auth-form-container">
                <h2 class="text-2xl font-semibold mb-6">Create Account</h2>
                <?php
                if(isset($_GET['error'])) {
                    echo '<div class="alert alert-error mb-4">' . htmlspecialchars($_GET['error']) . '</div>';
                }
                ?>
                <form action="signup.php" method="POST" class="auth-form">
                    <div class="form-group">
                        <label class="form-label">Full Name</label>
                        <div class="input-with-icon">
                            <i class='bx bx-user'></i>
                            <input type="text" name="name" required class="form-input" placeholder="Enter your full name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Username</label>
                        <div class="input-with-icon">
                            <i class='bx bx-user-circle'></i>
                            <input type="text" name="username" required class="form-input" placeholder="Choose a username">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Email</label>
                        <div class="input-with-icon">
                            <i class='bx bx-envelope'></i>
                            <input type="email" name="email" required class="form-input" placeholder="Enter your email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Role</label>
                        <div class="input-with-icon">
                            <i class='bx bx-user-pin'></i>
                            <select name="role" id="role" class="form-input" required onchange="toggleStudentIdField()">
                                <option value="student">Student</option>
                                <option value="faculty">Faculty</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="student-id-group" style="display:none;">
                        <label class="form-label">University ID</label>
                        <div class="input-with-icon">
                            <i class='bx bx-id-card'></i>
                            <input type="text" name="university_id" id="university_id" class="form-input" pattern="0[0-9]{8,}" maxlength="20" placeholder="e.g. 011221521">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Password</label>
                        <div class="input-with-icon" style="position:relative;">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" name="password" id="signup-password" required class="form-input" placeholder="Create a password">
                            <button type="button" onclick="togglePassword('signup-password', this)" tabindex="-1" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); background:none; border:none; cursor:pointer;">
                                <i class='bx bx-show'></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Confirm Password</label>
                        <div class="input-with-icon" style="position:relative;">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" name="password2" id="signup-password2" required class="form-input" placeholder="Confirm your password">
                            <button type="button" onclick="togglePassword('signup-password2', this)" tabindex="-1" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); background:none; border:none; cursor:pointer;">
                                <i class='bx bx-show'></i>
                            </button>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-full">Create Account</button>
                    
                    <p class="text-muted text-center mt-6">
                        Already have an account? <a href="login.php" class="text-primary font-medium">Sign In</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</body>
<script>
function togglePassword(inputId, btn) {
    const input = document.getElementById(inputId);
    const icon = btn.querySelector('i');
    if (input.type === 'password') {
        input.type = 'text';
        icon.classList.remove('bx-show');
        icon.classList.add('bx-hide');
    } else {
        input.type = 'password';
        icon.classList.remove('bx-hide');
        icon.classList.add('bx-show');
    }
}
function toggleStudentIdField() {
    var role = document.getElementById('role').value;
    var group = document.getElementById('student-id-group');
    group.style.display = (role === 'student') ? 'block' : 'none';
}
document.addEventListener('DOMContentLoaded', function() {
    toggleStudentIdField();
});
</script>
</html>