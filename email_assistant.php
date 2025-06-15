<?php
session_start();

if (!isset($_SESSION["useremail"]) || empty($_SESSION["useremail"])) {
    header("Location: login.php");
    exit();
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
            <form id="emailForm" class="space-y-4">
                <div class="form-group">
                    <label class="form-label">Email Type</label>
                    <select id="emailType" class="form-input" required>
                        <option value="">Select email type</option>
                        <option value="leave">Leave Request</option>
                        <option value="assignment">Assignment Extension</option>
                        <option value="meeting">Meeting Request</option>
                        <option value="feedback">Course Feedback</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">Additional Details</label>
                    <textarea id="details" class="form-input" rows="4" placeholder="Enter any specific details or requirements..."></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Generate Email</button>
            </form>

            <div id="emailPreview" class="mt-6 hidden">
                <h3 class="text-lg font-semibold mb-4">Generated Email</h3>
                <div class="card bg-muted p-4">
                    <pre id="emailContent" class="whitespace-pre-wrap"></pre>
                </div>
                <button id="copyEmail" class="btn btn-secondary mt-4">Copy to Clipboard</button>
            </div>
        </div>
    </main>

    <script src="email_assistant.js"></script>
</body>

</html>