<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CampusLynk - Your Digital Campus Companion</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <header class="landing-header">
        <nav class="landing-navbar">
            <div class="navbar-container">
                <a href="#" class="navbar-brand smooth-white"><span>CampusLynk</span></a>
                <div class="nav-links">
                    <a href="login.php" class="btn btn-outline btn-login">Login</a>
                    <a href="signup.php" class="btn btn-primary">Sign Up</a>
                </div>
            </div>
        </nav>
    </header>
    <main class="landing-main">
        <section class="hero">
            <div class="hero-content">
                <h1 class="hero-title"><span class="hero-light">Your Digital</span> <br>Campus<span class="campus-gradient"> Companion</span> </h1>
                <p class="hero-subtitle">All your study materials, schedules, and campus events in one beautiful, easy-to-use platform.</p>
                <div class="hero-cta">
                    <a href="signup.php" class="btn btn-primary btn-lg">Get Started</a>
                </div>
            </div>
        </section>
        <section class="features" id="features">
            <h2 class="features-title">Everything You Need for Campus Life</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon"><i class='bx bxs-book'></i></div>
                    <h3>Study Materials</h3>
                    <p>Access course materials, lecture notes, and study resources anytime, anywhere.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class='bx bx-book-content'></i></div>
                    <h3>Course Management</h3>
                    <p>Manage your enrolled courses, track progress, and access course-specific resources.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class='bx bxs-calendar'></i></div>
                    <h3>Class Routine</h3>
                    <p>View your daily class schedule, room assignments, and never miss a lecture.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class='bx bxs-time'></i></div>
                    <h3>Exam Schedule</h3>
                    <p>Stay updated with exam dates, times, and locations to plan your study sessions.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class='bx bxs-calendar-event'></i></div>
                    <h3>Campus Events</h3>
                    <p>Discover workshops, seminars, and social events happening on campus.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class='bx bxs-user-badge'></i></div>
                    <h3>Faculty Directory</h3>
                    <p>Connect with professors, view their profiles, and schedule counselling sessions.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class='bx bxs-envelope'></i></div>
                    <h3>Email Generator</h3>
                    <p>Generate professional emails to faculty and staff with our smart assistant.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class='bx bxs-calendar-check'></i></div>
                    <h3>Routine Suggestor</h3>
                    <p>Get personalized study routine suggestions based on your schedule and preferences.</p>
                </div>
            </div>
        </section>
    </main>
    <footer class="footer">
        <div class="footer-container">
            <p>© 2024 CampusLynk. All rights reserved.</p>
            <div class="footer-social">
                <a href="#" title="Twitter"><i class='bx bxl-twitter'></i></a>
                <a href="#" title="Facebook"><i class='bx bxl-facebook'></i></a>
                <a href="#" title="Instagram"><i class='bx bxl-instagram'></i></a>
                <a href="#" title="LinkedIn"><i class='bx bxl-linkedin'></i></a>
            </div>
        </div>
    </footer>
    <div style="width:100%;text-align:center;margin:1.5rem 0 0 0;">
        <a href="admin_login.php" style="color:#b0bedc;font-size:0.98rem;opacity:0.7;text-decoration:none;transition:color 0.2s;">Enter to mlobby</a>
    </div>
    <script>
    // Enable mouse wheel horizontal scrolling for the features row
    const featuresGrid = document.querySelector('.features-grid');
    featuresGrid.addEventListener('wheel', function(e) {
      if (e.deltaY === 0) return;
      e.preventDefault();
      featuresGrid.scrollLeft += e.deltaY;
    }, { passive: false });
    </script>
</body>
</html>