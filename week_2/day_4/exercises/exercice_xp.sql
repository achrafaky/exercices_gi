import psycopg2

# ---------------------- Connexion PostgreSQL ----------------------
def connect():
    return psycopg2.connect(
        dbname="restaurant_db",
        user="postgres",
        password="your_password",  # ⚠️ Mets ton mot de passe PostgreSQL
        host="localhost",
        port="5432"
    )

# ---------------------- Classe MenuItem ----------------------
class MenuItem:
    def __init__(self, name, price):
        self.item_name = name
        self.item_price = price

    def save(self):
        conn = connect()
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO Menu_Items (item_name, item_price) VALUES (%s, %s)",
            (self.item_name, self.item_price)
        )
        conn.commit()
        cur.close()
        conn.close()
        print(f"✅ {self.item_name} ajouté avec succès.")

    def delete(self):
        conn = connect()
        cur = conn.cursor()
        cur.execute(
            "DELETE FROM Menu_Items WHERE item_name=%s RETURNING *",
            (self.item_name,)
        )
        deleted = cur.fetchone()
        conn
