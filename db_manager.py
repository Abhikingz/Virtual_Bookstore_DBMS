import sqlite3
import os

def init_db():
    conn = sqlite3.connect("bookstore.db")
    cursor = conn.cursor()
    
    with open("sql/schema.sql", "r") as f:
        cursor.executescript(f.read())
        
    print("Database schema created in 3NF successfully.")
    conn.close()

if __name__ == "__main__":
    init_db()
