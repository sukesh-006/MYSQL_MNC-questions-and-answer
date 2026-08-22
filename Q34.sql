USE Practice;

-- Step 1: Create Table
CREATE TABLE Sales_Q34 (
    product_id INT,
    sale_date DATE,
    volume INT
);

-- Step 2: Insert values
INSERT INTO Sales_Q34 (product_id, sale_date, volume) VALUES
(1, '2023-01-01', 10),
(1, '2023-02-01', 15),
(1, '2023-03-01', 20),
(1, '2023-04-01', 25),
(2, '2023-01-01', 50),
(2, '2023-02-01', 40),
(2, '2023-03-01', 45);

-- Step 3: Find trend shifts (3 consecutive months of strictly increasing sales volume)
WITH MonthlySales AS (
    SELECT product_id, DATE_FORMAT(sale_date, '%Y-%m-01') AS month_start, SUM(volume) AS total_volume
    FROM Sales_Q34
    GROUP BY product_id, DATE_FORMAT(sale_date, '%Y-%m-01')
),
SalesWithLag AS (
    SELECT product_id, month_start, total_volume,
           LAG(total_volume, 1) OVER (PARTITION BY product_id ORDER BY month_start) AS lag1,
           LAG(total_volume, 2) OVER (PARTITION BY product_id ORDER BY month_start) AS lag2
    FROM MonthlySales
)
SELECT DISTINCT product_id
FROM SalesWithLag
WHERE total_volume > lag1 AND lag1 > lag2;

-- Explanation:
-- We aggregate volume by month.
-- Then use LAG() to get the previous 2 months' volumes.
-- We check if the volumes have strictly increased for 3 consecutive months.
