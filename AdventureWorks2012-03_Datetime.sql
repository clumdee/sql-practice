USE AdventureWorks2012

-- get current date and time
SELECT GETDATE()

-- subtract date
SELECT GETDATE() - 2

-- get some part of the date e.g. get Year/Month/Date separately
-- note that more parameter are available e.g. day-of-week, weekday, week, minute, etc.
SELECT DATEPART(yyyy, GETDATE()) as Y, 
		DATEPART(mm, GETDATE()) as M, 
		DATEPART(dd, GETDATE()) as D,
		DATEPART(dw, GETDATE()) as DaysFromSunday,
		DATENAME(dw, GETDATE()) as whichIS

-- add date/month/year
SELECT DATEADD(DAY, 7, GETDATE()) as SevenDaysForward, 
		DATEADD(MONTH, 7, GETDATE()) as SevenMonthsForward, 
		DATEADD(YEAR, 7, GETDATE()) as SevenYearsForward
		
-- let's try with sample data
-- just check the data
SELECT TOP 10 * FROM Production.WorkOrder

-- now try some manipulation
SELECT WorkOrderID, ProductID, StartDate, EndDate, DATEDIFF(DAY, StartDate, EndDate) as ProcessDays
FROM Production.WorkOrder
