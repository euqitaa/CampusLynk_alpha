<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
}

require_once 'config/database.php';

// Fetch templates from the database
$db = (new Database())->getConnection();
$templates = [];
$stmt = $db->query("SELECT * FROM email_templates ORDER BY id");
$templates = $stmt->fetchAll();

// Fetch user info for autofill
$user = $db->prepare("SELECT * FROM users WHERE email = ?");
$user->execute([$_SESSION["useremail"]]);
$user = $user->fetch();

// Fetch student university_id
$university_id = '';
if ($user && $user['role'] === 'student') {
    $stmt = $db->prepare("SELECT university_id FROM student_id_table WHERE user_id = ?");
    $stmt->execute([$user['id']]);
    $row = $stmt->fetch();
    if ($row) $university_id = $row['university_id'];
}
// Fetch enrolled courses/sections with teacher info
$courses = [];
if ($user && $user['role'] === 'student') {
    $stmt = $db->prepare("SELECT uc.course_code, uc.course_title, se.section, es.teacher FROM student_enrollments se JOIN upcoming_courses uc ON se.course_id = uc.id LEFT JOIN exam_schedules es ON uc.course_code = es.course_code AND se.section = es.section WHERE se.student_id = ? GROUP BY uc.course_code, se.section");
    $stmt->execute([$user['id']]);
    $courses = $stmt->fetchAll();
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Assistant - CampusLynk</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/email_assistant.css">
</head>

<body>
    <?php include 'sidebar.php'; ?>

    <main class="main-content">
        <section class="welcome-section">
            <h1>Email Assistant</h1>
            <p class="text-muted">Generate professional emails for your academic needs</p>
        </section>

        <div class="card">
            <form id="emailForm" class="space-y-4" method="post">
                <div class="form-group">
                    <label class="form-label">Email Type</label>
                    <div class="input-with-icon">
                        <i class='bx bx-envelope'></i>
                        <select id="emailType" name="emailType" class="form-input" required>
                            <option value="">Select email type</option>
                            <?php foreach ($templates as $tpl): ?>
                                <option value="<?php echo $tpl['id']; ?>" data-subject="<?php echo htmlspecialchars($tpl['subject']); ?>" data-body="<?php echo htmlspecialchars($tpl['body']); ?>">
                                    <?php echo htmlspecialchars($tpl['name']); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <?php if ($user && $user['role'] === 'student' && !empty($courses)): ?>
                <div class="form-group">
                    <label class="form-label">Recipient (Course, Section & Faculty)</label>
                    <div class="input-with-icon">
                        <i class='bx bx-user'></i>
                        <select name="course_code" id="course_code_select" class="form-input" required onchange="updateTeacherField()">
                            <option value="">Select course, section & faculty</option>
                            <?php foreach ($courses as $c): ?>
                                <option value="<?php echo htmlspecialchars($c['course_code']); ?>|<?php echo htmlspecialchars($c['section']); ?>|<?php echo htmlspecialchars($c['teacher']); ?>">
                                    <?php echo htmlspecialchars($c['course_code'] . ' - ' . $c['course_title'] . ' (Section ' . $c['section'] . ') - ' . $c['teacher']); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="form-group" id="teacher-group" style="display:none;">
                    <label class="form-label">Faculty</label>
                    <div class="input-with-icon">
                        <i class='bx bx-user'></i>
                        <input type="text" id="teacher_name" class="form-input" readonly>
                    </div>
                </div>
                <?php endif; ?>
                <div class="form-group">
                    <label class="form-label">Additional Details</label>
                    <div class="input-with-icon">
                        <i class='bx bx-message-square-detail'></i>
                        <textarea id="details" name="details" class="form-input" rows="4" placeholder="Enter any specific details or requirements..."></textarea>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Generate Email</button>
            </form>

            <?php if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['emailType'])): ?>
                <?php
                $tplId = intval($_POST['emailType']);
                $details = trim($_POST['details'] ?? '');
                $tpl = null;
                foreach ($templates as $t) {
                    if ($t['id'] == $tplId) {
                        $tpl = $t;
                        break;
                    }
                }
                $selected_course = '';
                $selected_section = '';
                $selected_teacher = '';
                if (isset($_POST['course_code'])) {
                    list($selected_course, $selected_section, $selected_teacher) = explode('|', $_POST['course_code']);
                }
                if ($tpl) {
                    $body = $tpl['body'];
                    $body = str_replace('{{name}}', htmlspecialchars($user['name'] ?? ''), $body);
                    $body = str_replace('{{id}}', htmlspecialchars($university_id), $body);
                    $body = str_replace('{{course}}', htmlspecialchars($selected_course), $body);
                    $body = str_replace('{{section}}', htmlspecialchars($selected_section), $body);
                    $body = str_replace('{{teacher}}', htmlspecialchars($selected_teacher), $body);
                    $body = str_replace('{{courses}}', htmlspecialchars($details), $body);
                    $body = nl2br($body);
                    $subject = $tpl['subject'];
                ?>
                <div id="emailPreview" class="mt-6">
                    <h3 class="text-lg font-semibold mb-4">Generated Email</h3>
                    <div class="card bg-muted p-4">
                        <strong>Subject:</strong> <?php echo htmlspecialchars($subject); ?><br><br>
                        <div><?php echo $body; ?></div>
                    </div>
                    <button onclick="copyEmailContent()" class="btn btn-secondary mt-4">Copy to Clipboard</button>
                </div>
                <script>
                function copyEmailContent() {
                    const el = document.createElement('textarea');
                    el.value = `Subject: <?php echo addslashes($subject); ?>\n\n<?php echo addslashes(strip_tags($body)); ?>`;
                    document.body.appendChild(el);
                    el.select();
                    document.execCommand('copy');
                    document.body.removeChild(el);
                    alert('Email copied to clipboard!');
                }
                function updateTeacherField() {
                    var select = document.getElementById('course_code_select');
                    var teacherGroup = document.getElementById('teacher-group');
                    var teacherInput = document.getElementById('teacher_name');
                    if (select.value) {
                        var parts = select.value.split('|');
                        if (parts.length > 2) {
                            teacherInput.value = parts[2];
                            teacherGroup.style.display = '';
                        } else {
                            teacherInput.value = '';
                            teacherGroup.style.display = 'none';
                        }
                    } else {
                        teacherInput.value = '';
                        teacherGroup.style.display = 'none';
                    }
                }
                document.addEventListener('DOMContentLoaded', function() {
                    updateTeacherField();
                });
                </script>
                <?php }
            endif; ?>
        </div>
    </main>

    <script src="email_assistant.js"></script>
</body>

</html>