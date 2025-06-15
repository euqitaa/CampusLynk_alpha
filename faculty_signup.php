<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Signup - CampusLynk</title>
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
        <p class="text-muted font-medium">FACULTY SIGNUP</p>
    </header>
    
    <main class="container-sm">
        <div class="card">
            <form action="signupphp.php" method="POST">
                <div class="form-group">
                    <label class="form-label">👤 Full Name</label>
                    <input type="text" name="myname" required class="form-input">
                </div>

                <div class="form-group">
                    <label class="form-label">👨‍🏫 Designation</label>
                    <select name="myprofession" required class="form-input">
                        <option value="" disabled selected>Select your designation</option>
                        <option value="Lecturer">Lecturer</option>
                        <option value="Assistant Professor">Assistant Professor</option>
                        <option value="Associate Professor">Associate Professor</option>
                        <option value="Professor">Professor</option>
                        <option value="Vice Chancellor">Vice Chancellor</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label">📧 Email</label>
                    <input type="email" name="myemail" required class="form-input">
                </div>
                
                <div class="form-group">
                    <label class="form-label">🔒 Password</label>
                    <input type="password" name="mypass" required class="form-input" minlength="8" maxlength="20">
                </div>
                
                <button type="submit" class="btn btn-primary">Sign Up</button>
                
                <p class="text-muted text-center mt-6">
                    <a href="faculty_login.php" class="text-primary">← Back to Login</a>
                </p>
            </form>
        </div>
    </main>
</body>
</html>