<?php
require_once 'config/database.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {
    if(isset($_POST['myemail']) && isset($_POST['mypass'])) {
        $email = $_POST['myemail'];
        $pass = $_POST['mypass'];
        
        try {
            $database = new Database();
            $db = $database->getConnection();
            
            $encd_pass = md5($pass);
            
            $loginquery = $db->prepare("SELECT * FROM users WHERE email = ? AND password = ? AND role = 'student'");
            $loginquery->execute([$email, $encd_pass]);
            
            if($loginquery->rowCount() == 1) {
                session_start();
                $_SESSION['useremail'] = $email;
                header("Location: dashboard.php");
                exit();
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