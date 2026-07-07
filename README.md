# CampusLynk Alpha

CampusLynk Alpha is a web-based academic management system built for students, faculty, and administrators. It helps users view schedules, manage course materials, request counselling, explore exam timetables, and handle administrative import workflows for academic data.

## Overview

This project combines PHP-based web pages with MySQL storage and Python scripts for importing schedule and exam data from PDF/Excel files. It is designed as a campus portal-style application for managing academic information in a simple and practical way.

## Main Features

- Student and faculty authentication flows
- Admin dashboard for managing academic data
- Class schedule viewing and import tools
- Exam schedule viewing and import tools
- Faculty counselling request and scheduling features
- Study material upload and browsing
- Event management pages
- Sample exam data utilities

## Technology Stack

- PHP 8+
- MySQL / MariaDB
- HTML, CSS, JavaScript
- Composer for PHP dependencies
- Python 3 for schedule import scripts

## Project Structure

- [index.php](index.php) and [login.php](login.php): main entry points and sign-in flow
- [dashboard.php](dashboard.php), [admin_dashboard.php](admin_dashboard.php), and [faculty_dashboard.php](faculty_dashboard.php): role-based dashboards
- [admin_*.php](admin_dataimport.php): admin-side pages for data management and imports
- [config/](config/): database and secrets configuration files
- [uploads/](uploads/): uploaded files and generated import output
- [import_schedule.py](import_schedule.py) and [import_exam_schedule.py](import_exam_schedule.py): Python scripts for importing academic schedules
- [university.sql](university.sql): database schema and sample data

## Prerequisites

Before running the project, make sure you have:

- A local web server such as XAMPP, WAMP, or Laragon
- PHP installed and enabled
- MySQL or MariaDB running
- Composer installed
- Python 3 installed with pip

## Installation

1. Place the project folder inside your web server root, such as the XAMPP htdocs folder.
2. Start Apache and MySQL from your local server control panel.
3. Create a MySQL database named university.
4. Import the SQL file:
   - Open phpMyAdmin or your preferred MySQL client
   - Select the university database
   - Import [university.sql](university.sql)
5. Configure database connection details in [config/database.php](config/database.php) if your local credentials differ.
6. Install PHP dependencies:

   ```bash
   composer install
   ```

7. Install the Python packages required by the import scripts:

   ```bash
   pip install mysql-connector-python pdfplumber pandas openpyxl
   ```

8. Open the project in your browser. The main entry page is typically:

   ```text
   http://localhost/CampusLynk_alpha/index.php
   ```

## Running the Application

After the setup is complete:

- Open [index.php](index.php) or [login.php](login.php) in your browser.
- Use the relevant login or register page for students, faculty, or administrators.
- Admin users can access admin pages such as [admin_dashboard.php](admin_dashboard.php) and [admin_dataimport.php](admin_dataimport.php).

## Importing Academic Data

The project includes import workflows for schedules:

### Class Schedule Import

- Use [admin_dataimport.php](admin_dataimport.php) or [admin_class_schedule.php](admin_class_schedule.php)
- Upload a PDF containing class schedules
- The upload workflow runs [import_schedule.py](import_schedule.py), which extracts data and imports it into the course_schedules table

### Exam Schedule Import

- Use [admin_exam_import.php](admin_exam_import.php)
- Upload an Excel file containing exam schedules
- The workflow runs [import_exam_schedule.py](import_exam_schedule.py)

## Database Notes

- The application expects a database named university.
- The current configuration uses the MySQL root account with an empty password in [config/database.php](config/database.php) and in the Python import scripts.
- If your local MySQL setup uses different credentials, update them in both the PHP and Python files before importing data.

## Notes for Development

- The import scripts currently rely on local file paths under the uploads folder.
- Some admin workflows may need the relevant Python packages installed before use.
- The project is still evolving, and future improvements may include better validation and more robust import handling.

## License

This project is intended for academic and educational use. Please check local project ownership and usage requirements before deploying it publicly.
