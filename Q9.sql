USE Practice;

-- Step 1: Create Tables
CREATE TABLE Product_Q9 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE Sales_Q9 (
    sale_id INT PRIMARY KEY,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);

-- Step 2: Insert values
INSERT INTO Product_Q9 (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

INSERT INTO Sales_Q9 (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(3, 200, 2011, 15, 9000);

-- Step 3: Query to find total sales by year
SELECT p.product_name, s.year, s.price, s.quantity
FROM Sales_Q9 s
JOIN Product_Q9 p ON s.product_id = p.product_id;

-- Explanation:
-- We perform an INNER JOIN to fetch product names along with their sales details per year.
