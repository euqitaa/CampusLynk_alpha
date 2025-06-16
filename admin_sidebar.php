<aside class="admin-sidebar">
    <div class="sidebar-header">
        <h1 class="text-xl font-bold">CampusLynk</h1>
        <p class="text-sm text-muted">Admin Portal</p>
    </div>
    <nav>
        <ul class="admin-nav">
            <li>
                <a href="admin_dashboard.php" class="<?php echo basename($_SERVER['PHP_SELF']) === 'admin_dashboard.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-dashboard'></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="admin_dataimport.php" class="<?php echo basename($_SERVER['PHP_SELF']) === 'admin_dataimport.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-file-import'></i>
                    <span>Data Import</span>
                </a>
            </li>
            <li>
                <a href="admin_users.php" class="<?php echo basename($_SERVER['PHP_SELF']) === 'admin_users.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-user-detail'></i>
                    <span>User Management</span>
                </a>
            </li>
            <li>
                <a href="admin_settings.php" class="<?php echo basename($_SERVER['PHP_SELF']) === 'admin_settings.php' ? 'active' : ''; ?>">
                    <i class='bx bxs-cog'></i>
                    <span>Settings</span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="sidebar-footer">
        <a href="admin_logout.php" class="btn btn-outline w-full">
            <i class='bx bxs-log-out'></i>
            <span>Logout</span>
        </a>
    </div>
</aside>
<style>
.admin-sidebar {
    width: 250px;
    background: white;
    height: 100vh;
    position: fixed;
    left: 0;
    top: 0;
    border-right: 1px solid #e2e8f0;
    padding: 1.5rem;
}
.admin-content {
    margin-left: 250px;
    padding: 2rem;
}
.admin-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}
.admin-nav {
    list-style: none;
    padding: 0;
    margin: 2rem 0;
}
.admin-nav li {
    margin-bottom: 0.5rem;
}
.admin-nav a {
    display: flex;
    align-items: center;
    padding: 0.75rem 1rem;
    color: #4b5563;
    text-decoration: none;
    border-radius: 0.5rem;
    transition: all 0.2s;
}
.admin-nav a:hover {
    background: #f3f4f6;
    color: #1f2937;
}
.admin-nav a.active {
    background: #4f46e5;
    color: white;
}
.admin-nav i {
    margin-right: 0.75rem;
    font-size: 1.25rem;
}
</style> 