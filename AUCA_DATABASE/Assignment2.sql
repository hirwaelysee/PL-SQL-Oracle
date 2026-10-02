/*
    ===========================================
     TASK A1: Department Summary Query
     Student: Hirwa Elysee | ID: 29058
    ===========================================
    Approach:
       - I used a LEFT JOIN from DEPARTMENTS to EMPLOYEES to make sure departments 
         without staff (like English) still show up in the results.
       - For course counts, I used a correlated scalar subquery instead of joining COURSES 
         directly. If I joined COURSES on top of EMPLOYEES, it would create a Cartesian 
         product for departments having both, multiplying the employee rows by the 
         course rows and corrupting both COUNT and SUM calculations.
       - Used NVL to turn NULL counts and salary sums into 0, and ordered by total 
         salary bill descending.
       ============================================================================= */
select
    d.department_name,
    d.location,
    count(e.employee_id) as nber_of_employees,
    nvl(sum(e.salary),0) as total_salary_bill,
    nvl(round(avg(e.salary),2),0) as average_salary,
    (
        select count(*)
        from courses c 
        where c.department = d.department_name
    ) as nber_of_courses
from departments d
left join employees e 
    on d.department_name = e.department
group by d.department_name, d.location
order by nvl(sum(e.salary),0) desc;

/*
    =============================================================================
       TASK A1 (b): Over-Budget Departments Query
       Student: Hirwa Elysee | ID: 29058
       Approach:
       - Joined DEPARTMENTS with EMPLOYEES and grouped by department name and budget.
       - Filtered groups using HAVING SUM(e.salary) > d.budget to find departments
         spending more on salaries than their allocated budget.
       - Computed the difference using SUM(e.salary) - d.budget.
   =============================================================================
*/

select d.department_name,
d.budget,
sum(e.salary) as total_salary_bill,
(sum(e.salary)-d.budget) as over_budget_amount
from departments d
left join employees e
on d.department_name = e.department
group by d.department_name, d.budget
having sum(e.salary) > d.budget;

/* ========================== SECTION B =========================================*/

/* =============================================================================
       TASK B1: Variables and DBMS_OUTPUT
       Student: Hirwa Elysee | ID: 29058
       Approach:
       - Declared variables for course name, credits, semester start date, and a boolean.
       - Evaluated the boolean expression (v_credits >= 3).
       - Because DBMS_OUTPUT.PUT_LINE does not support native BOOLEAN types directly,
         I used a quick conditional expression to map TRUE/FALSE into a string for printing.
   ============================================================================= 
*/
       
set serveroutput on;
declare
    v_course_name varchar2(100);
    v_course_credits number;
    v_semester DATE;
    v_heavy_course varchar(20);
    
begin
    v_course_name := 'Database Management System';
    v_course_credits := 4;
    v_semester := TO_DATE ('01-SEP-24','DD-MON-RR');
    
    dbms_output.put_line('Course: ' || v_course_name);
    dbms_output.put_line('Credits: ' || v_course_credits);
    dbms_output.put_line('Semester Start: ' || v_semester);
    
    case
        when v_course_credits >= 3
            then v_heavy_course := 'TRUE';
        else 
            v_heavy_course := 'FALSE';
    end case;
    
end;
/

/* =============================================================================
   TASK B2: SELECT INTO with %TYPE
   Student: Hirwa Elysee | ID: 29058
   Approach:
   - Created variable types to the columns of the COURSES table using %TYPE.
   - Queried course_id 110 into the variables using SELECT INTO.
   - Added an IF condition to display 'Limited seats available!' if max_students <= 25.
   ============================================================================= 
*/
set serveroutput on;
declare
    v_course_name courses.course_name%TYPE;
    v_instructor courses.instructor%TYPE;
    v_credits courses.credits%TYPE;
    v_max_students courses.max_students%TYPE;
begin

    select course_name, instructor, credits, max_students
    into v_course_name, v_instructor, v_credits, v_max_students
    from courses
    where course_id = 110;
    
    dbms_output.put_line('Course Name: ' || v_course_name);
    dbms_output.put_line('Course Instructor: ' || v_instructor);
    dbms_output.put_line('Course Credits: ' || v_max_students);
    
    if v_max_students<=25 
        then dbms_output.put_line('Limited seats available!');
    end if;
end;
/

/* =============================================================================
       TASK B3: Full Record Fetch with %ROWTYPE
       Student: Hirwa Elysee | ID: 29058
       Approach:
       - Declared a single record variable v_emp using employees%ROWTYPE.
       - Retrieved the full row for employee_id 22.
       - Extracted hire year using EXTRACT(YEAR FROM v_emp.hire_date).
       - Calculated completed years of service using TRUNC(MONTHS_BETWEEN(SYSDATE, v_emp.hire_date) / 12).
   ============================================================================= 
*/

set serveroutput on;
declare
    v_emp employees%ROWTYPE;
begin
    select *
    into v_emp
    from employees
    where employee_id = 22;
    
    dbms_output.put_line('Employee ID: '|| v_emp.employee_id);
    dbms_output.put_line('Full Name: '|| v_emp.first_name || ' ' || v_emp.last_name);
    dbms_output.put_line('Email: '|| v_emp.email);
    dbms_output.put_line('Phone: '|| v_emp.phone);
    dbms_output.put_line('Hire Year: '|| extract(year from v_emp.hire_date));
    dbms_output.put_line('Job Title: '|| v_emp.job_title);    
    dbms_output.put_line('Years Worked at the University: '|| (extract(year from sysdate) - extract(year from  v_emp.hire_date)));
end;
/

/* ==================================== SECTION C: IF/ ELSEIF/ ELSE ================================= */

/*
    =============================================================================
       TASK C1: Employee Commission Checker (IF/ELSIF/ELSE)
       Student: Hirwa Elysee | ID: 29058
       Approach:
       - Fetched salary and commission_pct for employee_id 1.
       - Structured the IF/ELSIF ladder to strictly respect order and priority of conditions.
       - Computed total earnings safely with NVL(commission_pct, 0) to prevent NULL arithmetic issues.
    ============================================================================= 
*/

set serveroutput on;
declare
    v_commission_pct employees.commission_pct%TYPE;
    v_salary employees.salary%TYPE;
begin
    select commission_pct, salary 
    into v_commission_pct, v_salary
    from employees
    where employee_id = 1;
    
    if v_commission_pct is not null and v_salary>80000 
        then dbms_output.put_line('High-value manager with commission ' || '| ' ||'Potential Earning: ' ||(v_salary + (v_salary * NVL(v_commission_pct,0))));
    elsif v_commission_pct is not null and v_salary <= 80000
        then dbms_output.put_line('Manager with commission, standard tier ' || '| ' || 'Potential Earning: ' ||(v_salary + (v_salary * NVL(v_commission_pct,0))));
    elsif v_commission_pct is null and v_salary > 90000
        then dbms_output.put_line('Senior employee, consider adding a commission incentive ' || '| ' || 'Potential Earning: ' ||(v_salary + (v_salary * NVL(v_commission_pct,0))));
    else
         dbms_output.put_line('Standard employee profile');
    end if;
end;
/

/* =============================================================================
   TASK C2: Course Availability Check
   Student: Hirwa Elysee | ID: 29058
   Approach:
   - Queried course_id 103 to get course_name and max_students.
   - Queried the ENROLLMENTS table to count how many students are enrolled.
   - Evaluated capacity percentage tiers using an IF/ELSIF block.
   ============================================================================= */


set serveroutput on;

declare

    v_course_name courses.course_name%TYPE;
    v_current_enrollments number;
    v_max_students number;
    v_status varchar2(100);

begin
    select c.course_name, count(e.student_id) as current_enrollments, c.MAX_STUDENTS as maximum_capacity, e.STATUS into v_course_name, v_current_enrollments, v_max_students, v_status
    from ENROLLMENTS e
    left join COURSES c
    on e.COURSE_ID = c.COURSE_ID
    where e.COURSE_ID = 103
    group by c.course_name, c.MAX_STUDENTS, e.STATUS;

    if(v_current_enrollments < v_max_students*0.5)
        then v_status := 'Open, plenty of seats available';
    elsif (v_current_enrollments <= v_max_students*0.8 and v_current_enrollments >= v_max_students*0.5)
        then v_status := 'Filling up, limited seats';
    elsif (v_current_enrollments > v_max_students * 0.8 and v_current_enrollments< v_max_students)
        then v_status := 'Almost full, enroll soon';
    elsif (v_current_enrollments >= v_max_students)
        then v_status := 'FULL, enrollment closed';
    end if;

    DBMS_OUTPUT.PUT_LINE('Course Name: ' || v_course_name);
    DBMS_OUTPUT.PUT_LINE('Course Name: ' || v_current_enrollments);
    DBMS_OUTPUT.PUT_LINE('Course Name: ' || v_max_students);
    DBMS_OUTPUT.PUT_LINE('Course Name: ' || v_status);
end;
/


/*
    =============================================================================
        TASK C3: Student Age Check
        Student: Hirwa Elysee | ID: 29058
        Approach:
        - Fetched date_of_birth and enrollment_date for student_id 1020.
        - Calculated age in full years using TRUNC(MONTHS_BETWEEN(SYSDATE, date_of_birth) / 12).
        - Evaluated student age bracket using IF/ELSIF/ELSE.
        - Evaluated the enrollment cohort year in an independent IF statement.
    ============================================================================= 
*/


declare

    v_enrollment_year number;
    v_month number;
    v_status varchar2(100); 

begin

    select  extract(year from e.enrollment_date), trunc(MONTHS_BETWEEN(sysdate ,s.DATE_OF_BIRTH)/12) into  v_enrollment_year, v_month
    from ENROLLMENTS e
    inner join STUDENTS s
    on e.STUDENT_ID = s.STUDENT_ID
    where s.STUDENT_ID = 1020;


    if(v_month<18)
        then v_status := 'Minor student, parental consent required';
    elsif (v_month >= 18 and v_month <= 25)
        then v_status := 'Traditional student age';
    elsif (v_month > 25)
        then v_status := 'Mature student';
    end if;

    DBMS_OUTPUT.PUT_LINE('Calculated age: ' || v_month);
    DBMS_OUTPUT.PUT_LINE(v_status);

    if(v_enrollment_year = 2023)
        then DBMS_OUTPUT.PUT_LINE('First-year cohort ('|| v_enrollment_year || ')');
    else
        DBMS_OUTPUT.PUT_LINE('Joined in ['|| v_enrollment_year ||']');
    end if;
end;    
/

/* ================= SECTION D: CASE STATEMENTS AND EXPRESSIONS ===================== */

/* 
    =============================================================================
        TASK D1: Score to Grade Conversion (Searched CASE)
        Student: Hirwa Elysee | ID: 29058
        Approach:
        - Fetched score and stored grade for enrollment_id 5.
        - Used a searched CASE statement to convert numeric score ranges to letters.
        - Handled NULL scores first so that null evaluations do not fall through improperly.
        - Compared computed grade against stored grade.
    =============================================================================
*/


declare
    v_score enrollments.score%type;
    v_grade enrollments.grade%type;
    v_letter varchar2(50);
begin
    select score, grade into v_score, v_grade
    from ENROLLMENTS
    where ENROLLMENT_ID = 5;

    case
        when v_score>= 90
            then v_letter := 'A';
        when v_score>=80 and v_score<90
            then v_letter := 'B';
        when v_score>=70 and v_score<80
            then v_letter := 'C';
        when v_score>=60 and v_score<70
            then v_letter := 'D';
        when v_score<60
            then v_letter := 'F';
        when v_score is null
            then v_letter := 'Not yet graded';
    end case;

    DBMS_OUTPUT.PUT_LINE('Computed grade: ' || v_letter);

    if(v_letter = v_grade)
        then DBMS_OUTPUT.PUT_LINE('Grade match: YES');
    else
        DBMS_OUTPUT.PUT_LINE('Grade match: NO (stored ' || NVL(v_grade, 'NULL') || ', computed ' || v_letter || ')');
    end if;
end;
/


/* =============================================================================
   TASK D2: Department Building Codes (Simple CASE & Searched CASE Expression)
   Student: Hirwa Elysee | ID: 29058
   Approach:
   - Retrieved the Computer Science row from DEPARTMENTS.
   - Used a simple CASE statement on department_name to resolve the building code.
   - Used an inline CASE expression directly inside DBMS_OUTPUT to categorize the budget.
   ============================================================================= 
*/

set serveroutput on;
declare
    v_computer_science departments%ROWTYPE;
    v_status varchar2(100);
begin
    select * into v_computer_science
    from DEPARTMENTS
    where department_name = 'Computer Science';

    case
        when v_computer_science.department_name = 'Computer Science'
            then v_status := 'BLD-CS | ICT Wing';
        when v_computer_science.department_name = 'Mathematics'
            then v_status := 'BLD-MT | Science Wing';
        when v_computer_science.department_name = 'Business'
            then v_status := 'BLD-BS | Commerce Wing';
        when v_computer_science.department_name = 'Engineering'
            then v_status := 'BLD-EN | Technical Wing';
        when v_computer_science.department_name = 'Psychology'
            then v_status := 'BLD-PS | Humanities Wing';
        else
            v_status := 'BLD-GN | General Wing';
    end case;

    DBMS_OUTPUT.PUT_LINE('Department: ' || v_computer_science.department_name);
    DBMS_OUTPUT.PUT_LINE('Building Code: ' || v_status);

    case
        when v_computer_science.budget > 600000
            then DBMS_OUTPUT.PUT_LINE('Well Funded');
        when v_computer_science.budget >= 400000 and v_computer_science.budget <= 600000
            then DBMS_OUTPUT.PUT_LINE('Adequately Funded');
        when v_computer_science.budget < 400000
            then DBMS_OUTPUT.PUT_LINE('Underfunded');
    end case;

end;
/

/* =============================================================================
   TASK D3: Job Title Rank
   Student: Hirwa Elysee | ID: 29058
   Approach:
   - Fetched employee_id 14 details (Nina, Assistant Professor).
   - Used a searched CASE with exact checks and LIKE operators to assign rank number and title.
   - Checked promotion eligibility using an IF statement (rank <= 2 AND salary < 100000).
   ============================================================================= 
*/


declare
    v_row employees%ROWTYPE;
    v_category varchar2(50);
    v_rank number;
begin
    select * into v_row
    from EMPLOYEES
    where employee_id = 14;

    case
        when v_row.job_title = 'Full Professor'
            then v_rank := 1; v_category := 'Senior Academic';
        when v_row.job_title = 'Associate Professor'
            then v_rank := 2; v_category := 'Mid Academic';
        when v_row.job_title = 'Assistant Professor'
            then v_rank := 3; v_category := 'Junior Academic';
        when v_row.job_title like '%Developer%' or v_row.job_title like '%Engineer%'
            then v_rank := 4; v_category := 'Technical Staff';
        when v_row.job_title like '%Admin%' or v_row.job_title like '%Coordinator%'
            then v_rank := 5; v_category := 'Administrative Staff';
        else
            v_rank := 6; v_category := 'General Stuff';
    end case; 

    dbms_output.put_line('Employee name: '|| v_row.first_name || ' ' || v_row.last_name);
    dbms_output.put_line('Job Title: '|| v_row.job_title);
    dbms_output.put_line('Rank Number: '|| v_rank);
    dbms_output.put_line('Rank Title: '|| v_category);
    dbms_output.put_line('Salary: '|| v_row.salary);


    if v_rank >= 2 and v_row.salary > 100000
        then DBMS_OUTPUT.PUT_LINE('Promotion eligible');
    else
        dbms_output.put_line('Not eligible for promotion yet');
    end if;
end;
/

/*============================ Section E: LOOPS ======================================*/


/* =============================================================================
   TASK E1: Basic LOOP - Tuition Fee Calculator
   Student: Hirwa Elysee | ID: 29058
   Approach:
   - Configured tuition rate at 150,000 RWF per credit.
   - Started at course_id 101, querying each course sequentially inside a basic LOOP.
   - Updated running credits and tuition totals, printing progress per iteration.
   - Exited cleanly via EXIT WHEN v_total_credits >= 15.
   ============================================================================= */

declare
    v_tuition_fees number := 150000;
    v_course_id number := 101;
    v_course courses%ROWTYPE;
    v_credits_count number := 0;
begin
    loop 
        select * into v_course
        from COURSES
        where course_id = v_course_id;

        v_credits_count := v_credits_count + v_course.credits;
        
        DBMS_OUTPUT.PUT_LINE('Added: '|| v_course.course_name || ' (' || v_course.credits || ') |' || 'Total: '|| v_credits_count || ' credits | RWF '|| v_tuition_fees*v_course.credits);
        
        v_course_id := v_course_id + 1;

        exit when v_credits_count >= 15;
    end loop;
end;
/

/* =============================================================================
        TASK E2: WHILE Loop - Department Salary Report
        Student: Hirwa Elysee | ID: 29058
        Approach:
        - Used an explicit cursor with a WHILE cursor%FOUND loop.
        - Did the initial priming FETCH before entering the WHILE condition.
        - Tracked total employee count, aggregate salary, high/low earners, and highest paid staff.
        - Matched and verified output numbers directly against Task A1(a).
   ============================================================================= 
*/

declare
    cursor employee_cursor is
        select * from employees
        where department = 'Computer Science';

    v_employee employees%ROWTYPE;
    v_total_employees number := 0;
    v_total_salary number := 0;
    v_average_salary number;
    v_high_earners number := 0;
    v_low_earners number := 0;

    v_highest_name varchar2(50);
    v_highest_paid number :=0;
begin

    open employee_cursor; 

    fetch employee_cursor into v_employee;

    while employee_cursor%found loop

        v_total_salary := v_total_salary + v_employee.salary;
        v_total_employees := v_total_employees + 1;

        if(v_employee.salary > 75000)
            then v_high_earners := v_high_earners + 1;
        elsif (v_employee.salary < 65000)
            then v_low_earners := v_low_earners + 1;
        end if;

        if(v_employee.salary > v_highest_paid)
            then v_highest_paid := v_employee.salary; v_highest_name := v_employee.first_name || ' ' || v_employee.last_name;
        end if;

        fetch employee_cursor into v_employee;
    end loop;

    DBMS_OUTPUT.put_line('============== Computer Science Salary Report ==============');
    DBMS_OUTPUT.PUT_LINE('Total Employees: '|| v_total_employees);
    DBMS_OUTPUT.PUT_LINE('Total Salary: RWF '|| v_total_salary);
    DBMS_OUTPUT.PUT_LINE('Average Salary: RWF '|| v_total_salary/v_total_employees);
    DBMS_OUTPUT.PUT_LINE('High Earners: '|| v_high_earners);
    DBMS_OUTPUT.PUT_LINE('Low Earners: '|| v_low_earners);
    DBMS_OUTPUT.PUT_LINE('Highest Paid: '|| v_highest_name ||' - RWF '|| v_highest_paid);
    DBMS_OUTPUT.put_line('============================================================');
    
    close employee_cursor;
end;
/

--  select * from employees;

/* =============================================================================
   TASK E3: FOR Loop - Academic Performance Table
   Student: Hirwa Elysee | ID: 29058
   Approach:
   - Iterated over the student ID range 1001..1010 using a numeric FOR loop.
   - Fetched student names and GPAs from STUDENTS, and counted enrollments from ENROLLMENTS.
   - Evaluated academic standing and load category using searched CASE expressions.
   - Maintained running counters for each category to display summary statistics at the end.
   ============================================================================= 
*/

declare
    v_first_name varchar2(50);
    v_last_name varchar2(50);
    v_gpa number;
    v_enrollments_count number;
    v_class varchar2(50);
    v_status varchar2(50);

    v_count number := 0;
    v_count_one number:=0;
    v_count_two number:=0;
    v_count_three number:=0;
    v_count_four number:=0;
    v_count_five number:=0;
begin
    for id in 1001..1010 loop
        select s.first_name, s.last_name, s.gpa, count(e.enrollment_id)
        into v_first_name, v_last_name, v_gpa, v_enrollments_count
        from STUDENTS s
        left join ENROLLMENTS e
        on s.STUDENT_ID = e.STUDENT_ID
        where s.STUDENT_ID = id
        group by e.student_id, s.first_name, s.gpa, s.last_name;

        case 
            when v_gpa >= 3.9 
                then v_class := 'Summa Cum Laude'; v_count_one := v_count_one+1; 
            when v_gpa >= 3.7 and v_gpa < 3.9 
                then v_class := 'Magna Cum Laude'; v_count_two := v_count_two+1;
            when v_gpa >= 3.5 and v_gpa < 3.7
                then v_class := 'Cum Laude'; v_count_three := v_count_three+1;
            when v_gpa >= 3.0 and v_gpa < 3.5
                then v_class := 'Satisfactory'; v_count_four := v_count_four+1;
            when v_gpa < 3.0
                then v_class := 'Probation'; v_count_five := v_count_five+1;
        end case;

        case 
            when v_enrollments_count>=0 and v_enrollments_count <=1
                then v_status := 'Under-enrolled';
            when  v_enrollments_count>=2 and v_enrollments_count <=3
                then v_status := 'Normal Load';
            when  v_enrollments_count>=4
                then v_status := 'Full Load';
        end case;

        DBMS_OUTPUT.PUT_LINE('ID: '|| id ||' | ' || v_first_name || ' ' || v_last_name || ' GPA:' || v_gpa || ' | ' || v_class || ' | ' || v_status);
        
        v_count := v_count +1;
    end loop;
    DBMS_OUTPUT.PUT_LINE('=====================================');
    DBMS_OUTPUT.PUT_LINE('Total students processed: '|| v_count);
    DBMS_OUTPUT.PUT_LINE('Summa Cum Laude: '|| v_count_one);
    DBMS_OUTPUT.PUT_LINE('Magna Cum Laude '|| v_count_two);
    DBMS_OUTPUT.PUT_LINE('Cum Laude: '|| v_count_three);
    DBMS_OUTPUT.PUT_LINE('Satisfactory: '|| v_count_four);
    DBMS_OUTPUT.PUT_LINE('Probation: '|| v_count_five);
end;
/

/*=========================== Section F: Combined Challenge ============================= '*/

/* =============================================================================
   TASK F1: Combined Challenge - Employee Profile Report
   Student: Hirwa Elysee | ID: 29058
   Pay Grade Ranges Designed:
   - Grade 5: Salary >= 90,000 (Executive / Senior Academic)
   - Grade 4: 75,000 <= Salary < 90,000 (Senior Specialist / Engineer)
   - Grade 3: 65,000 <= Salary < 75,000 (Mid-level Staff)
   - Grade 2: 50,000 <= Salary < 65,000 (Junior Staff / Associates)
   - Grade 1: Salary < 50,000 (Entry / Support Staff)

   Approach:
   - Fetched Tom Engineer (ID 5) with %ROWTYPE, computed service years,
     and classified service status via IF/ELSIF/ELSE.
   - Computed Pay Grade using a searched CASE on salary ranges. Evaluated raise
     recommendation (years > 3 AND salary < 85,000).
   - Used these ranges to classify the pay grade
        0 - 20,000 :pay_grade -> 1
        20,001 - 40,000 :pay_grade -> 2
        40,001 - 60,000 :pay_grade -> 3
        60,001 - 80,000 :pay_grade -> 4
        80,001 - 105,000 :pay_grade -> 5
   - Ran a cursor FOR loop over colleagues in Tom's department (excluding Tom)
     to track peer count, peak department salary, and count peers earning more than Tom.
   - Displayed output strictly following the assignment's visual template.
   =============================================================================
*/

declare 
    v_employee employees%ROWTYPE;
    v_service_status varchar2(50);
    v_years_of_service number;

    v_pay_grade number;
    v_raise_status varchar2(50);
    v_proposed_salary number;

    v_dept_colleagues number :=0;
    v_dept_highest_salary number :=0;
    v_nber_colleagues_earning_more number := 0;
begin 
    select * into v_employee
    from employees
    where employee_id = 5;

    v_years_of_service := months_between(sysdate, v_employee.hire_date) / 12;

    if(v_years_of_service< 2)
        then v_service_status := 'Probation';
    elsif (v_years_of_service >= 2 and v_years_of_service <= 5)
        then v_service_status := 'Confirmed';
    elsif (v_years_of_service > 5)
        then v_service_status := 'Senior Staff';
    end if;

    /*
        0 - 20,000 :pay_grade -> 1
        20,001 - 40,000 :pay_grade -> 2
        40,001 - 60,000 :pay_grade -> 3
        60,001 - 80,000 :pay_grade -> 4
        80,001 - 105,000 :pay_grade -> 5
    */
    if(v_employee.salary>=0 and v_employee.salary<=20000)
        then v_pay_grade:= 1;
    elsif(v_employee.salary>=20001 and v_employee.salary<=40000)
        then v_pay_grade:= 2; 
    elsif(v_employee.salary>=40001 and v_employee.salary<=60000)
        then v_pay_grade:= 3; 
    elsif(v_employee.salary>=60001 and v_employee.salary<=80000)
        then v_pay_grade:= 4; 
    elsif(v_employee.salary>=80001 and v_employee.salary<=105000)
        then v_pay_grade:= 5; 
    end if;
    case 
        when v_years_of_service > 3 and v_employee.salary < 85000
            then v_raise_status := 'Raise recommended'; v_proposed_salary := v_employee.salary * 1.10;
        else
            v_raise_status := 'No raise due';
            v_proposed_salary := 0;
    end case; 

    for employee in (
        select * 
        from EMPLOYEES
        where department = 'Computer Science' and first_name != 'Tom'
    ) loop
    
    
    
    if(employee.salary > v_dept_highest_salary) 
        then v_dept_highest_salary := employee.salary;
    end if;

    v_dept_colleagues := v_dept_colleagues + 1;

    if(employee.salary > v_employee.salary)
        then v_nber_colleagues_earning_more := v_nber_colleagues_earning_more+1 ;
    end if;

    end loop;

    dbms_output.put_line('==================================');
    DBMS_OUTPUT.PUT_LINE('  EMPLOYEE PROFILE REPORT  ');
    DBMS_OUTPUT.PUT_LINE('  AUCA Staff Records System  ');
    dbms_output.put_line('========================================');

    DBMS_OUTPUT.put_line('Employee: '|| v_employee.first_name || ' ' || v_employee.last_name || '(ID: ' || v_employee.employee_id || ')');
    dbms_output.put_line('Department: '|| v_employee.department);
    dbms_output.put_line('Job Title: '|| v_employee.job_title);
    dbms_output.put_line('Hire Date: '|| v_employee.hire_date || ' | ' ||'Years of Service: '|| round(v_years_of_service,1));
    dbms_output.put_line('Service Status: '|| v_service_status);

    dbms_output.put_line('-----------------------------------------');

    dbms_output.PUT_LINE('Salary: RWF '|| v_employee.salary || ' | Pay Grade: '||v_pay_grade);
    dbms_output.put_line('Raise Status: '|| v_raise_status);
    dbms_output.put_line('Proposed Salary: RWF '|| v_proposed_salary);

    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('Dept. Colleagues: '|| v_dept_colleagues);
    dbms_output.put_line('Dept. Highest Salary: RWF '|| v_dept_highest_salary);
    dbms_output.put_line('Colleagues Earning More: '|| v_nber_colleagues_earning_more);  
end;
/

/*=========================== SQL ============================= '*/

/* =============================================================================
        TASK: Retrieving same data as E2 using sql
        Student: Hirwa Elysee | ID: 29058

        Approach:
        - Used aggregate functions for the salary statistics.
        - Used SUM(CASE) to count high and low earners.
        - Used a subquery with MAX(salary) to find the highest-paid employee.
   =============================================================================
*/

select 
    total_employees,
    total_salary_bill,
    average_salary,
    high_earners,
    low_earners,
    (select first_name ||' '||last_name from employees where department='Computer Science' and salary = highest_paid) as highest_paid_employee,
    highest_paid
    from (
        select 
            count(employee_id) as total_employees,
            sum(salary) as total_salary_bill,
            round(avg(salary),2) as average_salary,

            sum(
                case
                when salary>75000 then 1
                else 0
                end
                ) as high_earners,
            sum(
                case
                when salary <65000 then 1
                else 0
            end) as low_earners,
            max(salary) as highest_paid
        from employees
        where department = 'Computer Science'
);