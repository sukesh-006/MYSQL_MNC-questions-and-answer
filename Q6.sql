USE Practice;

-- Step 1: Create Table
CREATE TABLE Salary_Q6 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    sex CHAR(1),
    salary INT
);

-- Step 2: Insert values
INSERT INTO Salary_Q6 (id, name, sex, salary) VALUES
(1, 'A', 'm', 2500),
(2, 'B', 'f', 1500),
(3, 'C', 'm', 5500),
(4, 'D', 'f', 500);

-- Step 3: Update query to swap salary
UPDATE Salary_Q6
SET sex = CASE 
    WHEN sex = 'm' THEN 'f'
    ELSE 'm'
END;

-- Explanation:
-- A single UPDATE statement is required to swap 'm' and 'f'.
-- We use a CASE statement to check the current value and flip it.
