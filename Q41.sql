USE Practice;

-- Step 1: Create Table
CREATE TABLE Paths_Q41 (
    user_id INT,
    timestamp INT,
    page_id VARCHAR(50)
);

-- Step 2: Insert values
INSERT INTO Paths_Q41 (user_id, timestamp, page_id) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(1, 3, 'C'),
(2, 4, 'A'),
(2, 5, 'B'),
(2, 6, 'C'),
(3, 7, 'B'),
(3, 8, 'C'),
(3, 9, 'D'),
(4, 10, 'A'),
(4, 11, 'B'),
(4, 12, 'C');

-- Step 3: User Purchase Paths (Most common 3-page sequential browsing path)
WITH UserPaths AS (
    SELECT user_id, 
           page_id AS p1,
           LEAD(page_id, 1) OVER (PARTITION BY user_id ORDER BY timestamp) AS p2,
           LEAD(page_id, 2) OVER (PARTITION BY user_id ORDER BY timestamp) AS p3
    FROM Paths_Q41
)
SELECT CONCAT(p1, ' -> ', p2, ' -> ', p3) AS pattern, COUNT(*) AS pattern_count
FROM UserPaths
WHERE p2 IS NOT NULL AND p3 IS NOT NULL
GROUP BY p1, p2, p3
ORDER BY pattern_count DESC
LIMIT 1;

-- Explanation:
-- We use LEAD() to get the next two pages visited by the user.
-- We concatenate them into a pattern and count the occurrences of each pattern.
-- Sorting by count descending and using LIMIT 1 gives the most common path.
