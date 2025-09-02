-------------- exercice 1
SELECT RATING, COUNT(*) AS FILM_COUNT FROM FILM GROUP BY RATING ORDER BY RATING;
select film_id,title, rating ,length ,rental_rate from film where rating IN ('G','PG-13') ORDER BY TITLE;
SELECT FILM_ID , TITLE , RATING , LENGTH,RENTAL_RATE FROM FILM WHERE RATING IN ('G','PG-13') 
AND LENGTH < 120
AND RENTAL_RATE <3.00
ORDER BY TITLE;
UPDATE customer
SET first_name = 'Achraf',
    last_name = 'Akiyaf',
    email = 'akiyafachraf19@gmail.com',
    last_update = now()   
WHERE customer_id = 5;


SELECT c.customer_id, c.first_name, c.last_name, a.address_id, a.address, a.city_id
FROM customer c
JOIN address a ON c.address_id = a.address_id
WHERE c.customer_id = 5;


UPDATE address
SET address = '123 Rue de ain chock',
    district = 'Casablanca',
    postal_code = '20000',
    phone = '0778233137'
WHERE address_id = (
    SELECT address_id FROM customer WHERE customer_id = 5
);

SELECT customer_id, first_name, last_name, email, address_id, active, create_date, last_update
FROM customer
WHERE customer_id = 5;

COMMIT; 
-- =======================================exercice 2