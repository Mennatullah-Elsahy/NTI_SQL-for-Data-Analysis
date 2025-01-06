/*
-- SQL Command Groups:
-----------------------------------
-- 1. Data Definition Language (DDL):
-- These commands define or modify the structure of a database or its objects.
-- Examples:
    CREATE: Used to create a new database or table.
        CREATE TABLE Employees (ID INT, Name VARCHAR(50), Age INT);
    ALTER: Used to modify an existing table structure.
        ALTER TABLE Employees ADD Salary DECIMAL(10, 2);
    DROP: Used to delete a database, table, or other objects.
        DROP TABLE Employees;
    TRUNCATE: Removes all rows from a table but keeps the structure.
        TRUNCATE TABLE Employees;

-----------------------------------
-- 2. Data Manipulation Language (DML):
-- These commands manipulate the data inside tables.
-- Examples:
    SELECT: Retrieves data from one or more tables.
        SELECT * FROM Employees;
    INSERT: Adds new records to a table.
        INSERT INTO Employees (ID, Name, Age) VALUES (1, 'John', 30);
    UPDATE: Modifies existing records in a table.
        UPDATE Employees SET Age = 35 WHERE ID = 1;
    DELETE: Removes specific records from a table.
        DELETE FROM Employees WHERE Age > 30;

-----------------------------------
-- 3. Transaction Control Language (TCL):
-- These commands manage transactions in a database.
-- Examples:
    COMMIT: Saves changes made by a transaction permanently.
        COMMIT;
    ROLLBACK: Undoes changes made by a transaction.
        ROLLBACK;
    SAVEPOINT: Sets a point to which a transaction can be rolled back.
        SAVEPOINT SP1;

-----------------------------------
-- 4. Data Control Language (DCL):
-- These commands control access to data in the database.
-- Examples:
    GRANT: Grants privileges to a user.
        GRANT SELECT ON Employees TO User1;
    REVOKE: Removes privileges from a user.
        REVOKE SELECT ON Employees FROM User1;

-----------------------------------
-- 5. Data Query Language (DQL):
-- This group technically includes only the SELECT command.
-- Example:
        SELECT * FROM Employees;
*/

----------------------------------------------------------------------------------------------------------------------------------
-- Create a new database
-- CREATE DATABASE is used to create a new database
CREATE DATABASE Revision;

-- Use the newly created database
-- USE specifies which database to operate on
USE Revision;

-- Modify the database name
-- ALTER DATABASE with MODIFY NAME changes the database name
ALTER DATABASE Revision
      MODIFY Name = Company

-- Delete the database permanently
-- DROP DATABASE removes the entire database
DROP DATABASE Company;

-- Create a new table
-- CREATE TABLE defines a new table with specified columns and data types
/*
CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype constraints,
    column3 datatype constraints,
    ...
);
constraints: (ex: PRIMARY KEY, NOT NULL, UNIQUE, etc).
*/
CREATE TABLE Customers(
	First_Name nchar(100),
	Second_Name char(100),
	Age             int
);

-- Insert data into the table
-- INSERT INTO adds a new row to the specified table
INSERT INTO Customers (First_Name, Second_Name, Age)
VALUES ('Menna', 'Muhammad', 23);

-- Add a new column to the table
-- ALTER TABLE with ADD adds a new column to an existing table
ALTER TABLE Customers
ADD Email char;

-- To change the data type of a column
-- ALTER TABLE with ALTER COLUMN modifies the column's data type
ALTER TABLE Customers
ALTER COLUMN Age VARCHAR(10);

-- Delete the entire table
-- DROP TABLE removes the specified table and its data
DROP TABLE Customers;

-- Create a new table with additional attributes
-- CREATE TABLE defines a table with multiple columns and data types
CREATE TABLE Employees (
    First_Name NVARCHAR(50),
    Second_Name NVARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2)
);
-- Insert multiple rows into the Employees' table
-- INSERT INTO adds multiple rows at once
INSERT INTO Employees (First_Name, Second_Name, Age, Salary)
VALUES
('Sameh', 'Jhon', 26, 19000),
('Alaa', 'Nabil', 25, 9000),
('Mahmoud', 'Essam', 26, 15000),
('Maha', 'Ahmed', 23, 11000),
('Osama', 'Mohamed', 57, 17000),
('Noha', 'Fathy', 48, 20000),
('Marawan', 'Sayed', 50, 28000),
('Nabil', 'Emad', 39, 21000),
('Nabil', 'Emad', 39, 21000),
('Nabil', 'Emad', 39, 21000);

-- Display all data from the table
-- SELECT * retrieves all rows and columns
SELECT *
FROM Employees;

-- Display specific columns only
-- SELECT retrieves specified columns
SELECT First_Name
FROM Employees;

-- Display multiple specific columns
SELECT First_Name,Age
FROM Employees;

-- Display rows matching a condition
-- WHERE filters rows based on a condition
SELECT First_Name,Second_Name
FROM Employees
WHERE First_Name ='Maha';

-- Rename the table
-- sp_rename is used to rename a table
-- Unlike renaming a database, where we can use the ALTER command, renaming a table cannot be done with ALTER.
-- Instead, we use the 'sp_rename' stored procedure to rename a table.
-- Example: sp_rename 'OldTableName', 'NewTableName';
sp_rename 'Employees', 'NewEmployees';

sp_rename 'NewEmployees', 'Employees';

/*
-- Comparison between DROP and DELETE:
-- DROP: Permanently removes an entire database, table, or other database objects. 
-- It completely deletes the structure along with all data and cannot be rolled back.
-- DROP is part of Data Definition Language (DDL).
-- Example: DROP DATABASE + NAME OF THE DATABASE; 
			or 
			DROP TABLE + NAME OF THE TABLE;
-- 
-- DELETE: Removes specific rows from a table based on a condition using the WHERE clause.
-- It does not delete the table structure, and data removal can be rolled back if wrapped in a transaction.
-- DELETE is part of Data Manipulation Language (DML).
-- Example: DELETE FROM Employees WHERE Age > 30;
*/


-- Delete specific rows from the table
DELETE 
FROM Employees
WHERE First_Name = 'Alaa';

-- Update specific values in the table
-- UPDATE modifies values based on a condition using where
-- SET specifies the new value
UPDATE Employees
SET Second_Name = 'essam'
WHERE  Second_Name = 'Essam';

-- Use AND/OR for multiple conditions
-- AND requires all conditions to be true, OR requires at least one to be true
UPDATE Employees
SET Age = 23
WHERE  First_Name = 'Sameh' And Second_Name = 'Jhon';

-- Display data without duplicates use distinct after select 
-- DISTINCT eliminates duplicate rows
SELECT DISTINCT *
FROM Employees;

SELECT DISTINCT Second_Name, Age
FROM Employees;

-- Count the number of rows or values
-- COUNT calculates the number of rows or non-NULL values
SELECT COUNT(Age)
FROM Employees;

-- Count distinct values
SELECT COUNT( distinct Age)
FROM Employees;

-- Perform aggregate calculations
-- SUM / AVG / MIN / MAX calculate total, average, minimum, and maximum values respectively
SELECT SUM(Age)
FROM Employees;

-- Display rows with a specific value
SELECT * 
FROM Employees 
WHERE First_Name = 'Mahmoud';

-- Display rows with multiple specific values
-- IN checks for multiple possible values
SELECT * 
FROM Employees 
WHERE First_Name IN ('Osama', 'Maha', 'Mahmoud');

-- Search for patterns using wildcards
-- LIKE searches for patterns with % representing zero or more characters
SELECT * 
FROM Employees 
WHERE First_Name LIKE 'm%';

SELECT * 
FROM Employees 
WHERE First_Name LIKE '%a';

SELECT * 
FROM Employees 
WHERE First_Name LIKE '%a%';


-- Use comparison operators
-- > / < / <> / >= / <= compare values
SELECT *
FROM Employees
WHERE Age > 23;

-- Filter data within a range
-- BETWEEN specifies a range of values
SELECT *
FROM Employees
WHERE Age BETWEEN 23 and 29;

-- [ORDER BY] sorts rows in ascending (ASC) or descending (DESC) order
select *
from Employees
where Age between 23 and 29
ORDER BY Salary DESC;

-- Sort results by multiple columns
SELECT First_Name, Salary
FROM Employees
WHERE Age <> 23
ORDER BY Salary , First_Name; 


