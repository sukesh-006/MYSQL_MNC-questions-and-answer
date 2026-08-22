USE Practice;

-- Step 1: Create Table
CREATE TABLE Delivery_Q20 (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

-- Step 2: Insert values
INSERT INTO Delivery_Q20 (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 2, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-12'),
(4, 3, '2019-08-24', '2019-08-24'),
(5, 3, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13'),
(7, 4, '2019-08-09', '2019-08-09');

-- Step 3: Immediate Food Delivery percentage
WITH FirstOrders AS (
    SELECT customer_id, MIN(order_date) as first_order_date
    FROM Delivery_Q20
    GROUP BY customer_id
)
SELECT ROUND(
    SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 
    / COUNT(*), 2
) AS immediate_percentage
FROM Delivery_Q20 d
JOIN FirstOrders f ON d.customer_id = f.customer_id AND d.order_date = f.first_order_date;

-- Explanation:
-- A CTE finds the first order date for each customer.
-- Then we calculate the percentage of those first orders that are immediate (order_date = pref_date).
