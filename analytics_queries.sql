USE ShopAnalyticsDB;
GO

-- Summary of all orders with customer details and total spending
SELECT 
    o.OrderID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    p.ProductName,
    oi.Quantity,
    p.UnitPrice,
    (oi.Quantity * p.UnitPrice) AS LineTotal,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;
