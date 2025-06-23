<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Login - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header class="navbar">
        <div class="logo-and-title-div">
            <span class="text-lg">🎓</span>
            <p class="navbar-brand">CampusLynk</p>
        </div>
        <p class="text-muted font-medium">FACULTY LOGIN</p>
    </header>
    
    <main class="container-sm">
        <div class="card">
            <?php
            if(isset($_GET['error'])) {
                echo '<div class="text-destructive">' . htmlspecialchars($_GET['error']) . '</div>';
            }
            ?>
            <form action="faculty_login_php.php" method="POST">
                <div class="form-group">
                    <label class="form-label">📧 Email</label>
                    <input type="email" name="myemail" required class="form-input">
                </div>
                
                <div class="form-group">
                    <label class="form-label">🔒 Password</label>
                    <div style="position:relative;">
                        <input type="password" name="mypass" id="faculty-login-password" required class="form-input">
                        <button type="button" onclick="togglePassword('faculty-login-password', this)" tabindex="-1" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); background:none; border:none; cursor:pointer;">
                            <i class='bx bx-show'></i>
                        </button>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary">Login</button>
                
                <p class="text-muted text-center mt-6">
                    <a href="first.php" class="text-primary">← Back to Role Selection</a>
                </p>
            </form>
        </div>
    </main>
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
</script>
</html>