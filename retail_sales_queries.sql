USE retail_sales;
SELECT * FROM sales;
/*EXPLORATORTY DATA ANALYSIS -
Running queries and exploring the dataset*/

-- 1. TOTAL RECORDS
SELECT COUNT(*) FROM sales;

-- 2. UNIQUE PRODUCT CATEGORIES
SELECT DISTINCT Product_category FROM sales;

-- 3. TRANSACTION DATES MIN & MAX
SELECT 
MIN(DATE) AS EARLIEST_TRANSACTION,
MAX(DATE) AS LATEST_TRANSACTION FROM sales;

-- 4. AVG, MIN, MAX, STANDARD DEVIATION OF TOTAL AMOUNT SPENT
SELECT 
AVG(Total_amount) AS Avg_amount_spent, 
MIN(Total_amount) AS Min_amount_spent, 
MAX(Total_amount) AS Max_amount_spent,
STDDEV(Total_amount) AS Standarddev_amount_spent FROM sales;

-- 5. MEAN AMOUNT 
SELECT AVG(Total_amount) AS Mean_amount
FROM sales;

-- 6. MEDIAN TRANSACTION AMOUNT 
SELECT
(SELECT COUNT(*) FROM sales) AS TotalRows,
(SELECT AVG(middle_values)
FROM(
SELECT Total_amount AS middle_values
FROM sales
ORDER BY Total_amount
LIMIT 2 OFFSET 499
) AS median_calc
) AS medianAmount;

-- 7. MODE
SELECT Total_amount, COUNT(*) AS Frequency
FROM sales
GROUP BY Total_amount
ORDER BY Frequency DESC
LIMIT 1;

-- 8. MAX AND MIN TRANSACTION AMOUNT 
SELECT 
    MAX(Total_amount) AS MaxAmount,
    MIN(Total_amount) AS MinAmount,
    (MAX(Total_amount) - MIN(Total_amount)) AS RangeAmount
FROM sales;

-- 9. QUATERLY SALES TOTAL
SELECT
YEAR(Date) AS Year,
QUARTER(Date) AS Quarter,
SUM(Total_amount) AS Quarterly_Sales
FROM sales
GROUP BY YEAR(Date), QUARTER(Date)
ORDER BY Year, Quarter;

-- 10.  MALE vs FEMALE SPENDING TOTALS AND AVG
SELECT
Gender,
SUM(Total_amount) AS TotalSpend,
AVG(Total_amount) AS AvgSpend
FROM sales
GROUP BY Gender;

/* 11. CUSTOMER SPENDING BY AGE GROUP: TOTAL AND AVERAGE
STEP 1: */
SELECT
MIN(Age) AS MinAge,
MAX(Age) AS MaxAge
FROM Sales;

-- STEP 2:
SELECT 
CASE 
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
WHEN Age BETWEEN 46 AND 55 THEN '46-55'
ELSE '56+'
END AS AgeGroup,
SUM(Total_Amount) AS TotalSpend,
AVG(Total_Amount) AS AvgSpend
FROM Sales
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- 12. PRODUCT CATEGORY ANALYSIS
SELECT 
Product_category,
SUM(Total_amount) AS TotalRevenue
FROM Sales
GROUP BY Product_category
ORDER BY TotalRevenue DESC;

-- 13. PRODUCT CATEGORY PRICE ANALYSIS
SELECT 
Product_category,
AVG(Price_per_unit) AS AvgPrice,
MIN(Price_per_unit) AS MinPrice,
MAX(Price_per_unit) AS MaxPrice
FROM Sales
GROUP BY Product_category
ORDER BY Product_category;

-- 14. TRANSACTION BEHAVIOR ANALYSIS
SELECT 
    Transaction_Id,
    SUM(Quantity) AS ItemsBought,
    SUM(Total_amount) AS TransactionValue
FROM sales
GROUP BY Transaction_Id
ORDER BY TransactionValue DESC;

-- 15. SEASONAL TREND ANALYSIS
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS MonthNumber,
    MONTHNAME(Date) AS MonthName,
    SUM(Total_amount) AS MonthlySales
FROM sales
GROUP BY YEAR(Date), MONTH(Date), MONTHNAME(Date)
ORDER BY Year, MonthNumber;

-- TOP SPENDING CUSTOMERS
SELECT 
    Customer_Id,
    SUM(Total_amount) AS TotalSpend
FROM sales
GROUP BY Customer_Id
ORDER BY TotalSpend DESC;



