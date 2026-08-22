USE Practice;

-- Step 1: Create Tables
CREATE TABLE Users_Q42 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Rides_Q42 (
    id INT PRIMARY KEY,
    user_id INT,
    distance INT
);

-- Step 2: Insert values
INSERT INTO Users_Q42 (id, name) VALUES
(1, 'Alice'), (2, 'Bob'), (3, 'Alex'), (4, 'Donald'), (7, 'Lee'), (13, 'Jonathan'), (19, 'Elvis');

INSERT INTO Rides_Q42 (id, user_id, distance) VALUES
(1, 1, 120), (2, 2, 317), (3, 3, 222), (4, 7, 100), (5, 13, 312), (6, 19, 50),
(7, 7, 120), (8, 19, 400), (9, 7, 230);

-- Step 3: Total Traveled Distance
SELECT u.name, COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM Users_Q42 u
LEFT JOIN Rides_Q42 r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;

-- Explanation:
-- LEFT JOIN ensures users with no rides are included.
-- COALESCE converts NULL sums to 0.
-- We sort by travelled distance descending and then by name alphabetically.
