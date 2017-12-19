-- create tables to play with
-- create the 1st table
CREATE TABLE MyEmployee (EmployeeID INT, Firstname VARCHAR(20), Lastname VARCHAR(20))

INSERT INTO MyEmployee VALUES (1, 'Michael', 'Scitt')
INSERT INTO MyEmployee VALUES (2, 'Pam', 'Beesly')
INSERT INTO MyEmployee VALUES (3, 'Dwight', 'Schrute')

SELECT * FROM MyEmployee

-- create the 2nd table
CREATE TABLE MySalary (EmployeeID INT, Salary Float)

INSERT INTO MySalary VALUES (1, 10000)
INSERT INTO MySalary VALUES (2, 8000)
INSERT INTO MySalary VALUES (3, 6000)
--DELETE FROM MySalary WHERE EmployeeID in (1,2,3)
--TRUNCATE TABLE MySalary -- similar to the DELETE statement with no WHERE clause but faster and uses fewer resources
--DROP TABLE MySalary

SELECT * FROM MySalary

-- let's check both tables together
SELECT * FROM MyEmployee
SELECT * FROM MySalary

-- start playing with INNER JOIN
SELECT * FROM MyEmployee A INNER JOIN MySalary B ON A.EmployeeID = B.EmployeeID

-- let's select only the columns we want
SELECT A.Firstname, A.Lastname, B.Salary FROM MyEmployee A INNER JOIN MySalary B ON A.EmployeeID = B.EmployeeID

-- Now LEFT (OUTER) JOIN
-- create another table
CREATE TABLE MyPhone (EmployeeID INT, PhoneNumber VARCHAR(12))

INSERT INTO MyPhone VALUES (1, '111-111-1111')
INSERT INTO MyPhone VALUES (2, '222-222-2222')

-- let's check the tables we are going to use
SELECT * FROM MyEmployee
SELECT * FROM MyPhone

-- LEFT JOIN
SELECT A.Firstname, A.Lastname, B.PhoneNumber FROM MyEmployee A LEFT JOIN MyPhone B on A.EmployeeID = B.EmployeeID

-- Modify table for RIGHT JOIN
INSERT INTO MyPhone VALUES (3, '333-333-3333')
INSERT INTO MyPhone VALUES (4, '444-444-4444')

-- RIGHT JOIN
SELECT A.Firstname, A.Lastname, B.PhoneNumber FROM MyEmployee A RIGHT JOIN MyPhone B on A.EmployeeID = B.EmployeeID

-- Modify table for OUTER JOIN
INSERT INTO MyEmployee VALUES (5, 'David', 'White')

-- FULL (OUTER) JOIN
SELECT * FROM MyEmployee A FULL JOIN MyPhone B on A.EmployeeID = B.EmployeeID

-- CROSS JOIN
SELECT * FROM MyEmployee CROSS JOIN MyPhone

-- same result as CROSS JOIN
SELECT * FROM MyEmployee, MyPhone