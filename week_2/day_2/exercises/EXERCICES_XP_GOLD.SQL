-- 1. Les 2 derniers clients en ordre alphabétique (sans id)
SELECT first_name, last_name
FROM customers
ORDER BY last_name ASC
LIMIT 2;

-- 2. Supprimer les achats faits par Scott
DELETE FROM purchases
WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Scott');

-- 3. Vérifier si Scott existe toujours
SELECT * FROM customers WHERE first_name = 'Scott';

-- 4. Afficher tous les achats (Scott apparaît avec NULL car LEFT JOIN)
SELECT p.id, p.product, c.first_name, c.last_name
FROM purchases p
LEFT JOIN customers c ON p.customer_id = c.id;

-- 5. Afficher tous les achats (Scott disparaît car INNER JOIN)
SELECT p.id, p.product, c.first_name, c.last_name
FROM purchases p
INNER JOIN customers c ON p.customer_id = c.id;
