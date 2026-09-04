CREATE DATABASE SellerInventoryDB;

USE SellerInventoryDB;
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Customer_ID INT,
    Payment_Mode VARCHAR(20),
    Payment_Date DATE,
    Payment_Status VARCHAR(20),
    Amount DECIMAL(10,2)
);

INSERT INTO Payment VALUES
(101, 1, 'UPI', '2026-09-01', 'Successful', 500.00),
(102, 2, 'Card', '2026-09-01', 'Failed', 750.00),
(103, 3, 'Cash', '2026-09-02', 'Successful', 300.00),
(104, 4, 'UPI', '2026-09-02', 'Successful', 1000.00),
(105, 5, 'Card', '2026-09-03', 'Failed', 450.00);

SELECT * FROM Payment;

SELECT * FROM Payment
WHERE Payment_Status = 'Successful';

SELECT * FROM Payment
WHERE Payment_Status = 'Failed';

SELECT Payment_Mode, COUNT(*) AS Total_Transactions
FROM Payment
GROUP BY Payment_Mode;

SELECT Payment_Mode, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Mode;

SELECT Payment_ID, Customer_ID, Payment_Mode,
       Payment_Date, Payment_Status, Amount
FROM Payment
ORDER BY Payment_Date;

SELECT SUM(Amount) AS Successful_Amount
FROM Payment
WHERE Payment_Status = 'Successful';

SELECT SUM(Amount) AS Failed_Amount
FROM Payment
WHERE Payment_Status = 'Failed';