USE Practice;

-- Step 1: Create Tables
CREATE TABLE Friendship_Q45 (
    user1_id INT,
    user2_id INT,
    PRIMARY KEY(user1_id, user2_id)
);

CREATE TABLE Likes_Q45 (
    user_id INT,
    page_id INT,
    PRIMARY KEY(user_id, page_id)
);

-- Step 2: Insert values
INSERT INTO Friendship_Q45 (user1_id, user2_id) VALUES
(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (2, 5), (6, 1);

INSERT INTO Likes_Q45 (user_id, page_id) VALUES
(1, 88), (2, 23), (3, 24), (4, 56), (5, 11), (6, 33), (2, 77), (3, 77), (6, 88);

-- Step 3: Page Recommendations for user_id = 1
WITH UserFriends AS (
    SELECT user2_id AS friend_id FROM Friendship_Q45 WHERE user1_id = 1
    UNION
    SELECT user1_id AS friend_id FROM Friendship_Q45 WHERE user2_id = 1
)
SELECT DISTINCT page_id AS recommended_page
FROM Likes_Q45
WHERE user_id IN (SELECT friend_id FROM UserFriends)
  AND page_id NOT IN (SELECT page_id FROM Likes_Q45 WHERE user_id = 1);

-- Explanation:
-- We find all friends of user 1 (checking both columns of Friendship).
-- We recommend pages liked by these friends, explicitly excluding pages user 1 already likes.
