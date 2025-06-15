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
    
    if (isset($_GET['course_id'])) {
        $course_id = $_GET['course_id'];
        
        $query = "SELECT * FROM courses WHERE id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$course_id]);
        $course = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$course) {
            throw new Exception("Course not found");
        }
    } else {
        throw new Exception("No course selected");
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
    <title>Course Materials - CampusLynk</title>
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
            <h1>Course Materials</h1>
            <p class="text-muted">View and download course materials</p>
        </section>

        <?php if (isset($error)): ?>
            <div class="alert alert-error">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php else: ?>
            <div class="card">
                <h2 class="text-2xl font-semibold mb-4"><?php echo htmlspecialchars($course['name']); ?></h2>
                <div class="space-y-4">
                    <div>
                        <h3 class="font-semibold mb-2">Description</h3>
                        <p class="text-muted"><?php echo nl2br(htmlspecialchars($course['description'])); ?></p>
                    </div>
                    <div>
                        <h3 class="font-semibold mb-2">Materials</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <?php
                            $materials_query = "SELECT * FROM course_materials WHERE course_id = ?";
                            $materials_stmt = $db->prepare($materials_query);
                            $materials_stmt->execute([$course_id]);
                            $materials = $materials_stmt->fetchAll(PDO::FETCH_ASSOC);
                            
                            if (!empty($materials)):
                                foreach ($materials as $material):
                            ?>
                                <div class="card">
                                    <div class="p-4">
                                        <h4 class="font-semibold mb-2"><?php echo htmlspecialchars($material['title']); ?></h4>
                                        <p class="text-muted mb-4"><?php echo htmlspecialchars($material['description']); ?></p>
                                        <a href="<?php echo htmlspecialchars($material['file_path']); ?>" 
                                           class="btn btn-primary" 
                                           download>
                                            Download
                                        </a>
                                    </div>
                                </div>
                            <?php 
                                endforeach;
                            else:
                            ?>
                                <div class="col-span-full">
                                    <p class="text-muted text-center">No materials available for this course.</p>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </main>
</body>
</html>