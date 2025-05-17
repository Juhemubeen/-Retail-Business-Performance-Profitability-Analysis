Create database retail_db;
use retail_db;
show databases;
show tables;

SELECT * FROM retail_db.`features data set`;
SELECT * FROM retail_db.`sales data-set`;
SELECT * FROM retail_db.`stores data-set`;
SELECT * FROM `stores data-set`;

RENAME TABLE `sales data-set` TO sales_data;
RENAME TABLE `features data set` TO features_data;
RENAME TABLE `stores data-set` TO store_data;




SELECT *
FROM `retail_db`.`sales_data` AS s
LEFT JOIN `retail_db`.`features_data` AS f
  ON s.store = f.store AND s.date = f.date
LEFT JOIN `retail_db`.`store_data` AS st
  ON s.store = st.store;

SELECT 
  s.store,
  s.dept,
  s.date,
  s.weekly_sales,
  f.temperature,
  f.fuel_price,
  f.cpi,
  f.unemployment,
  st.type,
  st.size
FROM `retail_db`.`sales_data` AS s
LEFT JOIN `retail_db`.`features_data` AS f
  ON s.store = f.store AND s.date = f.date
LEFT JOIN `retail_db`.`store_data` AS st
  ON s.store = st.store;


Show tables in retail_db;


SELECT * FROM retail_db.`features_data`;

SELECT
  CASE
    WHEN MARKDOWN1 IN ('NA', 'N/A') OR MARKDOWN1 IS NULL THEN 0
    ELSE MARKDOWN1
  END AS MARKDOWN1,
  
  CASE
    WHEN MARKDOWN2 IN ('NA', 'N/A') OR MARKDOWN2 IS NULL THEN 0
    ELSE MARKDOWN2
  END AS MARKDOWN2,

  CASE
    WHEN MARKDOWN3 IN ('NA', 'N/A') OR MARKDOWN3 IS NULL THEN 0
    ELSE MARKDOWN3
  END AS MARKDOWN3,

  CASE
    WHEN MARKDOWN4 IN ('NA', 'N/A') OR MARKDOWN4 IS NULL THEN 0
    ELSE MARKDOWN4
  END AS MARKDOWN4,

  CASE
    WHEN MARKDOWN5 IN ('NA', 'N/A') OR MARKDOWN5 IS NULL THEN 0
    ELSE MARKDOWN5
  END AS MARKDOWN5
FROM retail_db.`features_data`;

UPDATE `features_data`
SET
  MarkDown1 = IFNULL(MarkDown1, 0),
  MarkDown2 = IFNULL(MarkDown2, 0),
  MarkDown3 = IFNULL(MarkDown3, 0),
  MarkDown4 = IFNULL(MarkDown4, 0),
  MarkDown5 = IFNULL(MarkDown5, 0);


SHOW COLUMNS FROM retail_db.`features_data`;

SELECT * FROM retail_db.`features_data`;

SELECT
  s.Store,
  s.Dept,
  s.Date,
  s.Weekly_Sales,
  ROUND(s.Weekly_Sales * 0.30, 2) AS Estimated_Cost,
  ROUND(s.Weekly_Sales - s.Weekly_Sales * 0.30, 2) AS Estimated_Profit,
  ROUND(((s.Weekly_Sales - s.Weekly_Sales * 0.30) / s.Weekly_Sales) * 100, 2) AS Estimated_Profit_Margin
FROM retail_db.`sales_data` s;

ALTER TABLE retail_db.`sales_data`
ADD COLUMN Cost DECIMAL(10,2);
UPDATE `sales data-set`
SET Cost = ROUND(Weekly_Sales * 0.70, 2);

SELECT
  Store,
  Dept,
  Date,
  Weekly_Sales AS Revenue,
  Cost,
  ROUND(Weekly_Sales - Cost, 2) AS Profit,
  ROUND(((Weekly_Sales - Cost) / Weekly_Sales) * 100, 2) AS Profit_Margin_Percentage
FROM retail_db.`sales_data`;

SELECT
  Store,
  Dept,
  Date,
  Weekly_Sales AS Revenue,
  Cost,
  ROUND(Weekly_Sales - Cost, 2) AS Profit,
  ROUND(
    CASE 
      WHEN Weekly_Sales != 0 THEN ((Weekly_Sales - Cost) / Weekly_Sales) * 100
      ELSE 0
    END, 2
  ) AS Profit_Margin_Percentage
FROM retail_db.`sales_data`;

SELECT
  Store,
  Dept,
  Date,
  Weekly_Sales AS Revenue,
  Cost,
  ROUND(Weekly_Sales - Cost, 2) AS Profit,
  ROUND(
    CASE 
      WHEN Weekly_Sales != 0 THEN ((Weekly_Sales - Cost) / Weekly_Sales) * 100
      ELSE 0
    END, 2
  ) AS Profit_Margin_Percentage
FROM retail_db.`sales_data`;

SELECT * FROM sales_profit_margin_view;








