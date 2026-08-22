USE Practice;

-- Step 1: Create Table
CREATE TABLE Scores_Q19 (
    id INT PRIMARY KEY,
    score FLOAT
);

-- Step 2: Insert values
INSERT INTO Scores_Q19 (id, score) VALUES
(1, 3.50),
(2, 3.65),
(3, 4.00),
(4, 3.85),
(5, 4.00),
(6, 3.65);

-- Step 3: Rank scores
SELECT score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM Scores_Q19;

-- Explanation:
-- DENSE_RANK() is used to rank scores with ties receiving the same rank.
-- Next ranking numbers are consecutive with no gaps.
