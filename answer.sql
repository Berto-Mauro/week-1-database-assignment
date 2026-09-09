-- Week 1 Database Assignment
-- Topic: Library Management System
-- Author: [Your Name]
-- Description: This script creates a database for managing a small
-- library, including books, members, and a record of book loans.

-- 1. CREATE THE DATABASE
-- -----------------------------------------------------------------
DROP DATABASE IF EXISTS library_management;
CREATE DATABASE library_management;
USE library_management;

 -- 2. CREATE TABLES
-- -----------------------------------------------------------------
 
-- Table: authors
-- Stores information about book authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country VARCHAR(50)
);

-- Table: books
-- Stores information about each book in the library
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    published_year YEAR,
    copies_available INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Table: members
-- Stores information about library members
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);


-- Table: loans
-- Tracks which member has borrowed which book, and when
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



-- 3. INSERT SAMPLE DATA
-- -----------------------------------------------------------------
 
-- Authors
INSERT INTO authors (first_name, last_name, country) VALUES
('Chinua', 'Achebe', 'Nigeria'),
('Ngugi', 'wa Thiong''o', 'Kenya'),
('J.K.', 'Rowling', 'United Kingdom'),
('George', 'Orwell', 'United Kingdom'),
('Chimamanda', 'Ngozi Adichie', 'Nigeria');


-- 3. INSERT SAMPLE DATA
-- -----------------------------------------------------------------
 
-- Authors
INSERT INTO authors (first_name, last_name, country) VALUES
('Chinua', 'Achebe', 'Nigeria'),
('Ngugi', 'wa Thiong''o', 'Kenya'),
('J.K.', 'Rowling', 'United Kingdom'),
('George', 'Orwell', 'United Kingdom'),
('Chimamanda', 'Ngozi Adichie', 'Nigeria');


-- Members
INSERT INTO members (first_name, last_name, email) VALUES
('Amara', 'Otieno', 'amara.otieno@example.com'),
('Brian', 'Mwangi', 'brian.mwangi@example.com'),
('Cynthia', 'Wanjiru', 'cynthia.wanjiru@example.com');
 
 
 
 
-- Loans
INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2025-01-10', '2025-01-24'),
(3, 2, '2025-02-01', NULL),
(4, 3, '2025-02-05', '2025-02-19'),
(2, 1, '2025-02-15', NULL);
  
 
 -- 4. EXAMPLE QUERIES (demonstrating the database in use)
-- -----------------------------------------------------------------
 
-- List all books along with their author's full name
SELECT b.title, a.first_name, a.last_name, b.genre, b.published_year
FROM books b
JOIN authors a ON b.author_id = a.author_id;
 
 
 -- List all currently borrowed (not yet returned) books
SELECT m.first_name, m.last_name, b.title, l.loan_date
FROM loans l
JOIN members m ON l.member_id = m.member_id
JOIN books b ON l.book_id = b.book_id
WHERE l.return_date IS NULL;
 
 -- Count how many books each member has borrowed
SELECT m.first_name, m.last_name, COUNT(l.loan_id) AS total_loans
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
GROUP BY m.member_id;
 
 
 
 
 
 
 
 
 
 
 
 
 
 


























