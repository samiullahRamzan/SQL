-- Find the total sales for each product

SELECT 
    ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID

/* Find the total sales for each product (wrong aggregation will not applied, use window)
  Additionally provide details such orderId , orderDate */

SELECT 
   
	SUM(Sales) TotalSales
FROM Sales.Orders

/* Find the total sales for each product 
  Additionally provide details such orderId , orderDate */

SELECT 
    OrderId,
    OrderDate,
    ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID,OrderId,
    OrderDate
