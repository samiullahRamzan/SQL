-- display the full name of customer in a single field
-- and add 10 bonus point to each customer score

SELECT
	FirstName,
	LastName,
	FirstName + ' ' + COALESCE(LastName,'N/A') as FullName,
	score,
	COALESCE(score,0) as score
FROM Sales.Customers

-- sort the customer from lowest to highest scores with null apearing last

SELECT
	FirstName + ' ' + COALESCE(LastName,'N/A') as FullName,
	score
FROM Sales.Customers
Order By score desc

-- ]\