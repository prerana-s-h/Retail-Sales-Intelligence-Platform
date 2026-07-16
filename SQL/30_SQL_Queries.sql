-- ==========================================
-- Retail Sales Intelligence Platform
-- SQL Analysis Queries
-- ==========================================

-- 1. View all records
SELECT * FROM SUPERSTORE;

-- 2. Total number of orders
SELECT COUNT(*) AS Total_Orders
FROM SUPERSTORE;

-- 3. Total Sales
SELECT SUM(SALES) AS Total_Sales
FROM SUPERSTORE;

-- 4. Total Profit
SELECT SUM(PROFIT) AS Total_Profit
FROM SUPERSTORE;

-- 5. Average Sales
SELECT ROUND(AVG(SALES),2) AS Average_Sales
FROM SUPERSTORE;

-- 6. Average Profit
SELECT ROUND(AVG(PROFIT),2) AS Average_Profit
FROM SUPERSTORE;

-- 7. Total Customers
SELECT COUNT(DISTINCT CUSTOMER_ID) AS Customers
FROM SUPERSTORE;

-- 8. Sales by Region
SELECT REGION,
SUM(SALES) Total_Sales
FROM SUPERSTORE
GROUP BY REGION;

-- 9. Profit by Region
SELECT REGION,
SUM(PROFIT) Total_Profit
FROM SUPERSTORE
GROUP BY REGION;

-- 10. Sales by Category
SELECT CATEGORY,
SUM(SALES)
FROM SUPERSTORE
GROUP BY CATEGORY;

-- 11. Profit by Category
SELECT CATEGORY,
       SUM(PROFIT) AS Total_Profit
FROM SUPERSTORE
GROUP BY CATEGORY;

-- 12. Sales by Segment
SELECT SEGMENT,
       SUM(SALES) AS Total_Sales
FROM SUPERSTORE
GROUP BY SEGMENT;

-- 13. Profit by Segment
SELECT SEGMENT,
       SUM(PROFIT) AS Total_Profit
FROM SUPERSTORE
GROUP BY SEGMENT;

-- 14. Top 10 Products by Sales
SELECT *
FROM (
    SELECT PRODUCT_NAME,
           SUM(SALES) AS Total_Sales
    FROM SUPERSTORE
    GROUP BY PRODUCT_NAME
    ORDER BY Total_Sales DESC
)
WHERE ROWNUM <= 10;

-- 15. Top 10 Products by Profit
SELECT *
FROM (
    SELECT PRODUCT_NAME,
           SUM(PROFIT) AS Total_Profit
    FROM SUPERSTORE
    GROUP BY PRODUCT_NAME
    ORDER BY Total_Profit DESC
)
WHERE ROWNUM <= 10;

-- 16. Average Sales by Region
SELECT REGION,
       ROUND(AVG(SALES),2) AS Avg_Sales
FROM SUPERSTORE
GROUP BY REGION;

-- 17. Average Profit by Region
SELECT REGION,
       ROUND(AVG(PROFIT),2) AS Avg_Profit
FROM SUPERSTORE
GROUP BY REGION;

-- 18. Total Orders by Ship Mode
SELECT SHIP_MODE,
       COUNT(*) AS Orders
FROM SUPERSTORE
GROUP BY SHIP_MODE;

-- 19. Total Sales by Year
SELECT ORDER_YEAR,
       SUM(SALES) AS Total_Sales
FROM SUPERSTORE
GROUP BY ORDER_YEAR
ORDER BY ORDER_YEAR;

-- 20. Total Profit by Year
SELECT ORDER_YEAR,
       SUM(PROFIT) AS Total_Profit
FROM SUPERSTORE
GROUP BY ORDER_YEAR
ORDER BY ORDER_YEAR;

-- 21. Sales by Month
SELECT MONTH_NAME,
       SUM(SALES) AS Total_Sales
FROM SUPERSTORE
GROUP BY MONTH_NAME;

-- 22. Products with Loss
SELECT PRODUCT_NAME,
       PROFIT
FROM SUPERSTORE
WHERE PROFIT < 0;

-- 23. Orders with High Discount
SELECT ORDER_ID,
       DISCOUNT
FROM SUPERSTORE
WHERE DISCOUNT >= 0.50;

-- 24. Total Quantity Sold
SELECT SUM(QUANTITY) AS Total_Quantity
FROM SUPERSTORE;

-- 25. Average Discount
SELECT ROUND(AVG(DISCOUNT),2) AS Avg_Discount
FROM SUPERSTORE;

-- 26. Highest Sale
SELECT MAX(SALES) AS Highest_Sale
FROM SUPERSTORE;

-- 27. Highest Profit
SELECT MAX(PROFIT) AS Highest_Profit
FROM SUPERSTORE;

-- 28. Lowest Profit
SELECT MIN(PROFIT) AS Lowest_Profit
FROM SUPERSTORE;

-- 29. Sales Greater than Average
SELECT *
FROM SUPERSTORE
WHERE SALES > (SELECT AVG(SALES) FROM SUPERSTORE);

-- 30. Profit Margin
SELECT ROUND((SUM(PROFIT)/SUM(SALES))*100,2) AS Profit_Margin
FROM SUPERSTORE;