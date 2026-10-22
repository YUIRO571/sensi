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

-- Rank customers by their total spending using a Window Function
WITH CustomerSpending AS (
    SELECT 
        c.CustomerID,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        SUM(oi.Quantity * p.UnitPrice) AS TotalSpent
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
    GROUP BY c.CustomerID, c.FirstName, c.LastName
)
SELECT 
    CustomerName,
    TotalSpent,
    RANK() OVER (ORDER BY TotalSpent DESC) AS SpendingRank
FROM CustomerSpending;
