CREATE DATABASE EcommerceDB;
USE EcommerceDB;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    availability VARCHAR(20)
);
INSERT INTO Customer VALUES
(1, 'Yuvasri', 'yuvasri@gmail.com', 'Chennai'),
(2, 'Priya', 'priya@gmail.com', 'Salem'),
(3, 'Kaviya', 'kaviya@gmail.com', 'Tindivanam'),
(4, 'Divya', 'divya@gmail.com', 'Chennai');
INSERT INTO Product VALUES
(101, 'Laptop', 'Electronics', 55000, 'Available'),
(102, 'Mobile Phone', 'Electronics', 25000, 'Available'),
(103, 'Headphones', 'Accessories', 2000, 'Available'),
(104, 'Keyboard', 'Accessories', 1500, 'Out of Stock'),
(105, 'Smart Watch', 'Wearables', 5000, 'Available');
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Product
WHERE price > 5000;
SELECT * FROM Product
ORDER BY price DESC;
SELECT DISTINCT category
FROM Product;
SELECT * FROM Product
WHERE category = 'Electronics';
SELECT * FROM Product
WHERE availability = 'Available';
SELECT * FROM Product
WHERE price BETWEEN 2000 AND 30000;