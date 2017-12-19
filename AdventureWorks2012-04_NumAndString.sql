USE AdventureWorks2012

-- first try number manipulation
-- create a table to play with
CREATE TABLE MySalary (EmployeeID INT, Salary Float)

INSERT INTO MySalary VALUES (1, 10000)
INSERT INTO MySalary VALUES (2, 8000)
INSERT INTO MySalary VALUES (3, 6000)

SELECT * FROM MySalary

-- aggregate functions
SELECT AVG(Salary) as avgSal, COUNT(Salary) as countSal FROM MySalary

-- Count(*) would count rows
SELECT COUNT(*) FROM MySalary

-- find summation, min, ...
SELECT SUM(Salary) as sumSal, MIN(Salary) as minSal FROM MySalary

-- let's add GROUP BY 
-- >>> do sum/min/... separately by group i.e. in this case only one row/group
SELECT EmployeeID, SUM(Salary) as sumSal, MIN(Salary) as minSal 
FROM MySalary GROUP BY EmployeeID

-- now string manipulation
-- create a table to play with
CREATE TABLE MyOrder (OrderNumber INT, OrderName VARCHAR(10), CustomerID INT)

INSERT INTO MyOrder VALUES (1, 'SomeOrder1', 1)
INSERT INTO MyOrder VALUES (2, 'SomeOrder2', 2)
INSERT INTO MyOrder VALUES (3, 'SomeOrder3', 3)
INSERT INTO MyOrder VALUES (4, 'SomeOrder4', 4)

SELECT * FROM MyOrder

-- try CONCAT
SELECT OrderNumber, OrderName, CONCAT(OrderNumber,', ',OrderName) AS OrderConcat FROM MyOrder

-- btw, SQL can also PRINT
PRINT(CONCAT('Hello, ', 'this works!'))

-- also a random number function
SELECT OrderNumber, RAND() AS RandomNumber FROM MyOrder

-- get only the few first characters from the left/right sides
SELECT OrderName, LEFT(OrderName, 5) as LeftSet, RIGHT(OrderName, 5) as RightSet FROM MyOrder

-- what about getting something in between (index starts from 1)
-- note that the defined substring length can exceed the length of the string
SELECT OrderName, SUBSTRING(OrderName, 3, 5) AS SubOrderName FROM MyOrder

-- make every lowercase/uppercase
SELECT OrderName, LOWER(OrderName) as LowerCase, UPPER(OrderName) as UpperCase From MyOrder

-- get LENGTH
SELECT OrderName, LEN(OrderName) as Length_OrderName FROM MyOrder

-- reformat OrderName to a capitalized format
SELECT OrderName, 
		CONCAT(UPPER(LEFT(OrderName, 1)), LOWER(RIGHT(OrderName, LEN(OrderName)-1))) as Capitalized
FROM MyOrder

-- TRIM FUNCTION (seems like whitespaces on the right do not get included)
SELECT '   text   ' as raw, LEN('   text   '),
		TRIM('   text   ') as trimmed, LEN(TRIM('   text   ')),
		LTRIM('   text   ') as L_trimmed, LEN(LTRIM('   text   ')),
		RTRIM('   text   ') as R_rimmed, LEN(RTRIM('   text   '))
		