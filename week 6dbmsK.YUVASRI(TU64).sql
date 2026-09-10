CREATE DATABASE ReviewDB;
USE ReviewDB;

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_name VARCHAR(50),
    feedback VARCHAR(100)
);

CREATE TABLE Rating (
    rating_id INT PRIMARY KEY,
    product_id INT,
    rating INT
);

-- Insert Product
INSERT INTO Product VALUES (1, 'Laptop');
INSERT INTO Product VALUES (2, 'Mobile');

-- Insert Reviews
INSERT INTO Review VALUES (1, 1, 'Arun', 'Very Good');
INSERT INTO Review VALUES (2, 2, 'Bala', 'Good Product');

-- Insert Ratings
INSERT INTO Rating VALUES (1, 1, 5);
INSERT INTO Rating VALUES (2, 1, 4);
INSERT INTO Rating VALUES (3, 2, 5);

-- Display Reviews
SELECT * FROM Review;

-- Calculate Average Rating
SELECT product_id, AVG(rating) AS average_rating
FROM Rating
GROUP BY product_id;

-- Highly Rated Products
SELECT product_id, AVG(rating) AS average_rating
FROM Rating
GROUP BY product_id
HAVING AVG(rating) >= 4.5;