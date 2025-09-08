import sqlite3
import bcrypt

# -----------------------------
# PART 1 + PART 2 : CLI auth
# -----------------------------

# Initialisation de la base SQLite
conn = sqlite3.connect("auth.db")
cursor = conn.cursor()

# Création de la table users si elle n'existe pas
cursor.execute('''
CREATE TABLE IF NOT EXISTS users (
    username TEXT PRIMARY KEY,
    password BLOB NOT NULL
)
''')
conn.commit()

# Fonction pour ajouter un utilisateur
def signup(username, password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
    try:
        cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, hashed))
        conn.commit()
        print(f"✅ User '{username}' created successfully!")
    except sqlite3.IntegrityError:
        print("⚠️ Username already exists.")

# Fonction pour vérifier login
def login(username, password):
    cursor.execute("SELECT password FROM users WHERE username = ?", (username,))
    row = cursor.fetchone()
    if row:
        stored_password = row[0]
        if bcrypt.checkpw(password.encode('utf-8'), stored_password):
            print("🎉 You are now logged in!")
            return username
        else:
            print("❌ Incorrect password.")
    else:
        print("❌ User not found.")
    return None

# -----------------------------
# CLI Loop
# -----------------------------
logged_in = None

while True:
    action = input("\n👉 Type 'login', 'signup', or 'exit': ").lower()

    if action == "exit":
        print("👋 Goodbye!")
        break

    elif action == "login":
        username = input("Enter username: ")
        password = input("Enter password: ")
        logged_in = login(username, password)

    elif action == "signup":
        while True:
            username = input("Choose a username: ")
            cursor.execute("SELECT * FROM users WHERE username = ?", (username,))
            if cursor.fetchone():
                print("⚠️ Username already taken, try again.")
            else:
                break
        password = input("Choose a password: ")
        signup(username, password)

    else:
        print("❓ Unknown command, try again.")
