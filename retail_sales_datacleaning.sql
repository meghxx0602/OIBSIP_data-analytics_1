-- FIND ROWS WITH NULLs
SELECT * 
FROM sales
WHERE Transaction_Id IS NULL
   OR Date IS NULL
   OR Customer_Id IS NULL
   OR Gender IS NULL
   OR Age IS NULL
   OR Product_category IS NULL
   OR Quantity IS NULL
   OR Price_per_unit IS NULL
   OR Total_amount IS NULL;

-- DEETE ROWS WITH NULLs
SET SQL_SAFE_UPDATES = 0;

DELETE FROM sales
WHERE Transaction_Id IS NULL
   OR Date IS NULL
   OR Customer_Id IS NULL
   OR Gender IS NULL
   OR Age IS NULL
   OR Product_category IS NULL
   OR Quantity IS NULL
   OR Price_per_unit IS NULL
   OR Total_amount IS NULL;

SET SQL_SAFE_UPDATES = 1;