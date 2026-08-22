USE Practice;

-- Step 1: Create Table
CREATE TABLE Employee_Q17 (
    id INT PRIMARY KEY,
    salary INT
);

-- Step 2: Insert values
INSERT INTO Employee_Q17 (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);

-- Step 3: Function/Query for Nth Highest Salary (Example for N=2)
-- Assuming N is passed as a variable or we use a CTE
SET @N = 2;
SELECT salary
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
    FROM Employee_Q17
) tmp
WHERE rnk = @N
LIMIT 1;

-- Explanation:
-- DENSE_RANK() assigns ranks continuously to unique salaries.
-- Filtering by the specific rank gives the dynamically requested Nth highest salary.
