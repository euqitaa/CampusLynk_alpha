<?php
require_once 'config/database.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['email']) && isset($_POST['password']) && isset($_POST['name']) && isset($_POST['username']) && isset($_POST['role'])) {
        
        $name = $_POST['name'];
        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $role = $_POST['role'];

        $database = new Database();
        $db = $database->getConnection();
        
        try {
            // Check if email already exists
            $checkEmail = $db->prepare("SELECT * FROM users WHERE email = ?");
            $checkEmail->execute([$email]);
            if ($checkEmail->rowCount() > 0) {
                header("Location: signup.php?error=Email already exists");
                exit();
            }
            
            // Check if username already exists
            $checkUsername = $db->prepare("SELECT * FROM users WHERE username = ?");
            $checkUsername->execute([$username]);
            if ($checkUsername->rowCount() > 0) {
                header("Location: signup.php?error=Username already exists");
                exit();
            }
            
            // Verify password confirmation
            if ($_POST['password'] !== $_POST['password2']) {
                header("Location: signup.php?error=Passwords do not match");
                exit();
            }
            
            $enr_pass = md5($password);
            $signupquery = $db->prepare("INSERT INTO users (username, email, password, role, name) VALUES (?, ?, ?, ?, ?)");
            $signupquery->execute([$username, $email, $enr_pass, $role, $name]);
            
            header("Location: login.php?success=Signup successful! Please login");
            exit();
        } catch (PDOException $ex) {
            header("Location: signup.php?error=Database Error: " . urlencode($ex->getMessage()));
            exit();
        }
    } else {
        header("Location: signup.php?error=Please fill in all fields");
        exit();
    }
} else {
    header("Location: signup.php");
    exit();
}
?>