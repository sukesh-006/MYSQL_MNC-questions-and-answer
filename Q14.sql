USE Practice;

-- Step 1: Create Table
CREATE TABLE Customers_Q14 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Step 2: Insert values
INSERT INTO Customers_Q14 (customer_id, customer_name) VALUES
(1, 'Alice'),
(4, 'Bob'),
(5, 'Charlie');

-- Step 3: Find missing IDs using a recursive CTE (MySQL 8+)
WITH RECURSIVE NumberSeq AS (
    SELECT 1 AS id
    UNION ALL
    SELECT id + 1 FROM NumberSeq
    WHERE id < (SELECT MAX(customer_id) FROM Customers_Q14)
)
SELECT id AS ids
FROM NumberSeq
LEFT JOIN Customers_Q14 c ON NumberSeq.id = c.customer_id
WHERE c.customer_id IS NULL;

-- Explanation:
-- A recursive CTE generates a sequential list of numbers up to the MAX customer_id.
-- We LEFT JOIN this sequence with the Customers table to find missing IDs.
