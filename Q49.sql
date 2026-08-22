USE Practice;

-- Step 1: Create Table
CREATE TABLE Activity_Q49 (
    user_id INT,
    event_date DATE
);

-- Step 2: Insert values
INSERT INTO Activity_Q49 (user_id, event_date) VALUES
(1, '2023-01-05'), (1, '2023-02-05'),
(2, '2023-01-10'),
(3, '2023-02-15'), (3, '2023-03-15');

-- Step 3: User Retention Rate (Cohort Analysis for MoM)
WITH UserMonths AS (
    SELECT DISTINCT user_id, DATE_FORMAT(event_date, '%Y-%m-01') AS month_start
    FROM Activity_Q49
)
SELECT u1.month_start AS cohort_month,
       COUNT(u2.user_id) / COUNT(u1.user_id) AS retention_rate
FROM UserMonths u1
LEFT JOIN UserMonths u2 ON u1.user_id = u2.user_id 
                        AND u2.month_start = DATE_ADD(CAST(u1.month_start AS DATE), INTERVAL 1 MONTH)
GROUP BY u1.month_start;

-- Explanation:
-- Find distinct months a user was active.
-- LEFT JOIN the CTE to itself matching on the very next month.
-- The retention rate is users active in month M+1 divided by users active in month M.
