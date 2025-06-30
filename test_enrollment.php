<?php
session_start();
require_once 'config/database.php';

echo "<h2>Test User Enrollment</h2>";

// Check if user is logged in
if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    echo "<p style='color: red;'>❌ User is NOT logged in!</p>";
    echo "<p>Session data: " . print_r($_SESSION, true) . "</p>";
    echo "<p><a href='login.php'>Please login first</a></p>";
    exit();
}

echo "<p style='color: green;'>✅ User is logged in as: " . $_SESSION["useremail"] . "</p>";

$database = new Database();
$db = $database->getConnection();

// Get user id
$userQuery = "SELECT id FROM users WHERE email = ?";
$userStmt = $db->prepare($userQuery);
$userStmt->execute([$_SESSION["useremail"]]);
$user = $userStmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    echo "<p style='color: red;'>❌ User not found in database!</p>";
    exit();
}

echo "<p>User ID: " . $user['id'] . "</p>";

// Get enrolled courses
$enrollStmt = $db->prepare("SELECT uc.course_code, uc.course_title, se.section FROM student_enrollments se JOIN upcoming_courses uc ON se.course_id = uc.id WHERE se.student_id = ?");
$enrollStmt->execute([$user['id']]);
$enrolledCourses = $enrollStmt->fetchAll(PDO::FETCH_ASSOC);

echo "<h3>Enrolled Courses:</h3>";
if (empty($enrolledCourses)) {
    echo "<p style='color: orange;'>⚠️ No courses enrolled!</p>";
    echo "<p><a href='course_management.php'>Enroll in courses first</a></p>";
} else {
    echo "<table border='1'>";
    echo "<tr><th>Course Code</th><th>Course Title</th><th>Section</th></tr>";
    foreach ($enrolledCourses as $course) {
        echo "<tr>";
        echo "<td>" . $course['course_code'] . "</td>";
        echo "<td>" . $course['course_title'] . "</td>";
        echo "<td>" . $course['section'] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
}
?> 