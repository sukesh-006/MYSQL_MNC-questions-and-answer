USE Practice;

-- Step 1: Create Table
CREATE TABLE Cinema_Q7 (
    id INT PRIMARY KEY,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating FLOAT
);

-- Step 2: Insert values
INSERT INTO Cinema_Q7 (id, movie, description, rating) VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);

-- Step 3: Query for not boring movies with odd ID
SELECT id, movie, description, rating
FROM Cinema_Q7
WHERE MOD(id, 2) = 1 AND description != 'boring'
ORDER BY rating DESC;

-- Explanation:
-- Use MOD(id, 2) = 1 to filter for odd IDs.
-- Exclude 'boring' descriptions using != 'boring'.
-- Sort the result by rating descending.
