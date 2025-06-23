<?php
require_once 'config/database.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {
    if(isset($_POST['myemail']) && isset($_POST['mypass'])) {
        $email = $_POST['myemail'];
        $pass = $_POST['mypass'];
        try {
            $database = new Database();
            $db = $database->getConnection();
            $loginquery = $db->prepare("SELECT * FROM users WHERE email = ? AND role = 'faculty'");
            $loginquery->execute([$email]);
            $user = $loginquery->fetch(PDO::FETCH_ASSOC);
            if($user) {
                // Support both bcrypt and md5
                if (password_verify($pass, $user['password']) || $user['password'] === md5($pass)) {
                    session_start();
                    $_SESSION['useremail'] = $user['email'];
                    header("Location: faculty_dashboard.php");
                    exit();
                } else {
                    header("Location: faculty_login.php?error=Invalid email or password");
                    exit();
                }
            } else {
                header("Location: faculty_login.php?error=Invalid email or password");
                exit();
            }
        } catch (PDOException $ex) {
            header("Location: faculty_login.php?error=Database Error: " . urlencode($ex->getMessage()));
            exit();
        }
    } else {
        header("Location: faculty_login.php?error=Please fill in all fields");
        exit();
    }
} else {
    header("Location: faculty_login.php");
    exit();
}
?>