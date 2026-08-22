USE Practice;

-- Step 1: Create Table
CREATE TABLE Users_Q11 (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Step 2: Insert values
INSERT INTO Users_Q11 (user_id, name) VALUES
(1, 'aLice'),
(2, 'bOB');

-- Step 3: Query to fix names
SELECT user_id, 
       CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users_Q11
ORDER BY user_id;

-- Explanation:
-- Use UPPER to capitalize the first letter and LOWER for the rest of the string.
-- Concatenate them back together using CONCAT.
