USE Practice;

-- Step 1: Create Tables
CREATE TABLE Person_Q5 (
    personId INT PRIMARY KEY,
    lastName VARCHAR(255),
    firstName VARCHAR(255)
);

CREATE TABLE Address_Q5 (
    addressId INT PRIMARY KEY,
    personId INT,
    city VARCHAR(255),
    state VARCHAR(255)
);

-- Step 2: Insert values
INSERT INTO Person_Q5 (personId, lastName, firstName) VALUES
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob');

INSERT INTO Address_Q5 (addressId, personId, city, state) VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Leetcode', 'California');

-- Step 3: Query to combine two tables
SELECT firstName, lastName, city, state
FROM Person_Q5 p
LEFT JOIN Address_Q5 a
ON p.personId = a.personId;

-- Explanation:
-- We need to report firstName, lastName, city, and state for each person.
-- A LEFT JOIN ensures all persons are included, even if they have no matching address.
