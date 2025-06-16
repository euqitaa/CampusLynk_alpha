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
    
    $query = $db->prepare("SELECT * FROM users WHERE email = ?");
    $query->execute([$_SESSION['useremail']]);
    $user = $query->fetch(PDO::FETCH_ASSOC);
    
    if (!$user) {
        session_destroy();
        header("Location: login.php?error=User not found");
        exit();
    }

    $course_query = $db->query("SELECT course_code, MIN(course_title) as course_title FROM upcoming_courses GROUP BY course_code ORDER BY MIN(course_title)");
    $courses = $course_query->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    header("Location: login.php?error=Database Error: " . urlencode($e->getMessage()));
    exit();
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/dashboard.css">
</head>

<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Welcome, <?php echo htmlspecialchars($user['name']); ?></h1>
            <p class="text-muted">Access your student dashboard</p>
            <?php if (isset($_GET['success'])): ?>
                <div class="alert alert-success">
                    <?php echo htmlspecialchars($_GET['success']); ?>
                </div>
            <?php endif; ?>
            <?php if (isset($_GET['error'])): ?>
                <div class="alert alert-danger">
                    <?php echo htmlspecialchars($_GET['error']); ?>
                </div>
            <?php endif; ?>
             <?php if (isset($_GET['message'])): ?>
                <div class="alert alert-info">
                    <?php echo htmlspecialchars($_GET['message']); ?>
                </div>
            <?php endif; ?>
        </section>

        <div class="quick-access-row">
            <div class="quick-access-card border-purple">
                <div class="quick-access-card-content">
                    <div class="quick-access-number">3</div>
                    <div class="quick-access-label">Courses</div>
                </div>
                <div class="quick-access-icon purple">
                    <i class='bx bxs-book'></i>
                </div>
            </div>

            <div class="quick-access-card border-yellow">
                <div class="quick-access-card-content">
                    <div class="quick-access-number">5</div>
                    <div class="quick-access-label">Requests</div>
                </div>
                <div class="quick-access-icon yellow">
                    <i class='bx bxs-user'></i>
                </div>
            </div>

            <div class="quick-access-card border-pink">
                <div class="quick-access-card-content">
                    <div class="quick-access-number">12</div>
                    <div class="quick-access-label">Materials</div>
                </div>
                <div class="quick-access-icon pink">
                    <i class='bx bxs-file'></i>
                </div>
            </div>

            <div class="quick-access-card border-blue">
                <div class="quick-access-card-content">
                    <div class="quick-access-number">2</div>
                    <div class="quick-access-label">Events</div>
                </div>
                <div class="quick-access-icon blue">
                    <i class='bx bxs-calendar'></i>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
            <div class="card">
                <h2 class="text-xl font-semibold mb-4">Recent Activities</h2>
                <div class="space-y-4">
                    <div class="flex items-center gap-4 p-3 bg-muted rounded-lg">
                        <i class='bx bxs-book text-primary'></i>
                        <div>
                            <h3 class="font-medium">New Study Material</h3>
                            <p class="text-sm text-muted">Database Management Notes uploaded</p>
                        </div>
                    </div>
                    <div class="flex items-center gap-4 p-3 bg-muted rounded-lg">
                        <i class='bx bxs-calendar text-primary'></i>
                        <div>
                            <h3 class="font-medium">Upcoming Event</h3>
                            <p class="text-sm text-muted">Tech Seminar on Friday</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <h2 class="card-title">Enroll in a Course</h2>
                <form action="enroll.php" method="POST" id="enroll-form" class="form-grid">
                    <div class="form-group">
                        <label for="course" class="form-label">Course</label>
                        <select name="course_code" id="course" class="form-input">
                            <option value="">-- Select a Course --</option>
                            <?php foreach ($courses as $course): ?>
                                <option value="<?php echo htmlspecialchars($course['course_code']); ?>">
                                    <?php echo htmlspecialchars($course['course_title']) . ' (' . htmlspecialchars($course['course_code']) . ')'; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="section" class="form-label">Section</label>
                        <select name="section" id="section" class="form-input" disabled>
                            <option value="">-- Select a Course First --</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Enroll</button>
                </form>
            </div>
        </div>
    </main>

    <script>
        document.getElementById('course').addEventListener('change', function() {
            const courseCode = this.value;
            const sectionSelect = document.getElementById('section');
            sectionSelect.disabled = true;
            sectionSelect.innerHTML = '<option value="">Loading...</option>';

            if (courseCode) {
                fetch('get_sections.php?course_code=' + courseCode)
                    .then(response => response.json())
                    .then(data => {
                        sectionSelect.innerHTML = '<option value="">-- Select a Section --</option>';
                        data.forEach(section => {
                            const option = document.createElement('option');
                            option.value = section.section;
                            option.textContent = 'Section ' + section.section;
                            sectionSelect.appendChild(option);
                        });
                        sectionSelect.disabled = false;
                    })
                    .catch(error => {
                        console.error('Error fetching sections:', error);
                        sectionSelect.innerHTML = '<option value="">Error loading sections</option>';
                    });
            } else {
                sectionSelect.innerHTML = '<option value="">-- Select a Course First --</option>';
            }
        });
    </script>

</body>

</html>