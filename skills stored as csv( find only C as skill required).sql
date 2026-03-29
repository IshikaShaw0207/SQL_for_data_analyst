/*
SQL QUESTION
Write an SQL query to retrieve the names of students who have knowledge of the C programming language.

Conditions

	Skills are stored as comma-separated values
	Match C as a standalone skill
	Do not include students who only know C++ or C#
	Output should contain only student names
*/


CREATE TABLE student_skills (
    student_name VARCHAR(50),
    skills VARCHAR(100)
);



INSERT INTO student_skills VALUES
('Akash','Java,SQL'),
('Sam','C,C#,.Net'),
('Joe','C,C++'),
('Eric','C#,Power BI');

select * from student_skills

SELECT student_name
FROM student_skills
WHERE CONCAT(',', skills, ',') LIKE '%,C,%';


