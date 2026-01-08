/* =========================================================
   Retail Business Data Analysis
   Database: RetailDB
   Author: Mayank Khandelwal
   Purpose: Data validation, cleaning & business insights
   ========================================================= */

USE RetailDB;

/* 1. Total number of orders */
SELECT COUNT(*) FROM df_orders;

/* 2. check missing ship mode values */
SELECT COUNT(*) AS Null_ShipMode
FROM df_orders
WHERE [Ship Mode] IS NULL;

/* 3. view complete dataset */
SELECT * FROM df_orders;

/* 4. data cleaning: fill missing ship mode */
UPDATE df_orders
SET [Ship Mode] = 'Standard Class'
WHERE [Ship Mode] IS NULL;

/* 5. Total revenue */
SELECT SUM([Sale Price] * Quantity) AS Total_Revenue
FROM df_orders;

/* 6. Total Profit */
SELECT SUM(Profit) AS Total_Profit
FROM df_orders;

/* 7. Profit margin percentage */
SELECT 
    (SUM(Profit) / SUM([Sale Price] * Quantity)) * 100 AS Profit_Margin_Percent
FROM df_orders;

/* 8. top 5 categories by sales */
SELECT TOP 5 Category,
       SUM([Sale Price] * Quantity) AS Sales
FROM df_orders
GROUP BY Category
ORDER BY Sales DESC;

/* 9. profit by region */
SELECT Region,
       SUM(Profit) AS Profit
FROM df_orders
GROUP BY Region
ORDER BY Profit DESC;

/* 10. top 10 products by profit */
SELECT TOP 10 [Product Id],
       SUM(Profit) AS Profit
FROM df_orders
GROUP BY [Product Id]
ORDER BY Profit DESC;

/* 11. year-wise sales trend */
SELECT 
    YEAR([Order Date]) AS Year,
    SUM([Sale Price] * Quantity) AS Sales
FROM df_orders
GROUP BY YEAR([Order Date])
ORDER BY Year;

/* 12. month-wise sales trend */
SELECT 
    FORMAT([Order Date], 'yyyy-MM') AS Month,
    SUM([Sale Price] * Quantity) AS Sales
FROM df_orders
GROUP BY FORMAT([Order Date], 'yyyy-MM')
ORDER BY Month;





