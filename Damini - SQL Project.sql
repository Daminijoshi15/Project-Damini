create database Damini
use Damini
-- Task 1
CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(50) NOT NULL,
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(50),
    ADDRESS VARCHAR(100)
);
CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(50) NOT NULL,
    COURSE_INSTRUCTOR_NAME VARCHAR(50)
);
CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);

INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(1, "Damini", "1995-10-08", "7769817445", "joshidamini272@gmail.com", "Whitefiled, Bangalore"),
(2, "Avantika", "1996-08-15", "1234567891", "avantika@gmail.com", "Doddanekundi, Bangalore"),
(3, "Harsha", "2000-05-11", "1122345678", "Harsha@gmail.com", "Banjara Hills, Hydrebad");



INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) VALUES
(1, "SQL", "Rajiv"),
(2, "Python", "Tyler"),
(3, "ML", "Tim");



INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID) VALUES
(100, 1, 2),
(101, 3, 3),
(102, 2, 1);

SELECT STU_ID, STU_NAME, PHONE_NO, EMAIL_ID, ADDRESS 
FROM StudentInfo;

SELECT * 
FROM EnrollmentInfo;

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME 
FROM CoursesInfo;
SELECT * 
FROM CoursesInfo 
WHERE COURSE_ID = 1;

SELECT * 
FROM CoursesInfo 
WHERE COURSE_ID IN (1, 2, 3);

SELECT COURSE_ID, COUNT(STU_ID) as Number_of_Students
FROM EnrollmentInfo
GROUP BY COURSE_ID;

SELECT STU_ID 
FROM EnrollmentInfo 
WHERE COURSE_ID = 1;

SELECT COURSE_INSTRUCTOR_NAME, COUNT(*) as Student_Count
FROM CoursesInfo
GROUP BY COURSE_INSTRUCTOR_NAME;

SELECT STU_ID
FROM EnrollmentInfo
GROUP BY STU_ID
HAVING COUNT(*) > 1;

-- Task 2
CREATE database Damini2
Use Damini2
CREATE TABLE student_table (
    Student_id INTEGER,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC(3,2),
    Grade TEXT CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);


INSERT INTO student_table VALUES
(1001, 'John Smith', 'Computer Science', 'john.s@email.com', 5551234567, '123 Oak St, City', '2000-05-15', 'Male', 'Software Engineering', 3.75, 'A'),
(1002, 'Emma Davis', 'Engineering', 'emma.d@email.com', 5552345678, '456 Pine Ave, Town', '2001-08-22', 'Female', 'Mechanical Engineering', 3.50, 'B'),
(1003, 'Michael Chen', 'Business', 'michael.c@email.com', 5553456789, '789 Maple Dr, City', '2000-03-10', 'Male', 'Finance', 3.90, 'A'),
(1004, 'Sarah Wilson', 'Science', 'sarah.w@email.com', 5554567890, '321 Elm Rd, Village', '2001-11-30', 'Female', 'Physics', 3.25, 'B'),
(1005, 'James Lee', 'Arts', 'james.l@email.com', 5555678901, '654 Cedar Ln, Town', '2000-07-25', 'Male', 'Fine Arts', 3.80, 'A'),
(1006, 'Maria Garcia', 'Computer Science', 'maria.g@email.com', 5556789012, '987 Birch St, City', '2001-04-18', 'Female', 'Data Science', 3.40, 'B'),
(1007, 'David Kim', 'Engineering', 'david.k@email.com', 5557890123, '147 Palm Ave, Town', '2000-09-05', 'Male', 'Civil Engineering', 2.90, 'C'),
(1008, 'Lisa Wang', 'Business', 'lisa.w@email.com', 5558901234, '258 Beach Rd, City', '2001-01-12', 'Female', 'Marketing', 3.60, 'B'),
(1009, 'Robert Brown', 'Science', 'robert.b@email.com', 5559012345, '369 River Dr, Village', '2000-12-08', 'Male', 'Chemistry', 3.15, 'C'),
(1010, 'Amanda White', 'Arts', 'amanda.w@email.com', 5550123456, '741 Lake St, Town', '2001-06-28', 'Female', 'Music', 3.95, 'A');

SELECT *
FROM student_table
ORDER BY Grade ASC, GPA DESC;
SELECT *
FROM student_table
WHERE Gender = "Male";

SELECT *
FROM student_table
WHERE GPA < 5.0;

SELECT Stu_name,
    (YEAR(CURRENT_DATE) - YEAR(Date_of_birth)) as Age
FROM student_table
WHERE Grade = 'B';


ALTER TABLE student_table 
RENAME TO student_info;

SELECT Stu_name, GPA
FROM student_info
WHERE GPA = (SELECT MAX(GPA) FROM student_info);

-- Task 3

create database Damini3
Use Damini3

Create database EventsManagement
Use EventsManagement

CREATE TABLE Events (
    Event_Id INT PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Date DATE,
    Event_Location VARCHAR(200),
    Event_Description TEXT
);

-- Create Attendees table
CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY,
    Attendee_Name VARCHAR(100),
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(50)
);

-- Create Registrations table with foreign keys
CREATE TABLE Registrations (
    Registration_id INT PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount DECIMAL(10,2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

INSERT INTO Events VALUES
(1, 'Tech Conference 2024', '2024-07-15', 'Convention Center, New York', 'Annual Technology Conference'),
(2, 'Music Festival', '2024-08-20', 'Central Park, New York', 'Summer Music Festival'),
(3, 'Business Summit', '2024-09-10', 'Grand Hotel, Chicago', 'Leadership and Innovation Summit'),
(4, 'Food Expo', '2024-10-05', 'Exhibition Center, Las Vegas', 'International Food Exhibition'),
(5, 'Art Gallery', '2024-11-15', 'Art Museum, San Francisco', 'Modern Art Exhibition');


INSERT INTO Attendees VALUES
(101, 'John Smith', '555-0101', 'john.s@email.com', 'New York'),
(102, 'Maria Garcia', '555-0102', 'maria.g@email.com', 'Chicago'),
(103, 'David Wilson', '555-0103', 'david.w@email.com', 'Los Angeles'),
(104, 'Sarah Chen', '555-0104', 'sarah.c@email.com', 'San Francisco'),
(105, 'James Brown', '555-0105', 'james.b@email.com', 'Boston');


INSERT INTO Registrations VALUES
(1001, 1, 101, '2024-06-01', 299.99),
(1002, 1, 102, '2024-06-02', 299.99),
(1003, 2, 103, '2024-07-15', 149.99),
(1004, 3, 104, '2024-08-01', 399.99),
(1005, 2, 105, '2024-07-16', 149.99),
(1006, 4, 101, '2024-09-01', 199.99),
(1007, 3, 102, '2024-08-02', 399.99),
(1008, 5, 103, '2024-10-15', 99.99);

INSERT INTO Events VALUES
(6, 'Gaming Expo', '2024-12-20', 'Gaming Arena, Seattle', 'International Gaming Exhibition');

UPDATE Events 
SET Event_Location = 'Digital Convention Center, New York',
    Event_Description = 'Updated Technolnology Conference'
WHERE Event_Id = 1;

INSERT INTO Attendees VALUES
(106, 'Emma Davis', '555-0106', 'emma.d@email.com', 'Miami');

INSERT INTO Registrations VALUES
(1009, 2, 106, '2024-07-20', 149.99);

SELECT a.Attendee_Name, a.Attendee_Email, a.Attendee_City
FROM Attendees a
JOIN Registrations r ON a.Attendee_Id = r.Attendee_Id
WHERE r.Event_Id = 1;

SELECT e.Event_Name, COUNT(r.Attendee_Id) as Attendee_Count
FROM Events e
LEFT JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Id, e.Event_Name;

SELECT a.Attendee_Name, COUNT(DISTINCT r.Event_Id) as Event_Count
FROM Attendees a
JOIN Registrations r ON a.Attendee_Id = r.Attendee_Id
GROUP BY a.Attendee_Id, a.Attendee_Name
HAVING Event_Count > 1;