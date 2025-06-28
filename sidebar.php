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
    $sidebar_database = new Database();
    $sidebar_db = $sidebar_database->getConnection();
    
    $sidebar_query = $sidebar_db->prepare("SELECT * FROM users WHERE email = ?");
    $sidebar_query->execute([$_SESSION['useremail']]);
    $sidebar_user = $sidebar_query->fetch(PDO::FETCH_ASSOC);
    
    if (!$sidebar_user) {
        session_destroy();
        header("Location: login.php?error=User not found");
        exit();
    }
} catch (PDOException $e) {
    header("Location: login.php?error=Database Error: " . urlencode($e->getMessage()));
    exit();
}

$current_page = basename($_SERVER['PHP_SELF']);
$role = $sidebar_user['role'];
?>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<aside class="sidebar">
    <div class="sidebar-header">
        <div class="logo-and-title-div">
            <div class="sidebar-brand">
                <a href="index.php" class="navbar-brand sidebar-logo"><span>CampusLynk</span></a>
            </div>
        </div>
        <a href="<?php echo $role === 'faculty' ? 'faculty_dashboard.php' : ($role === 'admin' ? 'admin_dashboard.php' : 'profile.php'); ?>" class="user-info">
            <div class="user-avatar">
                <i class='bx bxs-user-circle'></i>
            </div>
            <div class="user-details">
                <h3 class="user-name"><?php echo '@' . htmlspecialchars($sidebar_user['username']); ?></h3>
                <p class="user-email"><?php echo htmlspecialchars($sidebar_user['email']); ?></p>
            </div>
        </a>
    </div>
    <div class="sidebar-content">
        <ul class="nav-links">
            <?php if ($role === 'admin'): ?>
                <li>
                    <a href="admin_dashboard.php" class="nav-link <?php echo $current_page === 'admin_dashboard.php' ? 'active' : ''; ?>">
                        <i class='bx bxs-dashboard'></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="admin_dataimport.php" class="nav-link <?php echo $current_page === 'admin_dataimport.php' ? 'active' : ''; ?>">
                        <i class='bx bxs-file-import'></i>
                        <span>Upcoming Class Import</span>
                    </a>
                </li>
                <li>
                    <a href="admin_exam_import.php" class="nav-link <?php echo $current_page === 'admin_exam_import.php' ? 'active' : ''; ?>">
                        <i class='bx bxs-calendar-event'></i>
                        <span>Exam Schedule Importer</span>
                    </a>
                </li>
                <li>
                    <a href="admin_class_schedule.php" class="nav-link <?php echo $current_page === 'admin_class_schedule.php' ? 'active' : ''; ?>">
                        <i class='bx bx-calendar'></i>
                        <span>Ongoing Class Schedule</span>
                    </a>
                </li>
                <li>
                    <a href="admin_users.php" class="nav-link <?php echo $current_page === 'admin_users.php' ? 'active' : ''; ?>">
                        <i class='bx bxs-user-detail'></i>
                        <span>User Management</span>
                    </a>
                </li>
                <li>
                    <a href="admin_event_management.php" class="nav-link <?php echo $current_page === 'admin_event_management.php' ? 'active' : ''; ?>">
                        <i class='bx bx-calendar-plus'></i>
                        <span>Event Management</span>
                    </a>
                </li>
                
                <li>
                    <a href="admin_review_materials.php" class="nav-link <?php echo $current_page === 'admin_review_materials.php' ? 'active' : ''; ?>">
                        <i class='bx bx-task'></i>
                        <span>Review Materials</span>
                    </a>
                </li>
                <li>
                    <a href="admin_settings.php" class="nav-link <?php echo $current_page === 'admin_settings.php' ? 'active' : ''; ?>">
                        <i class='bx bxs-cog'></i>
                        <span>Settings</span>
                    </a>
                </li>
            <?php elseif ($role === 'faculty'): ?>
                <li>
                    <a href="faculty_dashboard.php" class="nav-link <?php echo $current_page === 'faculty_dashboard.php' ? 'active' : ''; ?>">
                        <i class='bx bxs-dashboard'></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="faculty_counselling_schedule.php" class="nav-link <?php echo $current_page === 'faculty_counselling_schedule.php' ? 'active' : ''; ?>">
                        <i class='bx bx-calendar-plus'></i>
                        <span>Counselling Schedule</span>
                    </a>
                </li>
                <li>
                    <a href="faculty_counselling_requests.php" class="nav-link <?php echo $current_page === 'faculty_counselling_requests.php' ? 'active' : ''; ?>">
                        <i class='bx bx-envelope'></i>
                        <span>Counselling Requests</span>
                    </a>
                </li>
                <li>
                    <a href="faculty_counselling_calendar.php" class="nav-link <?php echo $current_page === 'faculty_counselling_calendar.php' ? 'active' : ''; ?>">
                        <i class='bx bx-calendar'></i>
                        <span>Calendar</span>
                    </a>
                </li>
                <li>
                    <a href="study-materials.php" class="nav-link <?php echo $current_page === 'study-materials.php' ? 'active' : ''; ?>">
                        <i class='bx bx-book'></i>
                        <span>Study Materials</span>
                    </a>
                </li>
            <?php else: ?>
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
                    <a href="course_management.php" class="nav-link <?php echo $current_page === 'course_management.php' ? 'active' : ''; ?>">
                        <i class='bx bx-book-content'></i>
                        <span>Course Management</span>
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
                <li>
                    <a href="routine_suggestor.php" class="nav-link <?php echo $current_page === 'routine_suggestor.php' ? 'active' : ''; ?>">
                        <i class='bx bxs-calendar-check'></i>
                        <span>Routine Suggestor</span>
                    </a>
                </li>
            <?php endif; ?>
        </ul>
    </div>
    <div class="sidebar-footer">
        <?php
        $logout_url = 'logout.php';
        if (isset($_SESSION['role'])) {
            switch ($_SESSION['role']) {
                case 'admin':
                    $logout_url = 'admin_logout.php';
                    break;
                case 'faculty':
                    $logout_url = 'faculty_logout.php';
                    break;
                default:
                    $logout_url = 'logout.php';
            }
        }
        ?>
        <a href="<?php echo $logout_url; ?>" class="logout-btn">
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

document.addEventListener('DOMContentLoaded', function() {
  // Sidebar button fade effect
  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
    link.addEventListener('click', function(e) {
      // Only handle internal links
      if (this.hostname === window.location.hostname && this.getAttribute('href')) {
        e.preventDefault();
        // Remove fade from all, add to clicked
        navLinks.forEach(l => l.classList.remove('sidebar-fade'));
        this.classList.add('sidebar-fade');
        // Fade out main content
        const main = document.getElementById('main-content');
        if (main) {
          main.classList.remove('fade-in');
          main.classList.add('fade-out');
          setTimeout(() => {
            window.location.href = this.href;
          }, 300);
        } else {
          window.location.href = this.href;
        }
      }
    });
  });
  // On page load, fade in main content
  const main = document.getElementById('main-content');
  if (main) {
    setTimeout(() => {
      main.classList.add('fade-in');
      main.classList.remove('fade-out');
    }, 10);
  }
});
</script>