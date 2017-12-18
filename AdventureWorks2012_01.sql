USE AdventureWorks2012

-- show all
SELECT * FROM HumanResources.Department

-- show the department names
SELECT Name FROM HumanResources.Department

-- show all groups
SELECT GroupName FROM HumanResources.Department

-- show DISTINCT GroupName
SELECT DISTINCT GroupName FROM HumanResources.Department

-- show department names who are a part of Manufacturing
SELECT Name, GroupName FROM HumanResources.Department
WHERE GroupName LIKE 'manufacturing'

-- show department names who are a part of Manufacturing or Sales and Marketing
SELECT Name, GroupName FROM HumanResources.Department
WHERE GroupName in ('manufacturing','Sales and Marketing')

-- give all the employees from the employee TABLE
SELECT * FROM HumanResources.Employee

-- give a list of all employees who have OrganizationLevel=2
SELECT * FROM HumanResources.Employee
WHERE OrganizationLevel = 2

-- give a list of all empoyees who have OrganizaionLevel = 2 or 3
SELECT * FROM HumanResources.Employee
WHERE OrganizationLevel IN (2,3)

-- give a list of employees with a title as Facilities Manager
-- note that the command is not case-sensitive
SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE 'facilities manager'

-- give all employees with the word 'manager' in their title
SELECT * FROM HumanResources.Employee 
WHERE JobTitle LIKE '%control%'

-- give employess who are born after Jan 1, 1980
SELECT * FROM HumanResources.Employee
WHERE BirthDate > '1/1/1980'

-- give employees who are born between Jan 1, 1970 and Jan 1, 1980
SELECT * FROM HumanResources.Employee
WHERE BirthDate > '1/1/1970' AND BirthDate < '1/1/1980'

-- this does the same thing
SELECT * FROM HumanResources.Employee
WHERE BirthDate BETWEEN '1/1/1970' AND '1/1/1980'

-- calculate columns
SELECT Name, ListPrice FROM Production.Product

SELECT Name, ListPrice, ListPrice + 10 AS Adjusted_ListPrice FROM Production.Product

-- INTO
SELECT Name, ListPrice, ListPrice + 10 AS Adjusted_ListPrice INTO Production.Product_2
FROM Production.Product

-- call the new table Product_2 --- the table created this way is a 'permanent' table
SELECT * FROM Production.Product_2

-- create a temporary table (notice the '#' sign)
SELECT Name, ListPrice, ListPrice + 10 AS Adjusted_ListPrice INTO #tempProduct
FROM Production.Product

-- the table last only within this session and do not get saved into the database
SELECT * FROM #tempProduct

-- Another way to create a temporary table
WITH tempProduct AS (SELECT Name, ListPrice, ListPrice + 10 AS Adjusted_ListPrice FROM Production.Product) 
SELECT * FROM tempProduct

-- DELETE
-- delete data from a TABLE
DELETE FROM Production.Product_2
WHERE Name LIKE 'Bearing Ball'
-- check
SELECT * FROM Production.Product_2

-- UPDATE
-- update the Name from 'Blade' to 'Blade_new'
UPDATE Production.Product_2
SET Name = 'Blade_new'
WHERE Name LIKE 'Blade'
-- check
SELECT * FROM Production.Product_2

-- select only the top 5 rows
SELECT TOP 5 * FROM Production.Product_2