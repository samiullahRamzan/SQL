-- Find the total sales for each product

SELECT 
    ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID

/* Find the total sales for each product (wrong aggregation will not applied, use window)
  Additionally provide details such orderId , orderDate */

SELECT 
    OrderId,
    OrderDate,
    ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID,OrderId,
    OrderDate

/* Find the total sales for each product 
  Additionally provide details such orderId , orderDate */

SELECT 
    OrderId,
    OrderDate,
    ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSales
FROM Sales.Orders

/* Find the total sales for each product 
  Additionally provide details such orderId , orderDate */
   
SELECT 
    OrderId,
    OrderDate,
    ProductID, 
	SUM(Sales) OVER() TotalSales -- one window
FROM Sales.Orders


/*Find the total sales across all orders 
  Find the total sales for each product 
  Additionally provide details such orderId , orderDate */
   
SELECT 
    OrderId,
    OrderDate,
    ProductID, 
    Sales,
    SUM(Sales) OVER() TotalSales ,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSales 
FROM Sales.Orders
