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
    
    if (isset($_GET['event_id'])) {
        $event_id = $_GET['event_id'];
        
        $query = "SELECT * FROM events WHERE id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$event_id]);
        $event = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$event) {
            throw new Exception("Event not found");
        }
    } else {
        throw new Exception("No event selected");
    }
} catch (Exception $e) {
    $error = $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Details - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Event Details</h1>
            <p class="text-muted">View event information and details</p>
        </section>

        <?php if (isset($error)): ?>
            <div class="alert alert-error">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php else: ?>
            <div class="card">
                <div class="grid grid-cols-1 gap-8">
                    <div class="card">
                        <h2 class="text-2xl font-semibold mb-4"><?php echo htmlspecialchars($event['title']); ?></h2>
                        <div class="space-y-4">
                            <div>
                                <h3 class="font-semibold mb-2">Date</h3>
                                <p class="text-muted">
                                    <i class='bx bxs-calendar'></i>
                                    <?php echo date('F j, Y', strtotime($event['date'])); ?>
                                </p>
                            </div>
                            <div>
                                <h3 class="font-semibold mb-2">Description</h3>
                                <p class="text-muted"><?php echo nl2br(htmlspecialchars($event['description'])); ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </main>
</body>
</html>