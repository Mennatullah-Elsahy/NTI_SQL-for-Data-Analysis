-- Explanation of JOIN types:
-- INNER JOIN (JOIN): Returns rows where there is a match in both tables.
-- LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table and matching rows from the right table. Non-matching rows from the right table are NULL.
-- RIGHT JOIN (RIGHT OUTER JOIN): Returns all rows from the right table and matching rows from the left table. Non-matching rows from the left table are NULL.
-- FULL JOIN: Combines the results of LEFT JOIN and RIGHT JOIN, showing all rows from both tables with NULL for non-matches.
-- SELF JOIN: A table joins itself (useful for hierarchical data).
-- CROSS JOIN: Produces a Cartesian product of both tables, with all combinations of rows.


-- Create a new database
CREATE DATABASE Employees;

-- Use the newly created database
USE Employees;

-- Create the Employees table
CREATE TABLE Employees (
    First_Name NVARCHAR(50),
    Second_Name NVARCHAR(50), 
    Age INT, 
    new INT, 
    growth FLOAT,
    id_code INT, 
    Sales INT 
);

-- Insert data into the Employees table
INSERT INTO Employees (First_Name, Second_Name, Age, new, growth, id_code, Sales) 
VALUES 
('Sameh', 'Jhon', 26, 19026, 5.27036011080332E-05, 101, 5000),
('noha', 'Fathy', 48, 17057, 333, 106, 3356),
('marawan', 'sayed', 50, 28050, 3121, 107, 663632),
('alaa', 'nabil', 23, 9023, 0.000011395061728395, 102, 10000),
('msouad', 'msouad', 26, 15026, 6.678222222222222E-05, 103, 50000),
('Maha', 'Ahmed', 23, 11023, 9.1099173553719E-05, 104, 19600),
('Osama', 'Mohamed', 57, 17057, 5.90207612456747E-05, 105, 523330),
('noha', 'Fathy', 48, 20048, 5.012E-05, 106, 123320);

-- Create the Salaries table
CREATE TABLE Salaries (
    Code INT, 
    New_Salary INT 
);

-- Insert data into the Salaries table
INSERT INTO Salaries (Code, New_Salary) 
VALUES 
(101, 200000),
(102, 15000),
(103, 14000),
(105, 15000),
(106, 12000),
(107, 30000);

-- Display all data from the Employees table
SELECT * 
FROM Employees;

-- Display all data from the Salaries table
SELECT * 
FROM Salaries;

-- Join the Employees and Salaries tables to combine data
-- INNER JOIN combines rows where the join condition is satisfied (Salaries.Code = Employees.id_code)
SELECT *
FROM Employees
JOIN Salaries
ON Salaries.Code = Employees.id_code;

-- Different types of JOIN operations:
-- LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table (Employees), and matching rows from the right table (Salaries). If no match, NULL values are returned for right table columns.
SELECT *
FROM Employees
LEFT JOIN Salaries
ON Salaries.Code = Employees.id_code;

-- RIGHT JOIN (RIGHT OUTER JOIN): Returns all rows from the right table (Salaries), and matching rows from the left table (Employees). If no match, NULL values are returned for left table columns.
SELECT *
FROM Employees
RIGHT JOIN Salaries
ON Salaries.Code = Employees.id_code;

-- Group data and apply aggregate functions
-- GROUP BY organizes rows into groups, allowing aggregate functions (COUNT, SUM, etc.) to be applied
SELECT First_Name, COUNT(id_code) 
FROM Employees
RIGHT JOIN Salaries
ON Salaries.Code = Employees.id_code
GROUP BY First_Name;

-- Group data and calculate multiple aggregates
-- COUNT counts rows, SUM calculates the total of a column
SELECT First_Name, COUNT(id_code), SUM(Sales)
FROM Employees
RIGHT JOIN Salaries
ON Salaries.Code = Employees.id_code
GROUP BY First_Name;

-- Assign names to calculated columns
-- AS assigns a custom name to a column or calculation
SELECT First_Name, COUNT(id_code) AS CountSales, SUM(Sales) AS SumSales
FROM Employees
RIGHT JOIN Salaries
ON Salaries.Code = Employees.id_code
GROUP BY First_Name;

