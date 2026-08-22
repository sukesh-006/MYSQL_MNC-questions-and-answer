USE Practice;

-- Step 1: Create Table
CREATE TABLE Courses_Q8 (
    student VARCHAR(255),
    class VARCHAR(255)
);

-- Step 2: Insert values
INSERT INTO Courses_Q8 (student, class) VALUES
('A', 'Math'),
('B', 'English'),
('C', 'Math'),
('D', 'Biology'),
('E', 'Math'),
('F', 'Computer'),
('G', 'Math'),
('H', 'Math'),
('I', 'Math');

-- Step 3: Query for classes with >= 5 students
SELECT class
FROM Courses_Q8
GROUP BY class
HAVING COUNT(student) >= 5;

-- Explanation:
-- Group the records by class.
-- Use HAVING to count the number of students per class and return only those >= 5.
