USE Practice;

-- Step 1: Create Tables
CREATE TABLE Customer_Q26 (
    customer_id INT,
    product_key INT
);

CREATE TABLE Product_Q26 (
    product_key INT PRIMARY KEY
);

-- Step 2: Insert values
INSERT INTO Product_Q26 (product_key) VALUES (5), (6);

INSERT INTO Customer_Q26 (customer_id, product_key) VALUES
(1, 5), (2, 6), (3, 5), (3, 6), (1, 6);

-- Step 3: Find customers who bought all products
SELECT customer_id
FROM Customer_Q26
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product_Q26);

-- Explanation:
-- Group by customer_id and check if the number of distinct products they bought
-- matches the total number of products in the Product catalog.
