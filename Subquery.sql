-- show the details of orders made by customers in germany

SELECT *
FROM Sales.Orders
WHERE CustomerID IN  
				(SELECT CustomerID
				FROM Sales.Customers
				WHERE country= 'Germany')
	
-- show the details of orders made by customers who are not  in germany

SELECT *
FROM Sales.Orders
WHERE CustomerID NOT IN  
				(SELECT CustomerID
				FROM Sales.Customers
				WHERE country= 'Germany')

-- Find female employees whose salaries are greater than the salaries 
-- of any male employees...

-- Main query
SELECT 
	EmployeeID,
	FirstName,
	Salary
From Sales.Employees
WHERE Gender='F'
AND salary > ANY
                 (SELECT 
					Salary
				  From Sales.Employees
				  WHERE Gender='M')

-- Find female employees whose salaries are greater than the salaries 
-- of all male employees...

-- Main query
SELECT 
	EmployeeID,
	FirstName,
	Salary
From Sales.Employees
WHERE Gender='F'
AND salary > ALL
                 (SELECT 
					Salary
				  From Sales.Employees
				  WHERE Gender='M')

-- correlated subquery
-- Show all customer details and find the total orders for each customers

SELECT 
*,

(SELECT COUNT(*) FROM Sales.Orders o where c.CustomerID=o.CustomerID) TotalSales
FROM Sales.Customers c


-- Exists
-- show the details of orders who made by customers in germany


SELECT *
FROM Sales.Orders O
WHERE EXISTS
				(SELECT 1   -- here use 1 which is faster from star
				FROM Sales.Customers c
				WHERE country= 'Germany'
				AND c.CustomerID=o.CustomerID)

-- REVERT UPPER LOGIC
SELECT *
FROM Sales.Orders O
WHERE  NOT EXISTS
				(SELECT 1   -- here use 1 which is faster from star
				FROM Sales.Customers c
				WHERE country= 'Germany'
				AND c.CustomerID=o.CustomerID)







