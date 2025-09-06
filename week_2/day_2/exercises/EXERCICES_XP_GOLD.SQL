/* ================================
   EXERCISE 1 : DVD RENTAL
   ================================ */

-- 1) Count how many films there are for each rating
SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating;

-- 2) Get all movies with rating G or PG-13
SELECT title, rating
FROM film
WHERE rating IN ('G', 'PG-13');

-- 3) Filter further: movies under 2 hours, rental_rate < 3.00, sorted alphabetically
SELECT title, rating, length, rental_rate
FROM film
WHERE rating IN ('G', 'PG-13')
  AND length < 120
  AND rental_rate < 3.00
ORDER BY title ASC;

-- 4) Update a customer with your details
UPDATE customer
SET first_name = 'Achraf',
    last_name = 'Akiyaf',
    email = 'akiyafachraf19@gmail.com'
WHERE customer_id = 1;

-- 5) Update the customer’s address
UPDATE address
SET address = 'Rue 130, Ain Chock, Casablanca',
    district = 'Casablanca',
    postal_code = '21100',
    phone = '0778233137'
WHERE address_id = (
  SELECT address_id FROM customer WHERE customer_id = 1
);


/* ================================
   EXERCISE 2 : STUDENTS TABLE
   ================================ */

-- 1) Update birth_date for Lea and Marc Benichou
UPDATE students
SET birth_date = '1998-11-02'
WHERE first_name IN ('Lea', 'Marc')
  AND last_name = 'Benichou';

-- 2) Change last_name of David from Grez to Guez
UPDATE students
SET last_name = 'Guez'
WHERE first_name = 'David' AND last_name = 'Grez';

-- 3) Delete the student Lea Benichou
DELETE FROM students
WHERE first_name = 'Lea' AND last_name = 'Benichou';

-- 4) Count all students
SELECT COUNT(*) AS total_students
FROM students;

-- 5) Count students born after 2000-01-01
SELECT COUNT(*) AS born_after_2000
FROM students
WHERE birth_date > '2000-01-01';

-- 6) Add a column math_grade
ALTER TABLE students ADD COLUMN math_grade INT;

-- 7) Insert grades
UPDATE students SET math_grade = 80 WHERE id = 1;
UPDATE students SET math_grade = 90 WHERE id IN (2, 4);
UPDATE students SET math_grade = 40 WHERE id = 6;

-- 8) Count how many students have grade > 83
SELECT COUNT(*) AS above_83
FROM students
WHERE math_grade > 83;

-- 9) Add another Omer Simpson
INSERT INTO students (first_name, last_name, birth_date, math_grade)
SELECT first_name, last_name, birth_date, 70
FROM students
WHERE first_name = 'Omer' AND last_name = 'Simpson'
LIMIT 1;

-- 10) Bonus: count how many grades each student has
SELECT first_name, last_name, COUNT(math_grade) AS total_grade
FROM students
GROUP BY first_name, last_name;

-- 11) Sum of all students grades
SELECT SUM(math_grade) AS total_sum_grades
FROM students;


/* ================================
   EXERCISE 3 : ITEMS AND CUSTOMERS
   ================================ */

-- 1) Create purchases table
CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    item_id INT REFERENCES items(id),
    quantity_purchased INT
);

-- 2) Insert purchases
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
    (SELECT id FROM customers WHERE first_name = 'Scott' AND last_name = 'Scott'),
    (SELECT id FROM items WHERE name = 'Fan'),
    1
);

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
    (SELECT id FROM customers WHERE first_name = 'Melanie' AND last_name = 'Johnson'),
    (SELECT id FROM items WHERE name = 'Large Desk'),
    10
);

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
    (SELECT id FROM customers WHERE first_name = 'Greg' AND last_name = 'Jones'),
    (SELECT id FROM items WHERE name = 'Small Desk'),
    2
);

-- 3) Show all purchases
SELECT * FROM purchases;

-- 4) Join purchases with customers
SELECT p.id, c.first_name, c.last_name, p.quantity_purchased
FROM purchases p
JOIN customers c ON p.customer_id = c.id;

-- 5) Purchases of customer with ID = 5
SELECT * FROM purchases
WHERE customer_id = 5;

-- 6) Purchases for a large desk AND a small desk
SELECT c.first_name, c.last_name, i.name AS item, p.quantity_purchased
FROM purchases p
JOIN customers c ON p.customer_id = c.id
JOIN items i ON p.item_id = i.id
WHERE i.name IN ('Large Desk', 'Small Desk');

-- 7) Show all customers who made a purchase
SELECT c.first_name, c.last_name, i.name AS item
FROM purchases p
JOIN customers c ON p.customer_id = c.id
JOIN items i ON p.item_id = i.id;

-- 8) Add invalid row (without item_id) -> this will fail if NOT NULL constraint is set
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (1, NULL, 1);
