USE Practice;

-- Step 1: Create Table
CREATE TABLE Transactions_Q22 (
    id INT PRIMARY KEY,
    country VARCHAR(100),
    state VARCHAR(50),
    amount INT,
    trans_date DATE
);

-- Step 2: Insert values
INSERT INTO Transactions_Q22 (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

-- Step 3: Monthly transactions
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions_Q22
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country;

-- Explanation:
-- DATE_FORMAT extracts the year and month.
-- We aggregate transaction counts and amounts conditionally based on the 'approved' state.
