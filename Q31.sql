USE Practice;

-- Step 1: Create Tables
CREATE TABLE Product_Q31 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    unit_price INT
);

CREATE TABLE Sales_Q31 (
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date DATE,
    quantity INT,
    price INT
);

-- Step 2: Insert values
INSERT INTO Product_Q31 (product_id, product_name, unit_price) VALUES
(1, 'S8', 1000), (2, 'G4', 800), (3, 'iPhone', 1400);

INSERT INTO Sales_Q31 (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 2, 3, '2019-06-02', 1, 800),
(3, 3, 4, '2019-05-13', 2, 2800);

-- Step 3: Sales Analysis - Top best-selling product by total overall quantity
SELECT product_id
FROM Sales_Q31
GROUP BY product_id
HAVING SUM(quantity) = (
    SELECT MAX(total_qty) FROM (
        SELECT SUM(quantity) AS total_qty FROM Sales_Q31 GROUP BY product_id
    ) tmp
);

-- Explanation:
-- We find the highest total quantity sold for any product.
-- Then we return the product(s) that match this highest total quantity.
