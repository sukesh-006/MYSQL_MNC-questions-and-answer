create database Practice;
use Practice;

CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

-- Step 2: Insert values
INSERT INTO Person (id, email) VALUES
(1, 'john@gmail.com'),
(2, 'sam@gmail.com'),
(3, 'john@gmail.com'),
(4, 'alex@gmail.com'),
(5, 'sam@gmail.com'),
(6, 'ram@gmail.com'),
(7, 'john@gmail.com'),
(8, 'tom@gmail.com');

Select email
from Person
group by email
having count(*)>1;


