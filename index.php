<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CampusLynk - Your Digital Campus Companion</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <!-- Navbar -->
    <nav class="landing-navbar fixed-navbar">
        <div class="navbar-container">
            <a href="index.php" class="navbar-brand">
                <span class="text-xl">🎓</span>
                <span class="brand-text">CampusLynk</span>
            </a>
            <div class="nav-links">
                <a href="login.php" class="btn btn-outline">Login</a>
                <a href="signup.php" class="btn btn-primary">Sign Up</a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="landing-main">
        <div class="split-flex">
            <!-- Hero/CTA Left -->
            <section class="hero hero-landing">
                <div class="hero-content">
                    <h1 class="text-4xl font-bold mb-6">Your Digital Campus Companion</h1>
                    <p class="text-xl text-muted mb-8 max-w-2xl">Streamline your academic journey with CampusLynk. Access study materials, track your schedule, and stay connected with campus events - all in one place.</p>
                    <div class="hero-cta mb-8">
                        <h2 class="text-2xl font-bold mb-2">Ready to Get Started?</h2>
                        <p class="text-muted mb-6">Join thousands of students who are already using CampusLynk to enhance their academic experience.</p>
                        <a href="signup.php" class="btn btn-primary btn-lg mb-2">Sign Up Now</a>
                        <p class="text-sm text-muted">Already signed up? <a href="login.php" class="text-primary hover:underline">Log in</a></p>
                    </div>
                </div>
            </section>
            <!-- Features Right -->
            <section class="features features-landing">
                <div class="features-container">
                    <h2 class="text-2xl font-bold mb-8">Why Choose CampusLynk?</h2>
                    <div class="feature-list">
                        <div class="feature-card">
                            <div class="feature-icon bg-primary text-white"><span class="bx bx-book-open"></span></div>
                            <div>
                                <h3 class="text-lg font-semibold mb-1">Study Materials</h3>
                                <p class="text-muted">Access course materials, lecture notes, and study resources anytime, anywhere.</p>
                            </div>
                        </div>
                        <div class="feature-card">
                            <div class="feature-icon bg-primary text-white"><span class="bx bx-calendar"></span></div>
                            <div>
                                <h3 class="text-lg font-semibold mb-1">Schedule Management</h3>
                                <p class="text-muted">Keep track of your classes, assignments, and important deadlines.</p>
                            </div>
                        </div>
                        <div class="feature-card">
                            <div class="feature-icon bg-primary text-white"><span class="bx bx-party"></span></div>
                            <div>
                                <h3 class="text-lg font-semibold mb-1">Campus Events</h3>
                                <p class="text-muted">Stay updated with campus activities, workshops, and social events.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p class="text-muted text-sm">© 2024 CampusLynk. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>