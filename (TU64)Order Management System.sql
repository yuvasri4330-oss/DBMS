CREATE DATABASE OrderManagement;
USE OrderManagement;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers (customer_name, email)
VALUES
('Ravi', 'ravi@gmail.com'),
('Priya', 'priya@gmail.com');
INSERT INTO Products (product_name, price, stock)
VALUES
('Laptop', 50000, 10),
('Mouse', 500, 20),
('Keyboard', 1000, 15);
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2026-08-17', 50500);
INSERT INTO Order_Details
(order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 50000),
(1, 2, 1, 500);
SELECT * FROM Orders;
UPDATE Orders
SET total_amount = 51000
WHERE order_id = 1;
SELECT
    c.customer_name,
    p.product_name,
    od.quantity,
    o.order_date,
    od.price,
    (od.quantity * od.price) AS total
FROM Customers c
JOIN Orders o
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Products p
    ON od.product_id = p.product_id;
    