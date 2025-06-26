<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CampusLynk - Your Digital Campus Companion</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@700&family=Poppins:wght@700&family=Montserrat:wght@700&family=Baloo+2:wght@700&family=Fredoka:wght@700&family=Quicksand:wght@700&family=Rubik:wght@700&family=Nunito:wght@700&family=Manrope:wght@700&family=Sora:wght@700&family=Inter:ital,wght@1,700&family=Poppins:ital,wght@1,700&family=Montserrat:ital,wght@1,700&family=Baloo+2:ital,wght@1,700&family=Fredoka:ital,wght@1,700&family=Quicksand:ital,wght@1,700&family=Rubik:ital,wght@1,700&family=Nunito:ital,wght@1,700&family=Manrope:ital,wght@1,700&family=Sora:ital,wght@1,700&family=Dancing+Script:wght@700&family=Pacifico&family=Great+Vibes&family=Playfair+Display:wght@700&family=Cinzel:wght@700&family=Lobster&display=swap" rel="stylesheet">
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
        <section class="hero hero-landing">
            <div class="hero-blob1"></div>
            <div class="hero-blob2"></div>
            <div class="hero-blob3"></div>
            <div class="hero-content">
                <span class="trusted-badge"><i class='bx bxs-user-check'></i> Trusted by 2,000+ students</span>
                <h1 class="text-4xl font-bold mb-4">Your Digital <br><span class="highlight" id="campus-animate">Campus</span> <br>Companion</h1>
                <p class="text-xl text-muted mb-8 max-w-2xl">All your study materials, schedules, and campus events in one beautiful, easy-to-use platform.</p>
                <div class="hero-cta mb-8">
                    <a href="signup.php" class="btn btn-primary btn-lg">Sign Up Now</a>
                    <a href="#features" class="btn btn-outline btn-lg secondary-cta">See Features</a>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features features-landing" id="features">
            <div class="features-container">
                <h2 class="text-2xl font-bold mb-8" style="text-align:center; font-size:2rem;">Everything You Need for Campus Life</h2>
                <div class="features-grid">
                    <div class="feature-card">
                        <div class="feature-icon"><span class="bx bx-book-open"></span></div>
                        <div>
                            <h3 class="text-lg font-semibold mb-1">Study Materials</h3>
                            <p class="text-muted">Access course materials, lecture notes, and study resources anytime, anywhere.</p>
                        </div>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon"><span class="bx bx-calendar"></span></div>
                        <div>
                            <h3 class="text-lg font-semibold mb-1">Schedule Management</h3>
                            <p class="text-muted">Keep track of your classes, assignments, and important deadlines.</p>
                        </div>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon"><span class="bx bx-party"></span></div>
                        <div>
                            <h3 class="text-lg font-semibold mb-1">Campus Events</h3>
                            <p class="text-muted">Stay updated with campus activities, workshops, and social events.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p class="text-muted text-sm">© 2024 CampusLynk. All rights reserved.</p>
            <div class="footer-social">
                <a href="#" title="Twitter"><i class='bx bxl-twitter'></i></a>
                <a href="#" title="Facebook"><i class='bx bxl-facebook'></i></a>
                <a href="#" title="Instagram"><i class='bx bxl-instagram'></i></a>
                <a href="#" title="LinkedIn"><i class='bx bxl-linkedin'></i></a>
            </div>
            <p class="text-sm mt-2"><a href="admin_login.php" class="text-primary hover:underline">Enter Mlobby</a></p>
        </div>
    </footer>
    <script>
    // Animate the 'Campus' word with different fonts and styles every 0.1s
    const fontCombos = [
        { family: 'Inter, sans-serif', weight: 'bold', style: 'italic', deco: 'none' },
        { family: 'Poppins, sans-serif', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Montserrat, sans-serif', weight: 'bold', style: 'italic', deco: 'none' },
        { family: 'Baloo 2, sans-serif', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Fredoka, sans-serif', weight: 'bold', style: 'italic', deco: 'none' },
        { family: 'Quicksand, sans-serif', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Rubik, sans-serif', weight: 'bold', style: 'italic', deco: 'none' },
        { family: 'Nunito, sans-serif', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Manrope, sans-serif', weight: 'bold', style: 'italic', deco: 'none' },
        { family: 'Sora, sans-serif', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Dancing Script, cursive', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Pacifico, cursive', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Great Vibes, cursive', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Playfair Display, serif', weight: 'bold', style: 'italic', deco: 'none' },
        { family: 'Cinzel, serif', weight: 'bold', style: 'normal', deco: 'none' },
        { family: 'Lobster, cursive', weight: 'bold', style: 'normal', deco: 'none' }
    ];
    let fontIdx = 0;
    const campusSpan = document.getElementById('campus-animate');
    setInterval(() => {
        const combo = fontCombos[fontIdx];
        campusSpan.style.fontFamily = combo.family;
        campusSpan.style.fontWeight = combo.weight;
        campusSpan.style.fontStyle = combo.style;
        campusSpan.style.textDecoration = combo.deco;
        fontIdx = (fontIdx + 1) % fontCombos.length;
    }, 100);
    </script>
</body>
</html>