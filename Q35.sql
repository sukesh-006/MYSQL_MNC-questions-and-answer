USE Practice;

-- Step 1: Create Table
CREATE TABLE Stadium_Q35 (
    id INT PRIMARY KEY,
    visit_date DATE,
    people INT
);

-- Step 2: Insert values
INSERT INTO Stadium_Q35 (id, visit_date, people) VALUES
(1, '2017-01-01', 10),
(2, '2017-01-02', 109),
(3, '2017-01-03', 150),
(4, '2017-01-04', 99),
(5, '2017-01-05', 145),
(6, '2017-01-06', 1455),
(7, '2017-01-07', 199),
(8, '2017-01-09', 188);

-- Step 3: Human Traffic of Stadium
WITH CTE AS (
    SELECT id, visit_date, people,
           id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Stadium_Q35
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM CTE
WHERE grp IN (
    SELECT grp FROM CTE GROUP BY grp HAVING COUNT(*) >= 3
)
ORDER BY visit_date;

-- Explanation:
-- We filter records with people >= 100 and create a grouping identifier based on ID difference.
-- This effectively groups consecutive IDs together. We select groups with count >= 3.
