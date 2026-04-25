CREATE DATABASE retail_sales;
USE retail_sales;
CREATE TABLE sales (
    Transaction_Id INT PRIMARY KEY,
    Date DATE,
    Customer_Id VARCHAR(15),
    Gender VARCHAR(10),
    Age INT,
    Product_category VARCHAR(15),
    Quantity INT,
    Price_per_unit INT,
    Total_amount INT
);
SELECT * FROM sales;
