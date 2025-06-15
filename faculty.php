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

        <div class="faculty-grid">
            <?php if (!empty($facultyList)): ?>
                <?php foreach ($facultyList as $faculty): ?>
                    <div class="faculty-card">
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
            <?php else: ?>
                <div class="empty-state">
                    <i class='bx bx-user-x'></i>
                    <p>No faculty members found</p>
                    <?php if (isset($error)): ?>
                        <p class="error-message"><?php echo $error; ?></p>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        </div>
    </main>
</body>

</html>