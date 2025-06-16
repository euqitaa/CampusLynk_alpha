<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

try {
    $database = new Database();
    $db = $database->getConnection();
    
    $query = $db->prepare("SELECT * FROM users WHERE email = ?");
    $query->execute([$_SESSION['useremail']]);
    $user = $query->fetch(PDO::FETCH_ASSOC);
    
    if (!$user) {
        session_destroy();
        header("Location: login.php?error=User not found");
        exit();
    }
} catch (PDOException $e) {
    header("Location: login.php?error=Database Error: " . urlencode($e->getMessage()));
    exit();
}

// Get current page for active state
$current_page = basename($_SERVER['PHP_SELF']);
?>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<aside class="sidebar">
    <div class="sidebar-header">
        <div class="logo-and-title-div">
            <a href="dashboard.php" class="navbar-brand">CampusLynk</a>
        </div>
        <a href="profile.php" class="user-info">
            <div class="user-avatar">
                <i class='bx bxs-user-circle'></i>
            </div>
            <div class="user-details">
                <h3 class="user-name"><?php echo htmlspecialchars($user['name']); ?></h3>
                <p class="user-email"><?php echo htmlspecialchars($_SESSION['useremail']); ?></p>
            </div>
        </a>
    </div>

    <div class="sidebar-content">
        <ul class="nav-links">
            <li>
                <a href="dashboard.php" class="nav-link <?php echo $current_page === 'dashboard.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-dashboard'></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="study-materials.php" class="nav-link <?php echo $current_page === 'study-materials.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-book'></i>
                    <span>Study Materials</span>
                </a>
            </li>
            <li>
                <a href="class_routine1.php" class="nav-link <?php echo $current_page === 'class_routine1.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-calendar'></i>
                    <span>Class Routine</span>
                </a>
            </li>
            <li>
                <a href="exam_schedule.php" class="nav-link <?php echo $current_page === 'exam_schedule.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-time'></i>
                    <span>Exam Schedule</span>
                </a>
            </li>
            <li>
                <a href="eventpage.php" class="nav-link <?php echo $current_page === 'eventpage.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-calendar-event'></i>
                    <span>Events</span>
                </a>
            </li>
            <li>
                <a href="faculty.php" class="nav-link <?php echo $current_page === 'faculty.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-user-badge'></i>
                    <span>Faculty</span>
                </a>
            </li>
            <li>
                <a href="email_assistant.php" class="nav-link <?php echo $current_page === 'email_assistant.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-envelope'></i>
                    <span>Email Generator</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="sidebar-footer">
        <a href="logout.php" class="logout-btn">
            <i class='bx bxs-log-out'></i>
            <span>Logout</span>
        </a>
    </div>
</aside>

<button class="mobile-menu-toggle" id="mobileMenuToggle">
    <i class='bx bx-menu'></i>
</button>

<script>
document.getElementById('mobileMenuToggle').addEventListener('click', function() {
    document.querySelector('.sidebar').classList.toggle('active');
    this.querySelector('i').classList.toggle('bx-menu');
    this.querySelector('i').classList.toggle('bx-x');
});
</script>