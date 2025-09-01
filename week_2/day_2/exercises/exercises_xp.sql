-- EXERCICE 1 : Items et Customers
CREATE TABLE aky (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL
);
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);
INSERT INTO aky (name, price) VALUES
('Laptop', 950),
('Smartphone', 650),
('Headphones', 120),
('Mouse', 25),
('Keyboard', 45),
('USB Stick', 15);
INSERT INTO customers (first_name, last_name) VALUES
('Achraf', 'Akiyaf'),
('Youssef', 'rokba'),
('Amine', 'Hamada'),
('alal', 'El Fassi'),
('Laila', 'Lmaati'),
('Nadia', 'Smati');

select * from aky 
order by price asc ;
select * from aky where price >=80 order by price desc ;
select first_name , last_name from customers order by first_name asc limit 3 ;
select last_name from customers order by last_name desc ;
---- Exercice 2 :
select * from customer;
SELECT first_name || ' ' || last_name AS full_name
FROM customer;
select distinct create_date from customer ;
select * from customer order by first_name desc;
select film_id,title, description,release_year,rental_rate 
from film 
order by rental_rate asc ;
select address,phone from address
where district='texas';
SELECT *
FROM film
WHERE film_id IN (15, 150);
SELECT film_id, title, description, length, rental_rate
FROM film
WHERE title = 'ACE GOLDFINGER';
SELECT film_id, title, description, length, rental_rate
FROM film
WHERE title LIKE 'AC%';
SELECT film_id, title, rental_rate
FROM film
ORDER BY rental_rate ASC, film_id
LIMIT 10;
SELECT film_id, title, rental_rate
FROM film f1
WHERE (
    SELECT COUNT(*) 
    FROM film f2
    WHERE f2.rental_rate < f1.rental_rate
       OR (f2.rental_rate = f1.rental_rate AND f2.film_id < f1.film_id)
) BETWEEN 10 AND 19
ORDER BY rental_rate ASC, film_id;
SELECT c.first_name, c.last_name, p.amount, p.payment_date
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY c.customer_id;
SELECT f.film_id, f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.film_id IS NULL;
SELECT ci.city, co.country
FROM city ci
JOIN country co ON ci.country_id = co.country_id;
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date, p.staff_id
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY p.staff_id, c.customer_id;
