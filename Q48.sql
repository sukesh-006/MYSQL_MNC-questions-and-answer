USE Practice;

-- Step 1: Create Tables
CREATE TABLE Items_Q48 (
    item_id INT PRIMARY KEY,
    item_category VARCHAR(255)
);

CREATE TABLE Orders_Q48 (
    order_id INT PRIMARY KEY,
    item_id INT,
    order_date DATE,
    quantity INT
);

-- Step 2: Insert values
INSERT INTO Items_Q48 (item_id, item_category) VALUES
(1, 'Book'), (2, 'Glasses'), (3, 'Phone');

INSERT INTO Orders_Q48 (order_id, item_id, order_date, quantity) VALUES
(1, 1, '2020-06-01', 10), (2, 1, '2020-06-02', 5),
(3, 2, '2020-06-03', 15), (4, 3, '2020-06-04', 20),
(5, 3, '2020-06-05', 10), (6, 1, '2020-06-06', 20),
(7, 2, '2020-06-07', 30);

-- Step 3: Sales by Day of the Week
SELECT 
    i.item_category,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 2 THEN o.quantity ELSE 0 END) AS Monday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 3 THEN o.quantity ELSE 0 END) AS Tuesday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 4 THEN o.quantity ELSE 0 END) AS Wednesday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 5 THEN o.quantity ELSE 0 END) AS Thursday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 6 THEN o.quantity ELSE 0 END) AS Friday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 7 THEN o.quantity ELSE 0 END) AS Saturday,
    SUM(CASE WHEN DAYOFWEEK(o.order_date) = 1 THEN o.quantity ELSE 0 END) AS Sunday
FROM Items_Q48 i
LEFT JOIN Orders_Q48 o ON i.item_id = o.item_id
GROUP BY i.item_category
ORDER BY i.item_category;

-- Explanation:
-- DAYOFWEEK() in MySQL returns 1 for Sunday, 2 for Monday, etc.
-- We use conditional aggregation to pivot the quantities into day columns.
