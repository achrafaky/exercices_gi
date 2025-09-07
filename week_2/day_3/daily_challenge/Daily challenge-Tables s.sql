-- =====================================================
-- PART I : One-to-One Relationship (Customer - CustomerProfile)
-- =====================================================

-- 1. Create the Customer table
DROP TABLE IF EXISTS CustomerProfile;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL
);

-- 2. Create the CustomerProfile table (1:1 relationship)
CREATE TABLE CustomerProfile (
    id SERIAL PRIMARY KEY,
    isLoggedIn BOOLEAN DEFAULT FALSE,
    customer_id INT UNIQUE,  -- 1:1 relation (unique reference)
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
        REFERENCES Customer(id)
        ON DELETE CASCADE
);

-- 3. Insert Customers
INSERT INTO Customer (first_name, last_name)
VALUES ('John', 'Doe'),
       ('Jerome', 'Lalu'),
       ('Lea', 'Rive');

-- 4. Insert CustomerProfiles (with subqueries)
INSERT INTO CustomerProfile (isLoggedIn, customer_id)
VALUES (TRUE,  (SELECT id FROM Customer WHERE first_name='John')),
       (FALSE, (SELECT id FROM Customer WHERE first_name='Jerome'));
-- Lea has no profile

-- -------------------
-- QUERIES
-- -------------------

-- a) Display first_name of LoggedIn customers
SELECT c.first_name
FROM Customer c
JOIN CustomerProfile cp ON c.id = cp.customer_id
WHERE cp.isLoggedIn = TRUE;

-- b) Display all customers with their isLoggedIn status
SELECT c.first_name, COALESCE(cp.isLoggedIn, FALSE) AS isLoggedIn
FROM Customer c
LEFT JOIN CustomerProfile cp ON c.id = cp.customer_id;

-- c) Number of customers NOT logged in
SELECT COUNT(*) AS not_logged_in_count
FROM Customer c
LEFT JOIN CustomerProfile cp ON c.id = cp.customer_id
WHERE COALESCE(cp.isLoggedIn, FALSE) = FALSE;


-- =====================================================
-- PART II : Many-to-Many Relationship (Book - Student - Library)
-- =====================================================

-- 1. Create Book table
DROP TABLE IF EXISTS Library;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Book;

CREATE TABLE Book (
    book_id SERIAL PRIMARY KEY,
    title   VARCHAR(100) NOT NULL,
    author  VARCHAR(100) NOT NULL
);

-- 2. Insert Books
INSERT INTO Book (title, author)
VALUES ('Alice In Wonderland', 'Lewis Carroll'),
       ('Harry Potter', 'J.K Rowling'),
       ('To kill a mockingbird', 'Harper Lee');

-- 3. Create Student table (age <= 15 constraint)
CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    age INT CHECK (age <= 15)
);

-- 4. Insert Students
INSERT INTO Student (name, age)
VALUES ('John', 12),
       ('Lera', 11),
       ('Patrick', 10),
       ('Bob', 14);

-- 5. Create Library (junction table)
CREATE TABLE Library (
    book_fk_id INT,
    student_fk_id INT,
    borrowed_date DATE,
    PRIMARY KEY (book_fk_id, student_fk_id, borrowed_date),
    CONSTRAINT fk_book FOREIGN KEY (book_fk_id)
        REFERENCES Book(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_student FOREIGN KEY (student_fk_id)
        REFERENCES Student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 6. Insert records (using subqueries)
INSERT INTO Library (book_fk_id, student_fk_id, borrowed_date)
VALUES
((SELECT book_id FROM Book WHERE title='Alice In Wonderland'),
 (SELECT student_id FROM Student WHERE name='John'),
 '2022-02-15'),

((SELECT book_id FROM Book WHERE title='To kill a mockingbird'),
 (SELECT student_id FROM Student WHERE name='Bob'),
 '2021-03-03'),

((SELECT book_id FROM Book WHERE title='Alice In Wonderland'),
 (SELECT student_id FROM Student WHERE name='Lera'),
 '2021-05-23'),

((SELECT book_id FROM Book WHERE title='Harry Potter'),
 (SELECT student_id FROM Student WHERE name='Bob'),
 '2021-08-12');

-- -------------------
-- QUERIES
-- -------------------

-- a) Select all columns from junction table
SELECT * FROM Library;

-- b) Select the name of the student and the title of the borrowed books
SELECT s.name, b.title, l.borrowed_date
FROM Library l
JOIN Student s ON l.student_fk_id = s.student_id
JOIN Book b ON l.book_fk_id = b.book_id;

-- c) Average age of children who borrowed "Alice In Wonderland"
SELECT ROUND(AVG(s.age),2) AS avg_age
FROM Library l
JOIN Student s ON l.student_fk_id = s.student_id
JOIN Book b ON l.book_fk_id = b.book_id
WHERE b.title = 'Alice In Wonderland';

-- d) Delete a student and check cascade effect
DELETE FROM Student WHERE name = 'Bob';

-- After deleting Bob, check Library again
SELECT * FROM Library;
