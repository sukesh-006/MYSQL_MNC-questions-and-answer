USE Practice;

-- Step 1: Create Table
CREATE TABLE ActorDirector_Q10 (
    actor_id INT,
    director_id INT,
    timestamp INT PRIMARY KEY
);

-- Step 2: Insert values
INSERT INTO ActorDirector_Q10 (actor_id, director_id, timestamp) VALUES
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 3),
(1, 2, 4),
(2, 1, 5),
(2, 1, 6);

-- Step 3: Query for pairs with at least 3 collaborations
SELECT actor_id, director_id
FROM ActorDirector_Q10
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;

-- Explanation:
-- Group by both actor_id and director_id.
-- Count the occurrences and filter groups that have 3 or more entries.
