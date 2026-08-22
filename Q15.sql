USE Practice;

-- Step 1: Create Table
CREATE TABLE Products_Q15 (
    product_id INT,
    new_price INT,
    change_date DATE
);

-- Step 2: Insert values
INSERT INTO Products_Q15 (product_id, new_price, change_date) VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');

-- Step 3: Query product price at a specific date ('2019-08-16')
SELECT product_id,
       COALESCE((
           SELECT new_price
           FROM Products_Q15 p2
           WHERE p1.product_id = p2.product_id AND change_date <= '2019-08-16'
           ORDER BY change_date DESC LIMIT 1
       ), 10) AS price
FROM (SELECT DISTINCT product_id FROM Products_Q15) p1;

-- Explanation:
-- Use a subquery to find the latest price before or on '2019-08-16'.
-- COALESCE handles products whose first price change occurred after the date (defaults to 10).
