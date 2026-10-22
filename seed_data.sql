USE ShopAnalyticsDB;
GO

-- Insert sample customers
INSERT INTO Customers (FirstName, LastName, Email, Country) VALUES
('Marco', 'Rossi', 'marco.rossi@campus.unimib.it', 'Italy'),
('Giulia', 'Bianchi', 'giulia.bianchi@gmail.com', 'Italy'),
('John', 'Smith', 'john.smith@yahoo.com', 'USA'),
('Elena', 'Verdi', 'elena.verdi@campus.unimib.it', 'Italy');

-- Insert sample products
INSERT INTO Products (ProductName, Category, UnitPrice, StockQuantity) VALUES
('MacBook Air M3', 'Electronics', 1299.99, 15),
('Dell UltraSharp Monitor', 'Electronics', 450.00, 30),
('Ergonomic Office Chair', 'Furniture', 250.50, 10),
('Mechanical Keyboard', 'Accessories', 89.99, 50);

-- Insert sample orders
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus) VALUES
(1, '2026-10-01 10:30:00', 'Completed'),
(2, '2026-10-05 14:15:00', 'Completed'),
(1, '2026-10-15 09:00:00', 'Completed'),
(3, '2026-10-20 16:45:00', 'Pending');

-- Insert order items
INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 4, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2);
