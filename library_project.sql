-- Library System Management SQL Project

-- CREATE DATABASE library;

use library;

-- Create table "Branch"
DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(30),
            contact_no VARCHAR(15)
);

-- Create table "Employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
            emp_id VARCHAR(10) PRIMARY KEY,
            emp_name VARCHAR(30),
            position VARCHAR(30),
            salary DECIMAL(10,2),
            branch_id VARCHAR(10),
            FOREIGN KEY (branch_id) REFERENCES  branch(branch_id)
);


-- Create table "Members"
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
            member_id VARCHAR(10) PRIMARY KEY,
            member_name VARCHAR(30),
            member_address VARCHAR(30),
            reg_date DATE
);



-- Create table "Books"
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price DECIMAL(10,2),
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);



-- Create table "IssueStatus"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(30),
            issued_book_name VARCHAR(80),
            issued_date DATE,
            issued_book_isbn VARCHAR(50),
            issued_emp_id VARCHAR(10),
            FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
            FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
            FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn) 
);



-- Create table "ReturnStatus"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);


INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');
SELECT * FROM members;


-- Insert values into each branch table
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');
SELECT * FROM branch;


-- Insert values into each employees table
INSERT INTO employees(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');
SELECT * FROM employees;


-- Inserting into books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');

-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102'),
('IS151', 'C118', 'The Catcher in the Rye', SUBDATE(CURRENT_DATE, INTERVAL 24 DAY), '978-0-553-29698-2', 'E108'),
('IS152', 'C119', 'The Catcher in the Rye', SUBDATE(CURRENT_DATE, INTERVAL 13 DAY), '978-0-553-29698-2', 'E109'),
('IS153', 'C106', 'Pride and Prejudice', SUBDATE(CURRENT_DATE, INTERVAL 7 DAY), '978-0-14-143951-8', 'E107'),
('IS154', 'C105', 'The Road', SUBDATE(CURRENT_DATE, INTERVAL 32 DAY), '978-0-375-50167-0', 'E101');
SELECT * FROM issued_status;



-- inserting into return table
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES
('RS101', 'IS101', '2023-06-06'),
('RS102', 'IS105', '2023-06-07'),
('RS103', 'IS103', '2023-08-07'),
('RS104', 'IS106', '2024-05-01'),
('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');

ALTER TABLE return_status
ADD Column book_quality VARCHAR(15) DEFAULT('Good');

SET sql_safe_updates=0;

UPDATE return_status
SET book_quality = 'Damaged'
WHERE issued_id IN ('IS112', 'IS117', 'IS118');

SELECT * FROM return_status;


-- Query 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books values("978-1-60129-456-2", 'To Kill a Mockingbird', 
						'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
                        
select * from books;

--Expalnation
-- The query inserts a new book record for "To Kill a Mockingbird" into the books table with details like ISBN, genre, price, stock status, author, and publisher. 
-- Then, it retrieves all records from the books table to display the updated list.

-- Query2: Update an Existing Member's Address

update members set member_address="125 Main St" where member_id="C101";

select * from members;

--Explanation
-- The query updates the member_address of the member with member_id "C101" to "125 Main St" in the members table. 
-- It then retrieves all records from the members table to display the updated information.

-- Query 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS107' from the issued_status table.

delete from issued_status where issued_id="IS107";

--Explanation
-- The query deletes the record from the issued_status table where issued_id is "IS107". 
-- This operation removes the specified entry, and any related data associated with this issued_id will no longer exist in the table.

-- Query 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

select * from issued_status where issued_emp_id="E101"

--Explanation
-- The query retrieves all columns and records from the `issued_status` table where the `issued_emp_id` is "E101". 
-- It displays the complete information for all entries related to the employee with the ID "E101".

-- Query 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

select issued_member_id from issued_status 
group by issued_member_id
having count(issued_member_id)>1;

--Explanation
-- The query selects the `issued_member_id` from the `issued_status` table and groups the results by `issued_member_id`. 
-- It then filters these groups using the `HAVING` clause to show only those `issued_member_id`s that appear **more than once** (i.e., having a count greater than 1). 
-- This helps identify members who have multiple issued records.


-- Query 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

create table book_cnts as
select 
     b.isbn,b.book_title,
     count(ist.issued_id) as no_issued
 from books as b 
join 
issued_status as ist 
on ist.issued_book_isbn=b.isbn
group by b.isbn,b.book_title;

select * from book_cnts;

--Explanation
-- The query creates a new table named book_cnts that contains three columns: isbn, book_title, and no_issued. 
-- It joins the books table with the issued_status table based on the matching ISBN (issued_book_isbn). For each book, it counts the number of times it has been issued (issued_id) and stores this count as no_issued. 
-- the SELECT statement retrieves all records from book_cnts, showing the ISBN, title, and total issue count for each book.

-- Query 7. **Retrieve All Books in a Specific Category:

select * from books
where category="classic";

--Explanation
-- This query will return all book records from the books table that belong to the "classic" genre, displaying details such as ISBN, title, author, price, etc., for each classic book.

-- Query 8: Find Total Rental Income by Category:
select 
b.category, sum(b.rental_price) as total_rent_price
from books as b 
join 
issued_status as ist 
on ist.issued_book_isbn=b.isbn
group by b.category;

--Explanation
-- The query joins the books table with the issued_status table on the isbn and issued_book_isbn columns to filter out only the books that have been issued. 
-- It then calculates the sum of the rental_price for each book category and groups the results by the category of the book.

-- Query 9. **List Members Who Registered in the Last 180 Days**:

select * from members
where reg_date>=subdate(current_date(),interval 180 day);

--Explanation
-- The query selects all records from the members table where the reg_date (registration date) is within the last 180 days from the current date.

-- Query 10: List Employees with Their Branch Manager's Name and their branch details**:

select e1.*,e2.emp_name as manager,b.manager_id from 
employees as e1
join 
branch as b
on b.branch_id=e1.branch_id
join employees as e2 
on b.manager_id =e2.emp_id;

--Explanation
-- The query returns all employee details (e1.*), their manager's name (manager), and the manager_id from the branch table. 
-- It’s useful for identifying employees along with their respective managers based on branch data.

-- Query 11. Create a Table of Books with Rental Price Above a Certain Threshold 7USD:

create table books_price_greater_than_seven as
select * from books
where rental_price>7;

select * from books_price_greater_than_seven;

--Explanation
-- The first query creates a new table `books_price_greater_than_seven` with books whose rental price is greater than 7. 
-- The second query selects and displays all records from books_price_greater_than_seven

-- Query 12: Retrieve the List of Books Not Yet Returned

select  ist.issued_book_name
from issued_status as ist
left join
return_status as rs
on ist.issued_id=rs.issued_id
where rs.return_id is null;

--Exlanation
-- The query selects the names of books from the issued_status table that have not been returned yet by performing a LEFT JOIN with the return_status table. 
-- It filters the results where the return_id is NULL, indicating the books are still issued.

-- Query 13: Identify Members with Overdue Books
 -- Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's name, book title, issue date, and days overdue.

SELECT 
    ist.issued_member_id,
    m.member_name,
    bk.book_title,
    ist.issued_date,
    -- rs.return_date,
    CURRENT_DATE - ist.issued_date as over_dues_days
FROM issued_status as ist
JOIN 
members as m
    ON m.member_id = ist.issued_member_id
JOIN 
books as bk
ON bk.isbn = ist.issued_book_isbn
LEFT JOIN 
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE 
    rs.return_date IS NULL
    AND
    (CURRENT_DATE - ist.issued_date) > 30
ORDER BY ist.issued_member_id;

--Explanation
-- This query is designed to retrieve information about overdue books that have been issued for more than 30 days and have not been returned. 
-- It selects the member ID (issued_member_id) and name (member_name), the title of the book (book_title), the date the book was issued (issued_date), and calculates the number of overdue days (over_dues_days) by subtracting the issued_date from the current date. 
-- The data is sourced from the issued_status table, with joins to the members and books tables to fetch the relevant details about the member and the book. 
-- A LEFT JOIN with the return_status table ensures that only books that have not been returned are included, as it checks where return_date is NULL. 
-- The query filters for books that have been issued for more than 30 days and sorts the results by issued_member_id to group the books by the member. 

-- Query 14: Update Book Status on Return
-- Write a query to update the status of books in the books table to "available" when they are returned (based on entries in the return_status table).

-- Store Procedures
delimiter $$
CREATE PROCEDURE add_return_records(in p_return_id VARCHAR(10),in  p_issued_id VARCHAR(10),in p_book_quality VARCHAR(10))
Begin
DECLARE v_isbn VARCHAR(50);
DECLARE v_book_name VARCHAR(80);
    INSERT INTO return_status(return_id, issued_id, return_date, book_quality)
    VALUES
    (p_return_id, p_issued_id, CURRENT_DATE, p_book_quality);

    SELECT 
        issued_book_isbn,
        issued_book_name
        INTO
        v_isbn,
        v_book_name
    FROM issued_status
    WHERE issued_id = p_issued_id;

    UPDATE books
    SET status = 'yes'
    WHERE isbn = v_isbn;

    select concat('Thank you for returning the book: %', v_book_name) AS message;
    
END $$
delimiter ;

CALL add_return_records('RS138','IS135','GOOD');

CALL add_return_records('RS148', 'IS140', 'Good');

--Expalnation
-- The add_return_records procedure manages the process of recording a book return in a library system. 
-- It takes three input parameters: p_return_id (the ID for the return record), p_issued_id (the ID of the issued book), and p_book_quality (the condition of the returned book). First, the procedure inserts a new record into the return_status table with the provided details, including the current date as the return date and the specified book quality. 
-- It then fetches the isbn and book_name from the issued_status table based on the given p_issued_id, storing them in variables. 
-- The procedure proceeds by updating the books table, setting the status of the book (identified by the ISBN) to 'yes', marking it as returned. 
-- It constructs and displays a message that thanks the user for returning the book, using the book's name in the message. 
-- This stored procedure ensures that return records are properly logged, the book's status is updated, and the user receives acknowledgment for their return. 

-- Query 15: Branch Performance Report
-- Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.

CREATE TABLE branch_reports
AS
SELECT 
    b.branch_id,
    b.manager_id,
    COUNT(ist.issued_id) as number_book_issued,
    COUNT(rs.return_id) as number_of_book_return,
    SUM(bk.rental_price) as total_revenue
FROM issued_status as ist
JOIN 
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
JOIN 
books as bk
ON ist.issued_book_isbn = bk.isbn
GROUP BY  b.branch_id, b.manager_id
order by b.branch_id, b.manager_id;

SELECT * FROM branch_reports;

--Explanation
-- The branch_reports table is created by aggregating data from multiple tables, including issued_status, return_status, books, employees, and branch. 
-- It calculates the total number of books issued, the number of books returned, and the total revenue for each branch, grouped by branch_id and manager_id. 
-- The result provides insights into the activity and financial performance of each branch, such as the number of transactions and the revenue generated from book rentals, with the data sorted by branch and manager for easy analysis.

-- Query 16: CTAS: Create a Table of Active Members
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2 months.

CREATE TABLE active_members
AS
SELECT * FROM members
WHERE member_id IN (SELECT 
                        DISTINCT issued_member_id   
                    FROM issued_status
                    WHERE 
                        issued_date >= subdate(CURDATE(),INTERVAL 2 month)
                    );
				
SELECT * FROM active_members;

--Explanation
-- The active_members table is designed to identify and store members who have actively issued books within the last two months. 
-- It first selects distinct member IDs from the issued_status table where the issued_date is within the last two months, ensuring only members who have recently borrowed books are included. 
-- The outer query then pulls the full details of these members from the members table by matching the member_id to those found in the subquery. 
-- This process creates a list of active members, offering a way to track recent book borrowers

-- Query 17: Find Employees with the Most Book Issues Processed
-- Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.

SELECT 
    e.emp_name,
    b.*,
    COUNT(ist.issued_id) as no_book_issued
FROM issued_status as ist
JOIN
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
GROUP BY 1, 2;

--Explanation
-- This query retrieves the name of each employee, their associated branch details, and the total number of books they have issued, grouped by employee and branch. 
-- The COUNT(ist.issued_id) provides a count of issued books per employee, helping to track employee activity and performance. 
-- The GROUP BY ensures the results are aggregated by employee and branch, allowing insights into book issuance at the branch level.

-- Query 18: Stored Procedure
-- Objective: Create a stored procedure to manage the status of books in a library system.
/* Description: Write a stored procedure that updates the status of a book based on its issuance or return. Specifically:
    If a book is issued, the status should change to 'no'.
    If a book is returned, the status should change to 'yes'.
*/

delimiter $$
CREATE PROCEDURE issue_book(p_issued_id VARCHAR(10), p_issued_member_id VARCHAR(30), p_issued_book_isbn VARCHAR(30), p_issued_emp_id VARCHAR(10))

BEGIN
DECLARE v_status VARCHAR(10);
    SELECT 
        status 
        INTO
        v_status
    FROM books
    WHERE isbn = p_issued_book_isbn;

    IF v_status = 'yes' THEN

        INSERT INTO issued_status(issued_id, issued_member_id, issued_date, issued_book_isbn, issued_emp_id)
        VALUES
        (p_issued_id, p_issued_member_id, CURRENT_DATE, p_issued_book_isbn, p_issued_emp_id);

        UPDATE books
            SET status = 'no'
        WHERE isbn = p_issued_book_isbn;

        select concat('Book records added successfully for book isbn : %', p_issued_book_isbn);


    ELSE
        select concat('Sorry to inform you the book you have requested is unavailable book_isbn: %', p_issued_book_isbn);
    END IF;

    
END $$
delimeter ;

CALL issue_book('IS155', 'C108', '978-0-553-29698-2', 'E104');

CALL issue_book('IS156', 'C108', '978-0-375-41398-8', 'E104');

--Explanation
-- The issue_book stored procedure is designed to handle the issuance of books in a library system. 
-- It accepts four input parameters: the issue ID, member ID, book ISBN, and employee ID. The procedure first checks if the book is available by querying its status from the books table. 
-- If the book's status is 'yes' (available), it inserts a new record into the issued_status table with the provided details (issue ID, member ID, book ISBN, and employee ID), updates the book's status to 'no' (marking it as issued), and displays a success message confirming the issuance. 
-- If the book is unavailable (status is not 'yes'), the procedure displays a message informing the user that the book is not available. The procedure ensures that only available books are issued and provides immediate feedback based on the book's availability.