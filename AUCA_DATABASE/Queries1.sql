-- This file contains exercises queries to make understand what was learnt on 08/09/2026.

-- 1. Select Basics

select * from students;

select first_name, last_name, gpa 
from STUDENTS;

select course_name, course_code, credits
from COURSES;

select * from EMPLOYEES;

select employee_id, first_name, job_title, department
from EMPLOYEES;

select enrollment_id, student_id, course_id, grade
from ENROLLMENTS;

-- 2. Alias, Calculated Columns and String concatenations.

select first_name || ' ' || last_name as full_name
from EMPLOYEES;

select first_name || ' ' || last_name as full_name, salary*12 as annual_salary
from EMPLOYEES;

select first_name || ' ' || email as student_contact 
from STUDENTS;

select employee_id, job_title, salary*0.10 as bonus_amount
from EMPLOYEES;

select course_code || ' - ' || course_name as course_full_info
from COURSES;

select student_id, gpa+0.20 as target_gpa 
from STUDENTS;

-- 3. Handling null values (IS NULL, NOT NULL, NVL)

select * 
from EMPLOYEES 
where COMMISSION_PCT is null;

select * 
from EMPLOYEES
where manager_id is not null;

select EMPLOYEE_ID,
FIRST_NAME,
LAST_NAME,
nvl(COMMISSION_PCT,0) as commission_pct 
from EMPLOYEES;

select * 
from enrollments
where grade is null;

select * 
from DEPARTMENTS
where manager_id is null;

select enrollment_id, student_id, course_id,
enrollment_date, nvl(grade, 0) as grade
from ENROLLMENTS;

-- 4. WHERE Clause Basics

select * 
from STUDENTS
where status = 'Active';

select * 
from COURSES 
where department = 'Computer Science';

select * 
from EMPLOYEES
where department = 'Business';

select * 
from ENROLLMENTS
where score>90.0;

select * 
from DEPARTMENTS
where LOCATION = 'Building A - Floor 3';

select * 
from STUDENTS 
where ENROLLMENT_DATE = DATE '2023-09-01';

-- 5. Comparison Operators (=, <>, !=, >, <, >=, <=)
