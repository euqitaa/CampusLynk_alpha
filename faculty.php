<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

try {
    $database = new Database();
    $db = $database->getConnection();
    $query = $db->prepare("SELECT * FROM faculty");
    $query->execute();
    $facultyList = $query->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $facultyList = [];
    $error = "Database Error: " . htmlspecialchars($e->getMessage());
}

$pinnedFacultyIds = [];
$user = null;
if (isset($_SESSION["useremail"])) {
    $userQuery = $db->prepare("SELECT * FROM users WHERE email = ?");
    $userQuery->execute([$_SESSION["useremail"]]);
    $user = $userQuery->fetch(PDO::FETCH_ASSOC);
}
if ($user && $user['role'] === 'student') {
    // Get faculty names from enrolled courses
    $facultyStmt = $db->prepare("
        SELECT DISTINCT f.id
        FROM student_enrollments se
        JOIN upcoming_courses uc ON se.course_id = uc.id
        JOIN faculty f ON uc.faculty_name = f.name
        WHERE se.student_id = ?
    ");
    $facultyStmt->execute([$user['id']]);
    $pinnedFacultyIds = array_column($facultyStmt->fetchAll(PDO::FETCH_ASSOC), 'id');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/faculty.css">
</head>

<body>
    <?php include 'sidebar.php'; ?>
    
    <main class="main-content">
        <section class="welcome-section">
            <h1>Faculty Members</h1>
            <p class="text-muted">View all faculty members and their details</p>
        </section>
        <div class="faculty-search-bar" style="margin-bottom: 1.5rem; max-width: 400px;">
            <input type="text" id="facultySearch" class="form-input" placeholder="Search faculty by name, email, or title..." oninput="filterFaculty()">
        </div>
        <div class="faculty-grid" id="facultyGrid">
            <?php
            $pinned = [];
            $others = [];
            foreach ($facultyList as $faculty) {
                if (in_array($faculty['id'], $pinnedFacultyIds)) {
                    $pinned[] = $faculty;
                } else {
                    $others[] = $faculty;
                }
            }
            ?>
            <?php if (!empty($pinned)): ?>
                <div class="faculty-section-label" style="grid-column: 1 / -1; font-weight: 600; color: var(--primary); margin-bottom: 0.5rem;">Pinned Faculty</div>
                <?php foreach ($pinned as $faculty): ?>
                    <div class="faculty-card" data-name="<?php echo htmlspecialchars(strtolower($faculty['name'])); ?>" data-email="<?php echo htmlspecialchars(strtolower($faculty['email'])); ?>" data-title="<?php echo htmlspecialchars(strtolower($faculty['profession'] ?? 'Faculty Member')); ?>">
                        <div class="faculty-avatar">
                            <i class='bx bxs-user-circle'></i>
                        </div>
                        <h3 class="faculty-name"><?php echo htmlspecialchars($faculty['name']); ?> <span title="Enrolled Faculty" style="color: gold; font-size: 1.1em; vertical-align: middle;"><i class='bx bxs-star'></i></span></h3>
                        <p class="faculty-title"><?php echo htmlspecialchars($faculty['profession'] ?? 'Faculty Member'); ?></p>
                        <div class="faculty-contact">
                            <a href="mailto:<?php echo htmlspecialchars($faculty['email']); ?>" class="btn btn-outline btn-sm">
                                <i class='bx bx-envelope'></i>
                                Contact
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
            <?php if (!empty($others)): ?>
                <div class="faculty-section-label" style="grid-column: 1 / -1; font-weight: 600; color: var(--muted-foreground); margin: 1.5rem 0 0.5rem 0;">Other Faculty</div>
                <?php foreach ($others as $faculty): ?>
                    <div class="faculty-card" data-name="<?php echo htmlspecialchars(strtolower($faculty['name'])); ?>" data-email="<?php echo htmlspecialchars(strtolower($faculty['email'])); ?>" data-title="<?php echo htmlspecialchars(strtolower($faculty['profession'] ?? 'Faculty Member')); ?>">
                        <div class="faculty-avatar">
                            <i class='bx bxs-user-circle'></i>
                        </div>
                        <h3 class="faculty-name"><?php echo htmlspecialchars($faculty['name']); ?></h3>
                        <p class="faculty-title"><?php echo htmlspecialchars($faculty['profession'] ?? 'Faculty Member'); ?></p>
                        <div class="faculty-contact">
                            <a href="mailto:<?php echo htmlspecialchars($faculty['email']); ?>" class="btn btn-outline btn-sm">
                                <i class='bx bx-envelope'></i>
                                Contact
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
            <?php if (empty($facultyList)): ?>
                <div class="empty-state">
                    <i class='bx bx-user-x'></i>
                    <p>No faculty members found</p>
                    <?php if (isset($error)): ?>
                        <p class="error-message"><?php echo $error; ?></p>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        </div>
        <script>
        function filterFaculty() {
            var input = document.getElementById('facultySearch').value.toLowerCase();
            var cards = document.querySelectorAll('.faculty-card');
            cards.forEach(function(card) {
                var name = card.getAttribute('data-name');
                var email = card.getAttribute('data-email');
                var title = card.getAttribute('data-title');
                if (name.includes(input) || email.includes(input) || title.includes(input)) {
                    card.style.display = '';
                } else {
                    card.style.display = 'none';
                }
            });
        }
        </script>
    </main>
</body>

</html>