***************************************
---Join both datasets on Order ID--
***************************************
SELECT *
FROM Orderstask6 o
JOIN Detailstask6 d
ON o.order_id = d.order_id;

**************************************************
--********************handle NULLs in aggregates****************
--********************Treat NULLs in Amount as 0****************
SELECT 
  SUM(COALESCE(Amount, 0)) AS total_revenue_safe
FROM Detailstask6;
****************************************************
--*******************Aggregate functions***********************
SELECT 
  SUM(Amount) AS total_revenue,
  COUNT(*) AS total_rows,
  COUNT(DISTINCT order_id) AS unique_products,
  AVG(Amount) AS average_amount,
  MAX(Amount) AS max_amount,
  MIN(Amount) AS min_amount
FROM Detailstask6;
**********************************************************
--*******************Group data by month and year*****************
SELECT 
  strftime('%Y', SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 4, 2) || '-' || SUBSTR(Order_Date, 1, 2)) AS year,
  strftime('%m', SUBSTR(Order_Date, 7, 4) || '-' || SUBSTR(Order_Date, 4, 2) || '-' || SUBSTR(Order_Date, 1, 2)) AS month,
  COUNT(*) AS total_orders
FROM Orderstask6
GROUP BY year, month
ORDER BY year, month;



**************************************************************
--*******************COUNT(*) vs COUNT(DISTINCT col)*******************
-- ******************COUNT(*) example: total rows in details******************
SELECT COUNT(*) AS total_rows FROM Detailstask6;

--******************COUNT(DISTINCT Order_ID): how many unique orders******************
SELECT COUNT(DISTINCT Order_ID) AS unique_orders FROM Detailstask6;
*****************************************************************************


--******************ORDER BY vs GROUP BY******************
--******************GROUP BY: To get revenue by product******************
SELECT 
  order_id, 
  SUM(Amount) AS total_revenue
FROM Detailstask6
GROUP BY order_id;
-- ******************ORDER BY: To sort by highest revenue******************
SELECT 
  order_id, 
  SUM(Amount) AS total_revenue
FROM Detailstask6
GROUP BY order_id
ORDER BY total_revenue DESC;
*****************************************************************
--******************Months by Sales*******************************
SELECT 
  strftime('%Y', SUBSTR(o.Order_Date, 7, 4) || '-' || SUBSTR(o.Order_Date, 4, 2) || '-' || SUBSTR(o.Order_Date, 1, 2)) AS year,
  strftime('%m', SUBSTR(o.Order_Date, 7, 4) || '-' || SUBSTR(o.Order_Date, 4, 2) || '-' || SUBSTR(o.Order_Date, 1, 2)) AS month,
  SUM(d.Amount) AS total_revenue
FROM Orderstask6 o
JOIN Detailstask6 d ON o.Order_ID = d.Order_ID
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;
--******************Extract YEAR and MONTH from Order Date--******************
SELECT 
  strftime('%Y', SUBSTR(o.order_date, 7, 4) || '-' || SUBSTR(o.order_date, 4, 2) || '-' || SUBSTR(o.order_date, 1, 2)) AS year,
  strftime('%m', SUBSTR(o.order_date, 7, 4) || '-' || SUBSTR(o.order_date, 4, 2) || '-' || SUBSTR(o.order_date, 1, 2)) AS month,
  SUM(d.amount) AS total_revenue,
  COUNT(DISTINCT o.order_id) AS order_volume
FROM Orderstask6 o
JOIN Detailstask6 d ON o.order_id = d.order_id
GROUP BY year, month
ORDER BY year, month;

***************************************************************************
SELECT
    strftime('%Y', substr(Order_Date, 7, 4) || '-' || substr(Order_Date, 4, 2) || '-' || substr(Order_Date, 1, 2)) AS Year,
    strftime('%m', substr(Order_Date, 7, 4) || '-' || substr(Order_Date, 4, 2) || '-' || substr(Order_Date, 1, 2)) AS Month
FROM Orderstask6;
---******************Aggregate SUM(amount) for total revenue******************
SELECT
  substr(o.order_date, 7, 4) AS year,
  substr(o.order_date, 4, 2) AS month,
  SUM(d.amount) AS total_revenue
FROM 
  Orderstask6 o
JOIN 
  Detailstask6 d ON o.order_id = d.order_id
GROUP BY 
  year, month
ORDER BY 
  year, month;

--******************COUNT(DISTINCT order_id) for order volume******************
SELECT
  SUBSTR(o.order_date, 7, 4) AS year,
  SUBSTR(o.order_date, 4, 2) AS month,
  SUM(d.amount) AS total_revenue,
  COUNT(DISTINCT o.order_id) AS order_volume
FROM
  Orderstask6 o
JOIN
  Detailstask6 d ON o.order_id = d.order_id
GROUP BY
  year, month
ORDER BY
  year, month;

****************************************************************
--******************Top 3 Months by Revenue (Advanced)******************
SELECT 
  SUBSTR(o.order_date, 7, 4) AS year,
  SUBSTR(o.order_date, 4, 2) AS month,
  SUM(d.amount) AS total_revenue
FROM 
  Orderstask6 o
JOIN 
  Detailstask6 d ON o.order_id = d.order_id
GROUP BY 
  year, month
ORDER BY 
  total_revenue DESC
LIMIT 3;
****************************************************************************






