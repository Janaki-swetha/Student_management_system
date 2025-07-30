
-- STUDENT COURSE MANAGEMENT SYSTEM (PRO VERSION)


-- 1.Department
Create table Department(dept_id int primary key,Dept_name varchar(50),Hod varchar(50));
insert into department values(101,'CSE','Janaki');
insert into department values(102,'ECE','swetha');
insert into department values(103,'EEE','Ram');
insert into department values(104,'MEC','Shiva');
insert into department values(105,'BCA','Lakshmi');
insert into department values(106,'AI','sai');
insert into department values(107,'DS','Arjun');
insert into department values(108,'CEC','Krishna');
insert into department values(109,'MEC','Devi');
insert into department values(110,'BSC','Sam');
select * from Department;

-- 2.student
create table student(s_id int primary key,
name varchar(50),
gender varchar(10),
DOB Date,dept_id int,
email varchar(100),
foreign key(dept_id) references department(dept_id));
INSERT INTO Student VALUES 
(1, 'Anu', 'Female', '2003-04-12', 101, 'anu@example.com'),
(2, 'Ravi', 'Male', '2002-10-25', 101, 'ravi@example.com'),
(3, 'Swetha', 'Female', '2003-01-18', 102, 'swetha@example.com'),
(4, 'Anjali', 'Female', '2003-04-12', 101, 'anjali@example.com'),
(5, 'Ramu', 'Male', '2002-10-25', 101, 'ramu@example.com'),
(6, 'Swathi', 'Female', '2003-01-18', 102, 'swathi@example.com'),
(7, 'Anusha', 'Female', '2003-04-22', 101, 'anusha@example.com'),
(8, 'Ranjith', 'Male', '2002-10-25', 101, 'ranjith@example.com'),
(9, 'Sangeetha', 'Female', '2003-11-18', 102, 'sangeetha@example.com'),
(10, 'amina', 'Female', '2003-04-1', 101, 'amina@example.com'),
(11, 'john', 'Male', '2002-10-2', 101, 'john@example.com'),
(12, 'shivani', 'Female', '2002-01-18', 102, 'shivani@example.com'),
(13, 'priya', 'Female', '2003-2-12', 101, 'priya@example.com'),
(14, 'sanju', 'Male', '2002-1-25', 101, 'sanju@example.com'),
(15, 'chinni', 'Female', '2003-02-18', 102, 'chinni@example.com');
select * from student;


-- 3.Faculty
CREATE TABLE Faculty
 (FacultyID INT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(15),
Dept_ID INT,
FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID));
INSERT INTO Faculty VALUES 
(301, 'Prof. Krishna', 'krishna@univ.com', '1234567890', 101),
(302, 'Prof. Meena', 'meena@univ.com', '9876543210', 105),
(303, 'Prof. Varma', 'varma@univ.com', '9988776655', 102),
(304, 'Prof. Anjali', 'anjali@univ.com', '9123456780', 102),
(305, 'Dr. Prakash', 'prakash@univ.com', '9345678912', 103),
(306, 'Dr. Nalini', 'nalini@univ.com', '9001234567', 106),
(307, 'Prof. Suresh', 'suresh@univ.com', '9876501234', 104),
(308, 'Prof. Deepa', 'deepa@univ.com', '9123487650', 109),
(309, 'Dr. Raghav', 'raghav@univ.com', '9332245566', 110),
(310, 'Prof. Ayesha', 'ayesha@univ.com', '9441122334', 102);
select * from faculty;
-- 4. Courses
CREATE TABLE Courses (CourseID INT PRIMARY KEY,CourseName VARCHAR(100),Credits INT,Dept_ID INT,FacultyID INT,FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID));
INSERT INTO Courses VALUES 
(201, 'DBMS', 4, 101, 301),
(202, 'Operating Systems', 4, 101, 302),
(203, 'Digital Electronics', 3, 102, 303),
(204, 'Software Engineering', 3, 101, 309),
(205, 'Data Structures', 4, 101, 301),
(206, 'Microprocessors', 3, 102, 304),
(207, 'Thermodynamics', 4, 103, 305),
(208, 'Structural Analysis', 3, 104, 306),
(209, 'Control Systems', 4, 102, 310),
(210, 'Fluid Mechanics', 3, 104, 307);
select * from courses;

-- 5. Enrollments
CREATE TABLE Enrollments (StudentID INT,CourseID INT,EnrollDate DATE,PRIMARY KEY (StudentID, CourseID),FOREIGN KEY (Studentid) REFERENCES Student(s_id),FOREIGN KEY (CourseID) REFERENCES Courses(CourseID));
INSERT INTO Enrollments VALUES 
(1, 201, '2024-07-01'),
(1, 202, '2024-07-01'),
(1, 204, '2024-07-01'),
(2, 201, '2024-07-01'),
(2, 205, '2024-07-01'),
(3, 203, '2024-07-01'),
(3, 206, '2024-07-01'),
(4, 207, '2024-07-01'),
(5, 208, '2024-07-01'),
(6, 210, '2024-07-01');
select * from enrollments;


-- 6. Marks
CREATE TABLE Marks (
  StudentID INT,
  CourseID INT,
  InternalMarks INT,
  ExternalMarks INT,
  PRIMARY KEY (StudentID, CourseID),
  FOREIGN KEY (StudentID) REFERENCES Student(S_ID),
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Marks VALUES 
(1, 201, 45, 48),
(1, 202, 40, 44),
(2, 201, 42, 46),
(3, 203, 43, 47);
select * from marks;

-- 7. Attendance
CREATE TABLE Attendance (
  StudentID INT,
  CourseID INT,
  TotalClasses INT,
  AttendedClasses INT,
  PRIMARY KEY (StudentID, CourseID),
  FOREIGN KEY (StudentID) REFERENCES Student(S_ID),
  FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Attendance VALUES 
(1, 201, 30, 28),
(1, 202, 28, 26),
(2, 201, 30, 30),
(3, 203, 25, 22);
select * from Attendance;


-- SQL commands 
Use university;
Select name,email from student;
select distinct dob from student;
select * from student order by dob asc;
delete from enrollments where studentid=6;
select * from enrollments;
SELECT S.Name,C.CourseName,(M.InternalMarks + M.ExternalMarks) AS TotalMarks
FROM Marks M
JOIN Student S ON M.StudentID = S.S_ID
JOIN Courses C ON M.CourseID = C.CourseID;
SELECT D.Dept_Name, COUNT(S.S_ID) AS StudentCount
FROM Department D
LEFT JOIN Student S ON D.Dept_ID = S.Dept_ID
GROUP BY D.Dept_Name;
SELECT name FROM student WHERE dept_id = 101;
SELECT CourseName FROM Courses WHERE Dept_ID = 102;
SELECT s.name, d.Dept_name, s.email;
SELECT f.Name AS FacultyName, d.Dept_name
FROM faculty f
JOIN department d ON f.Dept_ID = d.dept_id;
SELECT s.name, m.InternalMarks + m.ExternalMarks AS TotalMarks
FROM student s
JOIN marks m ON s.s_id = m.StudentID
WHERE (m.InternalMarks + m.ExternalMarks) > 90;
UPDATE student SET email = 'newemail@example.com' WHERE s_id = 3;

