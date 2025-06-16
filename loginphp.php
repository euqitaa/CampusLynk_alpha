<?php
require_once 'config/database.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {
    if(isset($_POST['myemail']) && isset($_POST['mypass'])) {
        $email = $_POST['myemail'];
        $pass = $_POST['mypass'];
        
        try {
            $database = new Database();
            $db = $database->getConnection();
            
            $loginquery = $db->prepare("SELECT * FROM users WHERE email = ? AND role = 'student'");
            $loginquery->execute([$email]);
            
            $user = $loginquery->fetch(PDO::FETCH_ASSOC);

            if($user) {
                // Verify password for either bcrypt or md5 for legacy support
                if (password_verify($pass, $user['password']) || $user['password'] === md5($pass)) {
                    session_start();
                    $_SESSION['useremail'] = $user['email']; // Store the correct email from DB
                    header("Location: dashboard.php");
                    exit();
                } else {
                    header("Location: login.php?error=Invalid email or password");
                    exit();
                }
            } else {
                header("Location: login.php?error=Invalid email or password");
                exit();
            }
        } catch (PDOException $ex) {
            header("Location: login.php?error=Database Error: " . urlencode($ex->getMessage()));
            exit();
        }
    } else {
        header("Location: login.php?error=Please fill in all fields");
        exit();
    }
} else {
    header("Location: login.php");
    exit();
}
?>