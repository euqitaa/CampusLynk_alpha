<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        $database = new Database();
        $db = $database->getConnection();
        
        // Get current user data
        $query = $db->prepare("SELECT * FROM users WHERE email = ?");
        $query->execute([$_SESSION['useremail']]);
        $user = $query->fetch(PDO::FETCH_ASSOC);
        
        if (!$user) {
            throw new Exception("User not found");
        }
        
        // Verify current password
        if (!password_verify($_POST['current_password'], $user['password'])) {
            throw new Exception("Current password is incorrect");
        }
        
        // Prepare update data
        $name = $_POST['name'];
        $username = $_POST['username'];
        $email = $_POST['email'];
        $updates = ["name = ?", "username = ?", "email = ?"];
        $params = [$name, $username, $email];
        
        // Check if username is changed and unique
        if ($username !== $user['username']) {
            $checkUsername = $db->prepare("SELECT COUNT(*) FROM users WHERE username = ? AND id != ?");
            $checkUsername->execute([$username, $user['id']]);
            if ($checkUsername->fetchColumn() > 0) {
                throw new Exception("Username already exists");
            }
        }
        
        // Handle password update if provided
        if (!empty($_POST['new_password'])) {
            $new_password = password_hash($_POST['new_password'], PASSWORD_DEFAULT);
            $updates[] = "password = ?";
            $params[] = $new_password;
        }
        
        // Add user ID to params
        $params[] = $user['id'];
        
        // Update user data
        $query = $db->prepare("UPDATE users SET " . implode(", ", $updates) . " WHERE id = ?");
        $query->execute($params);
        
        // Update session email if it was changed
        if ($email !== $_SESSION['useremail']) {
            $_SESSION['useremail'] = $email;
        }
        
        // Update session username if it was changed
        if ($username !== $_SESSION['username']) {
            $_SESSION['username'] = $username;
        }
        
        header("Location: profile.php?success=Profile updated successfully");
        exit();
        
    } catch (Exception $e) {
        header("Location: profile.php?error=" . urlencode($e->getMessage()));
        exit();
    }
} else {
    header("Location: profile.php");
    exit();
} 