USE Practice;

-- Step 1: Create Tables
CREATE TABLE Students_Q29 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE Subjects_Q29 (
    subject_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Examinations_Q29 (
    student_id INT,
    subject_name VARCHAR(50)
);

-- Step 2: Insert values
INSERT INTO Students_Q29 (student_id, student_name) VALUES
(1, 'Alice'), (2, 'Bob'), (13, 'John'), (6, 'Alex');

INSERT INTO Subjects_Q29 (subject_name) VALUES
('Math'), ('Physics'), ('Programming');

INSERT INTO Examinations_Q29 (student_id, subject_name) VALUES
(1, 'Math'), (1, 'Physics'), (1, 'Programming'), (2, 'Programming'), (1, 'Physics'), (1, 'Math'), (13, 'Math'), (13, 'Programming'), (13, 'Physics'), (2, 'Math'), (1, 'Math');

-- Step 3: Count student attendance
SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students_Q29 s
CROSS JOIN Subjects_Q29 sub
LEFT JOIN Examinations_Q29 e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

-- Explanation:
-- A CROSS JOIN generates all possible combinations of students and subjects.
-- We then LEFT JOIN with the Examinations table and count the occurrences.
