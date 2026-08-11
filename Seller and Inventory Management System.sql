CREATE DATABASE SellerInventoryDB;

USE SellerInventoryDB;

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT,
    product_id INT,
    stock_quantity INT NOT NULL,
    
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);