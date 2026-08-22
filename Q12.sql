USE Practice;

-- Step 1: Create Table
CREATE TABLE Activities_Q12 (
    sell_date DATE,
    product VARCHAR(100)
);

-- Step 2: Insert values
INSERT INTO Activities_Q12 (sell_date, product) VALUES
('2020-05-30', 'Headphone'),
('2020-05-30', 'Basketball'),
('2020-05-30', 'T-shirt'),
('2020-05-30', 'T-shirt'),
('2020-06-01', 'Pencil'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask');

-- Step 3: Group sold products by date
SELECT sell_date, 
       COUNT(DISTINCT product) AS num_sold, 
       GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities_Q12
GROUP BY sell_date
ORDER BY sell_date;

-- Explanation:
-- GROUP BY sell_date to get aggregates per day.
-- Use COUNT(DISTINCT product) for total distinct items.
-- Use GROUP_CONCAT(DISTINCT product ORDER BY product) to comma-separate sorted product names.
