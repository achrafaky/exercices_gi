DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS items;
CREATE DATABASE public;

CREATE TABLE items (
id SERIAL PRIMARY KEY,  
name VARCHAR(50),       
price INT               
);
CREATE TABLE items (
id SERIAL PRIMARY KEY ,
firstname VARCHAR(50) ,
lastname VARCHAR(50) 
);
INSERT INTO items (name,price) VALUES
('samll disk' , 100),
('Large Disk', 300),
('Fan',80);
INSERT INTO customers (firstname, lastname) VALUES
('Greg', 'Jones'),     
('Sandra', 'Jones'),   
('Scott', 'Scott'),    
('Trevor', 'Green'),  
('Melanie', 'Johnson');
select * from items;
select * from customers; 
select * from items where price >80;
select * from items where price <=300;
select * from customers where last_name = 'Smith';
select * from customers where first_name = 'Trevor';
select * from customers where first_name <> 'Scott';