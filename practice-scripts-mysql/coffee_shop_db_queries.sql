-- 1. SELECT statement: Get all customers
SELECT * FROM Customers;

-- 2. WHERE clause: Get a specific customer
SELECT * FROM Customers 
WHERE CustomerID = 1;

-- 3. JOIN statement: Get all orders with customer
SELECT Orders.OrderID, Customers.FirstName, Customers.LastName, Orders.Quantity, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 4. GROUP BY clause: Get number of customers for a product ordered
SELECT COUNT(CustomerID)
FROM Orders
GROUP BY ProductID;

-- 5. HAVING clause: Get products that have been ordered more than once
SELECT Products.ProductName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
JOIN Products ON Orders.ProductID = Products.ProductID
GROUP BY Products.ProductName
HAVING COUNT(Orders.OrderID) > 1;

-- 6. ORDER BY statement: Get all orders sorted by OrderDate
SELECT * FROM Orders 
ORDER BY OrderDate DESC;

-- 7. CASE statement: Categorize order sizes based on quantity
SELECT OrderID, CustomerID, ProductID, Quantity, OrderDate,
	CASE 
		WHEN Quantity <= 1 THEN 'Small'
		WHEN Quantity <= 3 THEN 'Medium'
		ELSE 'Large'
	END as OrderSize
FROM Orders;

-- 8. Subquery clause: Get all orders with quantity greater than the average quantity of all orders
SELECT * FROM Orders
WHERE Quantity > 
	(SELECT AVG(Quantity) 
	FROM Orders);

-- 9. UPDATE statement: Update a customer email
UPDATE Customers SET Email = 'newemail@example.com' 
WHERE CustomerID = 1;

-- 10. DELETE statement: Delete an order
DELETE FROM Orders 
WHERE OrderID = 1;