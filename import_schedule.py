import pdfplumber
import csv
import mysql.connector
import os

PDF_PATH = os.path.join('uploads', 'schedule_import.pdf')
CSV_PATH = os.path.join('uploads', 'schedule_import.csv')

# MySQL connection config
DB_CONFIG = {
    'user': 'root',
    'password': '',
    'host': 'localhost',
    'database': 'university',
    'charset': 'utf8mb4'
}

HEADER = [
    'program', 'course_code', 'title', 'section', 'room1', 'room2',
    'day1', 'day2', 'time1', 'time2', 'faculty_name', 'faculty_initial', 'credit'
]

def extract_table_from_pdf(pdf_path, csv_path):
    rows_written = 0
    with pdfplumber.open(pdf_path) as pdf, open(csv_path, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(HEADER)
        for page in pdf.pages:
            table = page.extract_table()
            if table:
                for row in table[1:]:  # skip header row
                    if len(row) >= 14:
                        writer.writerow(row[1:14])  # skip SL column, take next 13 columns
                        rows_written += 1
    return rows_written

def import_csv_to_mysql(csv_path, db_config):
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    with open(csv_path, newline='', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile)
        next(reader)  # skip header
        for row in reader:
            if len(row) < 13:
                continue
            try:
                cursor.execute(
                    """
                    INSERT IGNORE INTO course_schedules
                    (program, course_code, course_title, section, room1, room2, day1, day2, time1, time2, faculty_name, faculty_initial, credit)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """,
                    row
                )
            except Exception as e:
                print(f"Error inserting row: {row}\n{e}")
    conn.commit()
    cursor.close()
    conn.close()

def main():
    if not os.path.exists(PDF_PATH):
        print(f"PDF file not found: {PDF_PATH}")
        return
    rows = extract_table_from_pdf(PDF_PATH, CSV_PATH)
    print(f"Extracted {rows} rows to CSV: {CSV_PATH}")
    import_csv_to_mysql(CSV_PATH, DB_CONFIG)
    print("Imported data into MySQL.")

if __name__ == '__main__':
    main() 