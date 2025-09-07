-- =====================================================
-- 🌟 Exercise 1 : DVD Rentals
-- =====================================================

-- 1. Get a list of all rentals which are out (not returned)
-- We identify them when return_date IS NULL
SELECT r.rental_id, r.rental_date, f.title, c.first_name, c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE r.return_date IS NULL;

-- 2. Get a list of all customers who have not returned their rentals (grouped)
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS outstanding_rentals
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
WHERE r.return_date IS NULL
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY outstanding_rentals DESC;

-- 3. Get a list of all Action films with Joe Swank
SELECT f.title, f.description
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE c.name = 'Action'
  AND a.first_name = 'Joe' AND a.last_name = 'Swank';

-- 💡 Shortcut: Create a VIEW to simplify queries
CREATE OR REPLACE VIEW outstanding_rentals AS
SELECT r.rental_id, r.rental_date, f.title, c.first_name, c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE r.return_date IS NULL;


-- =====================================================
-- 🌟 Exercise 2 : Happy Halloween
-- =====================================================

-- 1. How many stores there are, and in which city and country
SELECT s.store_id, ci.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 2. How many hours of viewing time there are in each store
-- (sum of film length of inventory items)
-- Exclude items that are not yet returned
SELECT s.store_id, SUM(f.length) AS total_minutes, 
       ROUND(SUM(f.length)/60.0,2) AS total_hours
FROM store s
JOIN inventory i ON s.store_id = i.store_id
JOIN film f ON i.film_id = f.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL
GROUP BY s.store_id;

-- 3. A list of all customers in the cities where the stores are located
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, ci.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
WHERE ci.city_id IN (
    SELECT ci.city_id
    FROM store s
    JOIN address a ON s.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
);

-- 4. A list of all customers in the countries where the stores are located
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country_id IN (
    SELECT co.country_id
    FROM store s
    JOIN address a ON s.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN country co ON ci.country_id = co.country_id
);

-- 5. Create a "safe list" of movies excluding horror/zombie themes
SELECT f.title, f.length
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name <> 'Horror'
  AND f.title !~* '(beast|monster|ghost|dead|zombie|undead)'
  AND f.description !~* '(beast|monster|ghost|dead|zombie|undead)';

-- 6. Sum of their viewing time in minutes, hours, and days
SELECT SUM(f.length) AS total_minutes,
       ROUND(SUM(f.length)/60.0,2) AS total_hours,
       ROUND(SUM(f.length)/1440.0,2) AS total_days
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name <> 'Horror'
  AND f.title !~* '(beast|monster|ghost|dead|zombie|undead)'
  AND f.description !~* '(beast|monster|ghost|dead|zombie|undead)';
