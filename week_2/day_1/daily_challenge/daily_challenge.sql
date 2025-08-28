DROP TABLE IF EXISTS actors;
CREATE TABLE ACTORS (
id serial primary key ,
first_name varchar(500) not null,
last_name varchar(500) not null,
birth_date date 
);
select count(*) as total_actors 
from actors ;
insert into actors (first_name, last_name, birth_date)
values('','',null);
INSERT INTO actors (first_name, last_name, birth_date)
VALUES
('Rafiq', 'Boubker', '1980-05-12'),
('Youssef', 'Dadas', '1975-11-30'),
('Imane', 'El Idrissi', '1990-08-22'),
('Saad', 'Lamjarred', '1985-04-07'),
('Fatima', 'Zahra', '1992-03-15'),
('Mohammed', 'Bakri', '1982-06-21'),
('Asmae', 'El Mahdi', '1990-11-12'),
('Yasmine', 'Chakiri', '1994-09-02');
