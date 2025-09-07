-- =====================================================
-- 🌟 Exercise 1 : DVD Rental
-- =====================================================

-- 1. Get a list of all the languages
SELECT * FROM language;

-- 2. Get a list of all films joined with their languages
SELECT f.title, f.description, l.name AS language_name
FROM film f
JOIN language l ON f.language_id = l.language_id;

-- 3. Get all languages, even if there are no films in those languages
SELECT f.title, f.description, l.name AS language_name
FROM language l
LEFT JOIN film f ON f.language_id = l.language_id;

-- 4. Create a new table called new_film
CREATE TABLE new_film (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 5. Insert some new films
INSERT INTO new_film (name) VALUES ('Matrix Reloaded'), ('Inception'), ('Interstellar');

-- 6. Create a new table customer_review
CREATE TABLE customer_review (
    review_id SERIAL PRIMARY KEY,
    film_id INT REFERENCES new_film(id) ON DELETE CASCADE,
    language_id INT REFERENCES language(language_id),
    title VARCHAR(200),
    score INT CHECK(score BETWEEN 1 AND 10),
    review_text TEXT,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Add 2 reviews
INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES
(1, 1, 'Amazing Sci-Fi', 9, 'Great movie with futuristic vision'),
(2, 1, 'Mind Blowing', 10, 'Inception is one of the best films ever');

-- 8. Delete a film with a review
DELETE FROM new_film WHERE id = 1;
-- => The related review in customer_review is also deleted (because of ON DELETE CASCADE)


-- =====================================================
-- 🌟 Exercise 2 : DVD Rental
-- =====================================================

-- 1. Use UPDATE to change the language of some films
UPDATE film SET language_id = 2 WHERE film_id = 10;
UPDATE film SET language_id = 3 WHERE film_id = 20;

-- 2. Which foreign keys are defined for the customer table?
-- Usually: address_id REFERENCES address(address_id),
--          store_id REFERENCES store(store_id)
-- => This means we must insert valid address_id and store_id when adding a new customer.

-- 3. Drop the customer_review table
DROP TABLE customer_review;
-- This step may require checking constraints if other tables depend on it.

-- 4. Find how many rentals are still outstanding
SELECT COUNT(*) AS outstanding_rentals
FROM rental
WHERE return_date IS NULL;

-- 5. Find the 30 most expensive outstanding movies
SELECT f.title, f.rental_rate
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date IS NULL
ORDER BY f.rental_rate DESC
LIMIT 30;

-- 6. Help your friend find the 4 movies

-- 1st film: about a sumo wrestler, actor Penelope Monroe
SELECT f.title
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.first_name = 'Penelope' AND a.last_name = 'Monroe'
AND f.description ILIKE '%sumo wrestler%';

-- 2nd film: short documentary, < 1 hour, rated R
SELECT f.title
FROM film f
WHERE f.length < 60 AND f.rating = 'R'
AND f.description ILIKE '%documentary%';

-- 3rd film: rented by Matthew Mahan, paid > $4, returned between 28 July and 1 Aug 2005
SELECT f.title
FROM rental r
JOIN payment p ON r.rental_id = p.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.first_name = 'Matthew' AND c.last_name = 'Mahan'
AND p.amount > 4.00
AND r.return_date BETWEEN '2005-07-28' AND '2005-08-01';

-- 4th film: watched by Matthew Mahan, "boat" in title or description, expensive to replace
SELECT f.title, f.replacement_cost
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.first_name = 'Matthew' AND c.last_name = 'Mahan'
AND (f.title ILIKE '%boat%' OR f.description ILIKE '%boat%')
ORDER BY f.replacement_cost DESC
LIMIT 1;
