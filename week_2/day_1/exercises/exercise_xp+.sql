CREATE DATABASE bootcamp;
create table students (
id serial primary key ,
last_name varchar(100) not null,
first_name varchar(100) not null,
date_birth date not null
);
insert into students ( first_name , last_name , date_birth ) values 
('Marc','Benichou','1998-11-02'),
('Yoan', 'Cohen', '2010-12-03'),
('Lea', 'Benichou', '1987-07-27'),
('Amelia', 'Dux', '1996-04-07'),
('David', 'Grez', '2003-06-14'),
('Omer', 'Simpson', '1980-10-03');
insert into students (first_name , last_name , date_birth) values
('Achraf', 'Akiyaf','2004-08-10');
select * from students ;
select first_name , last_name from students ;
select  first_name , last_name from students where id=2;
SELECT first_name, last_name FROM students
WHERE last_name = 'Benichou' AND first_name = 'Marc';
SELECT first_name, last_name FROM students
WHERE last_name = 'Benichou' OR first_name = 'Marc';
select first_name , last_name from students where first_name like '%a%';
select first_name , last_name from students where first_name like 'a%';
SELECT first_name, last_name FROM students
WHERE first_name LIKE '%a';
SELECT first_name, last_name FROM students
WHERE first_name LIKE '%a_';
select first_name , last_name from students where id in (1,3);
SELECT * FROM students WHERE date_birth >= '2000-01-01';