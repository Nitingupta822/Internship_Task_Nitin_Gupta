create database University;
use University;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    date_of_birth DATE,
    enrollment_date DATE NOT NULL,
    department_id INT
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

alter table Students add 
FOREIGN KEY (department_id)
 REFERENCES Departments(department_id) ON DELETE CASCADE ON UPDATE CASCADE;
 
 CREATE TABLE Professors (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(5)
);


alter table Enrollments add 
FOREIGN KEY (student_id)
 REFERENCES Students(student_id) ON DELETE CASCADE ON UPDATE CASCADE;
 
alter table Enrollments add 
 FOREIGN KEY (course_id) 
 REFERENCES Courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE;
 
 CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    professor_id INT NOT NULL,
    credits INT NOT NULL
);
 alter table Courses add 
 FOREIGN KEY (department_id) 
 REFERENCES Departments(department_id) ON DELETE CASCADE ON UPDATE CASCADE;
 
 alter table Courses add 
 FOREIGN KEY (professor_id) 
 REFERENCES Professors(professor_id) ON DELETE cascade ON UPDATE CASCADE;

use University;

INSERT INTO Departments (department_id, department_name) VALUES
(1001, 'Computer Science'),
(1002, 'Mathematics'),
(1003, 'Physics'),
(1004, 'Biology'),
(1005, 'Chemistry');

INSERT INTO Professors (professor_id, first_name, last_name, email, phone) VALUES
(101, 'Aman', 'Panday', 'aman@gmail.com', '913-456-7890'),
(102, 'Bipen', 'Gupta', 'bipen@gmail.com', '972-456-7891'),
(103, 'Rahul', 'Shing', 'rahul@gmail.com', '894-456-7892'),
(104, 'Dhruv', 'Mishar', 'dhruv@gmail.com', '953-456-7893'),
(105, 'Nitin', 'Gupta', 'nitin@gmail.com', '863-456-7894');


INSERT INTO Courses (course_id, course_name, department_id, professor_id, credits) VALUES
(1, 'Introduction to Programming', 1001, 101, 4),
(2, 'Data Structures', 1002, 102, 3),
(3, 'Calculus I', 1003, 103, 4),
(4, 'Linear Algebra', 1004, 104, 3),
(5, 'General Physics', 1005, 105, 4);


INSERT INTO Students (student_id, first_name, last_name, email, phone, date_of_birth, enrollment_date, department_id) VALUES
(201, 'Vineet', 'Gupta', 'vineet@gmail.com', '987-654-3210', '2000-01-15', '202-08-20', 1001),
(202, 'Jane', 'Doe', 'jane@gmail.com', '987-654-3211', '2001-06-20', '2023-08-20', 1002),
(203, 'Sandeep', 'Shing', 'sandeep@gmail.com', '987-654-3212', '206-02-25', '2023-08-21', 1001),
(204, 'Udit', 'Varma', 'udit@gmail.com', '987-654-3213', '2000-10-10', '2023-08-22', 1003),
(205, 'Mohit', 'Jain', 'mohit@gmail.com', '987-654-3214', '2005-07-30', '2023-08-23', 1004);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, grade) VALUES
(991, 201, 1, '2023-08-20', 'A'),
(992, 201, 2, '2023-08-20', 'B'),
(993, 202, 3, '2023-08-20', 'A'),
(994, 203, 2, '2023-08-21', 'B+'),
(995, 204, 5, '2023-08-22', 'A-');

select * from Students;

select * from professors;

select * from enrollments;

select * from departments;

select * from courses;
 
-- Q1. 1. Find the Total Number of Students in Each Department

SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
GROUP BY d.department_name;


-- Q2. List All Courses Taught by a Specific Professor

SELECT c.course_name
FROM Courses c
JOIN Professors p ON c.professor_id = p.professor_id
WHERE CONCAT(p.first_name, ' ', p.last_name) = 'Nitin Gupta';


-- Q3. Find the Average Grade of Students in Each Course

SELECT c.course_name, AVG(CAST(e.grade AS DECIMAL)) AS average_grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name;

-- Q4. List All Students Who Have Not Enrolled in Any Courses

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- Q5. Find the Number of Courses Offered by Each Department

SELECT d.department_name, COUNT(c.course_id) AS total_courses
FROM Courses c
JOIN Departments d ON c.department_id = d.department_id
GROUP BY d.department_name;


-- Q6. List All Students Who Have Taken a Specific Course (e.g., 'Database Systems')

SELECT s.first_name, s.last_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';

-- Q7. Find the Most Popular Course Based on Enrollment 

SELECT c.course_name, COUNT(e.enrollment_id) AS total_enrollments
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name
ORDER BY total_enrollments DESC
LIMIT 1;

-- Q8. Find the Average Number of Credits Per Student in a Department

SELECT d.department_name, AVG(c.credits) AS average_credits
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
JOIN Students s ON e.student_id = s.student_id
JOIN Departments d ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science'
GROUP BY d.department_name;


-- Q9. List All Professors Who Teach in More Than One Department

SELECT p.first_name, p.last_name
FROM Courses c
JOIN Professors p ON c.professor_id = p.professor_id
JOIN Departments d ON c.department_id = d.department_id
GROUP BY p.professor_id
HAVING COUNT(DISTINCT d.department_id) > 1;


-- Q10. Get the Highest and Lowest Grade in a Specific Course (e.g., 'Operating Systems')

SELECT c.course_name, MAX(e.grade) AS highest_grade, MIN(e.grade) AS lowest_grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Operating Systems'
GROUP BY c.course_name;





