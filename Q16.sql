USE Practice;

-- Step 1: Create Table
CREATE TABLE Tweets_Q16 (
    tweet_id INT PRIMARY KEY,
    content VARCHAR(255)
);

-- Step 2: Insert values
INSERT INTO Tweets_Q16 (tweet_id, content) VALUES
(1, 'Vote for Biden'),
(2, 'Let us make America great again!');

-- Step 3: Find invalid tweets
SELECT tweet_id
FROM Tweets_Q16
WHERE LENGTH(content) > 15;

-- Explanation:
-- A tweet is invalid if the character length of its content is strictly greater than 15.
-- We use the LENGTH() function to verify the character count.
