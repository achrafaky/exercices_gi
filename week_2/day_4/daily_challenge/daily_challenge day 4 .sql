import psycopg2
import requests
import random

# --- Configuration base de données ---
DB_NAME = "your_database"
DB_USER = "your_username"
DB_PASSWORD = "your_password"
DB_HOST = "localhost"
DB_PORT = "5432"

# --- Connexion à PostgreSQL ---
conn = psycopg2.connect(
    dbname=DB_NAME,
    user=DB_USER,
    password=DB_PASSWORD,
    host=DB_HOST,
    port=DB_PORT
)
cur = conn.cursor()

# --- Création de la table countries ---
cur.execute("""
    CREATE TABLE IF NOT EXISTS countries (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        capital VARCHAR(100),
        flag TEXT,
        subregion VARCHAR(100),
        population BIGINT
    )
""")
conn.commit()

# --- Récupération des pays depuis l'API ---
url = "https://restcountries.com/v3.1/all?fields=name,capital,flags,subregion,population"
response = requests.get(url)

if response.status_code == 200:
    countries_data = response.json()
    
    # Sélectionner 10 pays aléatoires
    random_countries = random.sample(countries_data, 10)
    
    for country in random_countries:
        name = country["name"]["common"]
        capital = country.get("capital", ["Unknown"])[0]
        flag = country["flags"]["png"]  # ou .get("emoji") si dispo
        subregion = country.get("subregion", "Unknown")
        population = country.get("population", 0)
        
        # Insertion dans PostgreSQL
        cur.execute("""
            INSERT INTO countries (name, capital, flag, subregion, population)
            VALUES (%s, %s, %s, %s, %s)
        """, (name, capital, flag, subregion, population))
    
    conn.commit()
    print("✅ 10 pays insérés avec succès dans la base de données.")
else:
    print("❌ Erreur lors de la récupération des données depuis l’API.")

# --- Fermeture ---
cur.close()
conn.close()
