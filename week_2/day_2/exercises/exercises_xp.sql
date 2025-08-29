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