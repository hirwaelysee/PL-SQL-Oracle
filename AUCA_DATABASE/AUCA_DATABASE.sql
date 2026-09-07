--CREATION OF STUDENTS TABLE.
CREATE TABLE students ( student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL, 
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE, phone VARCHAR2(20),
    date_of_birth DATE, enrollment_date DATE DEFAULT SYSDATE,
    gpa NUMBER(3,2) CHECK (gpa BETWEEN 0 AND 4),
    status VARCHAR2(20) DEFAULT 'Active'
); 
CREATE SEQUENCE student_seq START WITH 1001 INCREMENT BY 1;

--INSERTING DATA IN THE STUDENTS TABLE.
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Alice', 'Johnson', 'alice.j@email.com', '111-0001', DATE '2003-05-15', DATE '2023-09-01', 3.8, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Bob', 'Smith', 'bob.s@email.com', '1110002', DATE '2004-03-22', DATE '2023-09-01', 3.2, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Carol', 'White', 'carol.w@email.com', '111-0003', DATE '2003-11-08', DATE '2024-01-15', 3.5, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'David', 'Green', 'david.g@email.com', '111-0004', DATE '2004-07-30', DATE '2024-01-15', 2.9, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Emma', 'Davis', 'emma.d@email.com', '111-0005', DATE '2003-12-12', DATE '2024-09-01', 3.9, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Frank', 'Miller', 'frank.m@email.com', '111-0006', DATE '2004-02-18', DATE '2023-09-01', 3.4, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Grace', 'Wilson', 'grace.w@email.com', '111-0007', DATE '2003-09-25', DATE '2023-09-01', 3.7, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Henry', 'Moore', 'henry.m@email.com', '111-0008', DATE '2004-06-14', DATE '2024-01-15', 3.1, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Ivy', 'Taylor', 'ivy.t@email.com', '1110009', DATE '2003-04-03', DATE '2024-09-01', 3.6, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Jack', 'Anderson', 'jack.a@email.com', '111-0010', DATE '2004-10-27', DATE '2023-09-01', 2.8, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Kate', 'Thomas', 'kate.t@email.com', '111-0011', DATE '2003-08-19', DATE '2023-09-01', 3.9, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Leo', 'Jackson', 'leo.j@email.com', '111-0012', DATE '2004-01-11', DATE '2024-01-15', 3.3, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Mia', 'Martin', 'mia.m@email.com', '1110013', DATE '2003-07-23', DATE '2024-09-01', 3.8, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Noah', 'Lee', 'noah.l@email.com', '1110014', DATE '2004-05-06', DATE '2023-09-01', 3.0, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Olivia', 'Perez', 'olivia.p@email.com', '111-0015', DATE '2003-12-29', DATE '2023-09-01', 3.7, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Paul', 'Thompson', 'paul.t@email.com', '111-0016', DATE '2004-09-15', DATE '2024-01-15', 2.7, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Quinn', 'Garcia', 'quinn.g@email.com', '111-0017', DATE '2003-06-08', DATE '2024-09-01', 3.5, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Ryan', 'Martinez', 'ryan.m@email.com', '111-0018', DATE '2004-11-21', DATE '2023-09-01', 3.2, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Sara', 'Robinson', 'sara.r@email.com', '111-0019', DATE '2003-03-14', DATE '2023-09-01', 3.9, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Tom', 'Clark', 'tom.c@email.com', '1110020', DATE '2004-08-07', DATE '2024-01-15', 3.1, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Uma', 'Rodriguez', 'uma.r@email.com', '111-0021', DATE '2003-10-30', DATE '2024-09-01', 3.6, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Victor', 'Lewis', 'victor.l@email.com', '111-0022', DATE '2004-04-24', DATE '2023-09-01', 2.9, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Wendy', 'Walker', 'wendy.w@email.com', '111-0023', DATE '2003-02-17', DATE '2023-09-01', 3.8, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Xavier', 'Hall', 'xavier.h@email.com', '111-0024', DATE '2004-07-11', DATE '2024-01-15', 3.3, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Yara', 'Allen', 'yara.a@email.com', '111-0025', DATE '2003-09-04', DATE '2024-09-01', 3.7, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Zack', 'Young', 'zack.y@email.com', '111-0026', DATE '2004-12-28', DATE '2023-09-01', 3.0, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Amy', 'King', 'amy.k@email.com', '1110027', DATE '2003-05-20', DATE '2023-09-01', 3.5, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Ben', 'Wright', 'ben.w@email.com', '1110028', DATE '2004-11-13', DATE '2024-01-15', 2.8, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Chloe', 'Lopez', 'chloe.l@email.com', '111-0029', DATE '2003-08-06', DATE '2024-09-01', 3.9, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Dan', 'Hill', 'dan.h@email.com', '1110030', DATE '2004-03-29', DATE '2023-09-01', 3.2, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Ella', 'Scott', 'ella.s@email.com', '111-0031', DATE '2003-07-22', DATE '2023-09-01', 3.7, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Finn', 'Green', 'finn.g@email.com', '111-0032', DATE '2004-10-15', DATE '2024-01-15', 3.1, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Gina', 'Adams', 'gina.a@email.com', '111-0033', DATE '2003-06-08', DATE '2024-09-01', 3.6, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Hugo', 'Baker', 'hugo.b@email.com', '111-0034', DATE '2004-02-01', DATE '2023-09-01', 2.9, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Iris', 'Gonzalez', 'iris.g@email.com', '111-0035', DATE '2003-12-24', DATE '2023-09-01', 3.8, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Jake', 'Nelson', 'jake.n@email.com', '111-0036', DATE '2004-09-17', DATE '2024-01-15', 3.3, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Kara', 'Carter', 'kara.c@email.com', '111-0037', DATE '2003-04-10', DATE '2024-09-01', 3.7, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Liam', 'Mitchell', 'liam.m@email.com', '111-0038', DATE '2004-08-03', DATE '2023-09-01', 3.0, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Maya', 'Perez', 'maya.p@email.com', '111-0039', DATE '2003-11-26', DATE '2023-09-01', 3.5, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Nick', 'Roberts', 'nick.r@email.com', '111-0040', DATE '2004-05-19', DATE '2024-01-15', 2.8, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Opal', 'Turner', 'opal.t@email.com', '111-0041', DATE '2003-10-12', DATE '2024-09-01', 3.9, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Pete', 'Phillips', 'pete.p@email.com', '111-0042', DATE '2004-06-05', DATE '2023-09-01', 3.2, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Queenie', 'Campbell', 'queenie.c@email.com', '111-0043', DATE '2003-03-28', DATE '2023-09-01', 3.7, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Ron', 'Parker', 'ron.p@email.com', '1110044', DATE '2004-07-21', DATE '2024-01-15', 3.1, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Sophia', 'Evans', 'sophia.e@email.com', '111-0045', DATE '2003-09-14', DATE '2024-09-01', 3.6, 'Active');
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Tyler', 'Edwards', 'tyler.e@email.com', '111-0046', DATE '2004-12-07', DATE '2023-09-01', 2.9, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Unity', 'Collins', 'unity.c@email.com', '111-0047', DATE '2003-02-28', DATE '2023-09-01', 3.8, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Vince', 'Stewart', 'vince.s@email.com', '111-0048', DATE '2004-04-21', DATE '2024-01-15', 3.3, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Willow', 'Sanchez', 'willow.s@email.com', '111-0049', DATE '2003-08-14', DATE '2024-09-01', 3.7, 'Active'); 
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Xander', 'Morris', 'xander.m@email.com', '111-0050', DATE '2004-11-07', DATE '2023-09-01', 3.0, 'Active');
COMMIT; 

select * from students;

-- creation of courses table.
CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100) NOT NULL,
    course_code VARCHAR2(10) UNIQUE,
    credits NUMBER(1) CHECK (credits BETWEEN 1 AND 5),
    instructor VARCHAR2(50),
    department VARCHAR2(50),
    max_students NUMBER DEFAULT 30, 
    semester VARCHAR2(20) 
);

CREATE SEQUENCE course_seq START WITH 101 INCREMENT BY 1; 

-- inserting data into the courses table.
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Introduction to Programming', 'CS101', 3, 'Dr. Johnson', 'Computer Science', 35, 'Fall 2024');
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Database Management Systems', 'CS201', 4, 'Dr. Smith', 'Computer Science', 30, 'Fall 2024');
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'PL/SQL Programming', 'CS202', 3, 'Dr. Brown', 'Computer Science', 25, 'Fall 2024'); 
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Data Structures', 'CS301', 4, 'Dr. Wilson', 'Computer Science', 30, 'Fall 2024'); 
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Web Development', 'CS302', 3, 'Dr. Davis', 'Computer Science', 35, 'Fall 2024');
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Algorithms', 'CS401', 4, 'Dr. Miller', 'Computer Science', 25, 'Fall 2024'); 
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Software Engineering', 'CS402', 3, 'Dr. Garcia', 'Computer Science', 30, 'Fall 2024');
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Computer Networks', 'CS403', 3, 'Dr. Martinez', 'Computer Science', 28, 'Fall 2024'); 
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Operating Systems', 'CS404', 4, 'Dr. Anderson', 'Computer Science', 30, 'Fall 2024');
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Machine Learning', 'CS501', 4, 'Dr. Thomas', 'Computer Science', 20, 'Fall 2024'); 
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Calculus I', 'MATH101', 4, 'Dr. Taylor', 'Mathematics', 40, 'Fall 2024'); 
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Linear Algebra', 'MATH201', 3, 'Dr. Moore', 'Mathematics', 35, 'Fall 2024');
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Business Communication', 'BUS101', 3, 'Dr. Jackson', 'Business', 40, 'Fall 2024'); 
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'Introduction to Psychology', 'PSY101', 3, 'Dr. White', 'Psychology', 45, 'Fall 2024');
INSERT INTO courses VALUES (course_seq.NEXTVAL, 'English Composition', 'ENG101', 3, 'Dr. Martin', 'English', 35, 'Fall 2024');

COMMIT;

--creation of enrollments table.
CREATE TABLE enrollments (
    enrollment_id NUMBER PRIMARY KEY, 
    student_id NUMBER REFERENCES students(student_id),
    course_id NUMBER REFERENCES courses(course_id), 
    enrollment_date DATE DEFAULT SYSDATE, grade VARCHAR2(2),
    score NUMBER(5,2), status VARCHAR2(20) DEFAULT 'Active',
    UNIQUE(student_id, course_id)
); 

CREATE SEQUENCE enrollment_seq START WITH 1 INCREMENT BY 1;

--inserting data into enrollments table
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1001, 101, DATE '2024-09-02', 'A', 92.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1001, 102, DATE '2024-09-02', 'A', 88.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1001, 103, DATE '2024-09-02', NULL, NULL, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1002, 101, DATE '2024-09-03', 'B', 82.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1002, 104, DATE '2024-09-03', 'B', 80.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1003, 102, DATE '2024-09-03', 'A', 90.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1003, 103, DATE '2024-09-03', NULL, NULL, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1004, 103, DATE '2024-09-04', 'C', 72.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1004, 105, DATE '2024-09-04', 'B', 85.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1005, 101, DATE '2024-09-04', 'A', 95.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1005, 102, DATE '2024-09-04', 'A', 93.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1006, 104, DATE '2024-09-05', 'B', 84.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1006, 106, DATE '2024-09-05', 'B', 81.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1007, 103, DATE '2024-09-05', 'A', 89.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1007, 107, DATE '2024-09-05', NULL, NULL, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1008, 101, DATE '2024-09-06', 'B', 78.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1008, 108, DATE '2024-09-06', 'C', 75.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1009, 105, DATE '2024-09-06', 'A', 91.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1009, 109, DATE '2024-09-06', NULL, NULL, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1010, 102, DATE '2024-09-07', 'C', 70.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1011, 103, DATE '2024-09-07', 'A', 94.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1012, 101, DATE '2024-09-08', 'B', 83.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1013, 102, DATE '2024-09-08', 'A', 92.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1014, 104, DATE '2024-09-09', 'B', 79.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1015, 105, DATE '2024-09-09', 'A', 90.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1016, 106, DATE '2024-09-10', 'C', 71.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1017, 103, DATE '2024-09-10', 'B', 86.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1018, 107, DATE '2024-09-11', 'B', 82.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1019, 108, DATE '2024-09-11', 'A', 93.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1020, 101, DATE '2024-09-12', 'B', 80.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1021, 102, DATE '2024-09-12', 'A', 88.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1022, 103, DATE '2024-09-13', 'B', 81.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1023, 104, DATE '2024-09-13', 'A', 91.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1024, 105, DATE '2024-09-14', 'B', 83.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1025, 106, DATE '2024-09-14', 'A', 89.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1026, 107, DATE '2024-09-15', 'C', 74.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1027, 108, DATE '2024-09-15', 'B', 85.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1028, 109, DATE '2024-09-16', 'C', 73.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1029, 110, DATE '2024-09-16', 'A', 94.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1030, 101, DATE '2024-09-17', 'B', 82.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1031, 102, DATE '2024-09-17', 'A', 90.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1032, 103, DATE '2024-09-18', 'B', 84.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1033, 104, DATE '2024-09-18', 'A', 87.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1034, 105, DATE '2024-09-19', 'C', 76.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1035, 106, DATE '2024-09-19', 'A', 92.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1036, 107, DATE '2024-09-20', 'B', 85.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1037, 108, DATE '2024-09-20', 'A', 88.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1038, 109, DATE '2024-09-21', 'B', 80.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1039, 110, DATE '2024-09-21', 'A', 93.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1040, 101, DATE '2024-09-22', 'C', 72.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1041, 111, DATE '2024-09-22', 'A', 95.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1042, 112, DATE '2024-09-23', 'B', 81.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1043, 113, DATE '2024-09-23', 'A', 89.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1044, 114, DATE '2024-09-24', 'B', 83.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1045, 115, DATE '2024-09-24', 'A', 91.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1046, 101, DATE '2024-09-25', 'C', 75.0, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1047, 102, DATE '2024-09-25', 'B', 86.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1048, 103, DATE '2024-09-26', 'A', 92.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1049, 104, DATE '2024-09-26', 'B', 84.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1050, 105, DATE '2024-09-27', 'A', 90.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1001, 111, DATE '2024-09-28', 'B', 85.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1002, 112, DATE '2024-09-28', 'A', 88.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1003, 113, DATE '2024-09-29', 'B', 82.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1004, 114, DATE '2024-09-29', 'C', 74.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1005, 115, DATE '2024-09-30', 'A', 94.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1006, 101, DATE '2024-09-30', 'B', 83.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1007, 111, DATE '2024-10-01', 'A', 91.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1008, 112, DATE '2024-10-01', 'B', 79.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1009, 113, DATE '2024-10-02', 'A', 87.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1010, 114, DATE '2024-10-02', 'C', 71.0, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1011, 115, DATE '2024-10-03', 'A', 93.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1012, 102, DATE '2024-10-03', 'B', 86.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1013, 103, DATE '2024-10-04', 'A', 89.5, 'Active'); 
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1014, 111, DATE '2024-10-04', 'B', 84.5, 'Active');
INSERT INTO enrollments VALUES (enrollment_seq.NEXTVAL, 1015, 112, DATE '2024-10-05', 'A', 92.0, 'Active');

COMMIT; 

-- creation of employees table.
CREATE TABLE employees ( 
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100), phone VARCHAR2(20),
    hire_date DATE, job_title VARCHAR2(50),
    salary NUMBER(10,2), commission_pct NUMBER(2,2),
    department VARCHAR2(50), manager_id NUMBER REFERENCES employees(employee_id)
); 

CREATE SEQUENCE employee_seq START WITH 1 INCREMENT BY 1;

--inserting data into employees table.
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'John', 'Manager', 'john.m@company.com', '555-1001', DATE '2018-01-15', 'Department Head', 85000, 0.05, 'Computer Science', NULL);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Sarah', 'Developer', 'sarah.d@company.com', '555-1002', DATE '2019-03-20', 'Senior Developer', 75000, NULL, 'Computer Science', 1);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Mike', 'Analyst', 'mike.a@company.com', '555-1003', DATE '2020-06-10', 'Data Analyst', 65000, NULL, 'Computer Science', 1); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Lisa', 'Designer', 'lisa.d@company.com', '555-1004', DATE '2021-02-01', 'UI/UX Designer', 70000, NULL, 'Computer Science', 1);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Tom', 'Engineer', 'tom.e@company.com', '555-1005', DATE '2019-09-15', 'Software Engineer', 80000, NULL, 'Computer Science', 1); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Emma', 'Coordinator', 'emma.c@company.com', '555-1006', DATE '2020-11-20', 'Project Coordinator', 60000, NULL, 'Business', NULL);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'David', 'Professor', 'david.p@company.com', '555-1007', DATE '2015-08-01', 'Associate Professor', 95000, NULL, 'Mathematics', NULL);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Anna', 'Researcher', 'anna.r@company.com', '555-1008', DATE '2021-05-10', 'Research Assistant', 55000, NULL, 'Psychology', NULL); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Robert', 'Admin', 'robert.a@company.com', '555-1009', DATE '2017-12-05', 'Administrative Officer', 50000, NULL, 'Business', 6); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Julia', 'Technician', 'julia.t@company.com', '555-1010', DATE '2022-03-15', 'Lab Technician', 48000, NULL, 'Engineering', NULL);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Kevin', 'Developer', 'kevin.d@company.com', '555-1011', DATE '2020-07-20', 'Junior Developer', 62000, NULL, 'Computer Science', 2); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Maria', 'Designer', 'maria.d@company.com', '555-1012', DATE '2021-09-10', 'Graphic Designer', 58000, NULL, 'Business', 6); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Chris', 'Analyst', 'chris.a@company.com', '555-1013', DATE '2019-04-25', 'Business Analyst', 68000, NULL, 'Business', 6); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Nina', 'Professor', 'nina.p@company.com', '555-1014', DATE '2016-01-30', 'Assistant Professor', 88000, NULL, 'Mathematics', 7); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Paul', 'Engineer', 'paul.e@company.com', '555-1015', DATE '2020-10-05', 'Mechanical Engineer', 72000, NULL, 'Engineering', NULL); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Rachel', 'Counselor', 'rachel.c@company.com', '555-1016', DATE '2018-06-15', 'Career Counselor', 54000, NULL, 'Psychology', 8); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Steve', 'Coordinator', 'steve.c@company.com', '555-1017', DATE '2022-01-20', 'Events Coordinator', 52000, NULL, 'Business', 6); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Olivia', 'Developer', 'olivia.d@company.com', '555-1018', DATE '2021-08-12', 'Full Stack Developer', 78000, NULL, 'Computer Science', 2); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Brian', 'Researcher', 'brian.r@company.com', '555-1019', DATE '2019-11-08', 'Senior Researcher', 82000, NULL, 'Psychology', 8); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Sophie', 'Admin', 'sophie.a@company.com', '555-1020', DATE '2020-02-14', 'HR Administrator', 56000, NULL, 'Business', 9);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Daniel', 'Technician', 'daniel.t@company.com', '555-1021', DATE '2021-07-22', 'IT Technician', 51000, NULL, 'Computer Science', 1); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Amy', 'Professor', 'amy.p@company.com', '555-1022', DATE '2014-03-10', 'Full Professor', 102000, NULL, 'Computer Science', NULL); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'George', 'Engineer', 'george.e@company.com', '555-1023', DATE '2020-09-18', 'Electrical Engineer', 76000, NULL, 'Engineering', 15); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Helen', 'Coordinator', 'helen.c@company.com', '555-1024', DATE '2022-05-30', 'Marketing Coordinator', 59000, NULL, 'Business', 6);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Ian', 'Developer', 'ian.d@company.com', '555-1025', DATE '2021-12-01', 'Backend Developer', 73000, NULL, 'Computer Science', 2);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Jessica', 'Analyst', 'jessica.a@company.com', '555-1026', DATE '2020-04-15', 'Financial Analyst', 67000, NULL, 'Business', 13); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Kyle', 'Researcher', 'kyle.r@company.com', '555-1027', DATE '2019-08-22', 'Research Scientist', 85000, NULL, 'Engineering', 15);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Laura', 'Professor', 'laura.p@company.com', '555-1028', DATE '2017-05-12', 'Associate Professor', 91000, NULL, 'Psychology', NULL); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Mark', 'Admin', 'mark.a@company.com', '555-1029', DATE '2021-10-25', 'Office Administrator', 49000, NULL, 'Mathematics', 7); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Nancy', 'Designer', 'nancy.d@company.com', '555-1030', DATE '2022-02-08', 'Web Designer', 64000, NULL, 'Computer Science', 4); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Oscar', 'Developer', 'oscar.d@company.com', '555-1031', DATE '2020-12-15', 'Mobile Developer', 74000, NULL, 'Computer Science', 2); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Patricia', 'Engineer', 'patricia.e@company.com', '555-1032', DATE '2019-06-20', 'Civil Engineer', 77000, NULL, 'Engineering', 15);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Quinn', 'Analyst', 'quinn.a@company.com', '555-1033', DATE '2021-03-18', 'Systems Analyst', 66000, NULL, 'Computer Science', 3); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Rita', 'Coordinator', 'rita.c@company.com', '555-1034', DATE '2022-07-12', 'Student Services Coordinator', 53000, NULL, 'Psychology', 8);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Sam', 'Technician', 'sam.t@company.com', '555-1035', DATE '2020-05-25', 'Network Technician', 52000, NULL, 'Computer Science', 21); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Tina', 'Professor', 'tina.p@company.com', '555-1036', DATE '2015-11-08', 'Full Professor', 98000, NULL, 'Mathematics', NULL);
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Umar', 'Developer', 'umar.d@company.com', '555-1037', DATE '2021-04-22', 'DevOps Engineer', 79000, NULL, 'Computer Science', 2); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Vera', 'Researcher', 'vera.r@company.com', '555-1038', DATE '2019-09-30', 'Lab Researcher', 60000, NULL, 'Engineering', 27); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Walter', 'Admin', 'walter.a@company.com', '555-1039', DATE '2020-08-14', 'Facilities Administrator', 47000, NULL, 'Business', 9); 
INSERT INTO employees VALUES (employee_seq.NEXTVAL, 'Yasmin', 'Designer', 'yasmin.d@company.com', '555-1040', DATE '2022-06-05', 'Product Designer', 71000, NULL, 'Computer Science', 4); 

COMMIT;

--creation of departments table.
CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY, 
    department_name VARCHAR2(50) NOT NULL, 
    manager_id NUMBER, location VARCHAR2(50),
    budget NUMBER(12,2)
); 

CREATE SEQUENCE dept_seq START WITH 10 INCREMENT BY 10; 

--inserting data into departments table.
INSERT INTO departments VALUES (dept_seq.NEXTVAL, 'Computer Science', 1, 'Building A - Floor 3', 750000);
INSERT INTO departments VALUES (dept_seq.NEXTVAL, 'Mathematics', 7, 'Building B - Floor 2', 450000); 
INSERT INTO departments VALUES (dept_seq.NEXTVAL, 'Business', 6, 'Building C - Floor 1', 550000); 
INSERT INTO departments VALUES (dept_seq.NEXTVAL, 'Engineering', 15, 'Building D - Floor 4', 800000); 
INSERT INTO departments VALUES (dept_seq.NEXTVAL, 'Psychology', 8, 'Building E - Floor 2', 400000); 
INSERT INTO departments VALUES (dept_seq.NEXTVAL, 'English', NULL, 'Building F - Floor 1', 300000); 

COMMIT; 

select * from courses;
select * from departments;
select * from employees;
select * from enrollments;
select * from students;