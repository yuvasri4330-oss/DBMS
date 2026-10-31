-- DATABASE CREATION
CREATE DATABASE SalesDB;
USE SalesDB;

-- 1. CUSTOMER TABLE
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- 2. PRODUCT TABLE
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- 3. ORDER TABLE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- 4. PAYMENT TABLE
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- INSERT CUSTOMER DATA
INSERT INTO Customer VALUES
(1, 'Arun', 'Chennai'),
(2, 'Ravi', 'Coimbatore'),
(3, 'Priya', 'Madurai'),
(4, 'Kumar', 'Salem');

-- INSERT PRODUCT DATA
INSERT INTO Product VALUES
(101, 'Laptop', 50000),
(102, 'Mobile', 20000),
(103, 'Headphones', 2000),
(104, 'Keyboard', 1500);

-- INSERT ORDER DATA
INSERT INTO Orders VALUES
(1001, 1, 101, 1, '2026-09-20'),
(1002, 2, 102, 2, '2026-09-21'),
(1003, 1, 103, 1, '2026-09-22'),
(1004, 3, 104, 2, '2026-09-23');

-- INSERT PAYMENT DATA
INSERT INTO Payment VALUES
(501, 1001, 50000, 'Paid'),
(502, 1002, 40000, 'Paid'),
(503, 1003, 2000, 'Pending');

-- 5. INNER JOIN
SELECT
    Customer.CustomerName,
    Orders.OrderID,
    Product.ProductName,
    Orders.Quantity,
    Product.Price
FROM Customer
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
INNER JOIN Product
ON Orders.ProductID = Product.ProductID;

-- 6. LEFT JOIN
SELECT
    Customer.CustomerName,
    Orders.OrderID,
    Orders.OrderDate
FROM Customer
LEFT JOIN Orders
ON Customer.CustomerID = Orders.CustomerID;

-- 7. RIGHT JOIN
SELECT
    Customer.CustomerName,
    Orders.OrderID,
    Orders.OrderDate
FROM Orders
RIGHT JOIN Customer
ON Orders.CustomerID = Customer.CustomerID;

-- 8. COMPLETE ORDER DETAILS
SELECT
    Customer.CustomerName,
    Product.ProductName,
    Orders.OrderID,
    Orders.Quantity,
    Product.Price,
    Payment.Amount,
    Payment.PaymentStatus
FROM Orders
INNER JOIN Customer
ON Orders.CustomerID = Customer.CustomerID
INNER JOIN Product
ON Orders.ProductID = Product.ProductID
LEFT JOIN Payment
ON Orders.OrderID = Payment.OrderID;

-- 9. CUSTOMER PURCHASE HISTORY
SELECT
    Customer.CustomerName,
    Orders.OrderID,
    Product.ProductName,
    Orders.Quantity,
    Orders.OrderDate
FROM Customer
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
INNER JOIN Product
ON Orders.ProductID = Product.ProductID
ORDER BY Customer.CustomerName;

-- 10. MULTI-TABLE REPORT
SELECT
    Customer.CustomerName,
    COUNT(DISTINCT Orders.OrderID) AS TotalOrders,
    SUM(Orders.Quantity) AS TotalQuantity,
    SUM(Product.Price * Orders.Quantity) AS TotalPurchase
FROM Customer
LEFT JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
LEFT JOIN Product
ON Orders.ProductID = Product.ProductID
GROUP BY Customer.CustomerID, Customer.CustomerName;

-- 11. PAYMENT REPORT
SELECT
    Customer.CustomerName,
    Orders.OrderID,
    Payment.Amount,
    Payment.PaymentStatus
FROM Customer
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
LEFT JOIN Payment
ON Orders.OrderID = Payment.OrderID;
