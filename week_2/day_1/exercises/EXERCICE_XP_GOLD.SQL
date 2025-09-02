select * from students ;
select first_name , last_name , date_birth from students order by last_name asc limit 4 ;
SELECT first_name, last_name
FROM students
ORDER BY last_name ASC
LIMIT 4;
SELECT first_name, last_name, DATE_BIRTH FROM students
ORDER BY date_BIRTH DESC
LIMIT 1;
SELECT first_name, last_name, DATE_BIRTH
FROM students
ORDER BY last_name ASC
LIMIT 3 OFFSET 2;