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
                <form action="signupphp.php" method="POST" class="auth-form">
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
                            <select name="role" required class="form-input">
                                <option value="">Select your role</option>
                                <option value="student">Student</option>
                                <option value="teacher">Teacher</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Password</label>
                        <div class="input-with-icon">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" name="password" required class="form-input" placeholder="Create a password">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Confirm Password</label>
                        <div class="input-with-icon">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" name="password2" required class="form-input" placeholder="Confirm your password">
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
</html>