USE Practice;

-- Step 1: Create Tables
CREATE TABLE Student_Q43 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);

CREATE TABLE Exam_Q43 (
    exam_id INT,
    student_id INT,
    score INT,
    PRIMARY KEY(exam_id, student_id)
);

-- Step 2: Insert values
INSERT INTO Student_Q43 (student_id, student_name) VALUES
(1, 'Daniel'), (2, 'Jade'), (3, 'Stella'), (4, 'Jonathan'), (5, 'Will');

INSERT INTO Exam_Q43 (exam_id, student_id, score) VALUES
(10, 1, 70), (10, 2, 80), (10, 3, 90),
(20, 1, 80), (30, 1, 70), (30, 3, 80), (30, 4, 90), (40, 1, 60), (40, 2, 70), (40, 4, 80);

-- Step 3: Find Quiet Students in All Exams
WITH MaxMinScores AS (
    SELECT exam_id, MAX(score) as max_s, MIN(score) as min_s
    FROM Exam_Q43
    GROUP BY exam_id
)
SELECT s.student_id, s.student_name
FROM Student_Q43 s
WHERE s.student_id IN (SELECT DISTINCT student_id FROM Exam_Q43)
  AND s.student_id NOT IN (
      SELECT e.student_id
      FROM Exam_Q43 e
      JOIN MaxMinScores m ON e.exam_id = m.exam_id
      WHERE e.score = m.max_s OR e.score = m.min_s
  );

-- Explanation:
-- We find the max and min scores for each exam.
-- We exclude any student who ever scored the max or min in ANY exam they took.
-- We also ensure the student actually took at least one exam.
