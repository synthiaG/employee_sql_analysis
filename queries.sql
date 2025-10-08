
-- Show all columns from the Departments table.
select * from Departments;

-- Show all columns from the job_history table.
select * from job_history;

-- Show all columns from the jobS table.
select * from jobs;

-- Show all columns from the locations table.
select * from locations;

-- Show all columns from the Employees table.
select * from Employees;

-- Show all columns from the Departments table.
select * from Departments;





-- Display only the first name, last name, and salary of employees.
select F_NAME as FirstName,L_NAME As lastName ,SALARY from Employees;

-- List employees who earn more than 70,000.
select * from Employees
where salary >70000;

-- find employees who work in department 5

select * from Employees
where DEPT_ID = 5;

-- Show all distinct job IDs from Employees

select distinct JOB_ID from Employees;

-- Count how many employees are in each department

select DEPT_ID,count(*) as Employees_Count  from Employees
group by DEPT_ID;

-- Find the average salary per department.

select DEPT_ID, avg(salary) as Avg_Salary from Employees
group by DEPT_ID;

-- Retrieve employees whose last name starts with “J”.

select * from Employees
where L_NAME like "J%";

-- List employees ordered by salary (highest to lowest).

select * from Employees
order by SALARY desc;

-- Show all employees hired (in JOB_HISTORY) after 2010-01-01.

select * from  JOB_HISTORY
where  START_DATE > '2010-01-01';

-- List employees along with their job title from the Jobs table.

select F_NAME as FirstName,
L_NAME as LastName,
JOB_TITLE  
from Employees E
inner join  JOBS J on J.JOB_ID=E.JOB_ID;

-- Show employee name, department name, and location ID

select F_NAME as FirstName,
L_NAME as LastName, 
DEP_NAME as Department_Name, 
LOCT_ID as Location_ID  
from Employees E
inner join DEPARTMENTS  D on E.DEPT_ID = D.DEPT_ID_DEP
inner join LOCATIONS L on D.LOC_ID = L.LOCT_ID;

-- Find employees and their managers’ names
select 
    E1.F_NAME as Employee_FirstName,
    E1.L_NAME as Employee_LastName,
    E2.F_NAME as Manager_FirstName,
    E2.L_NAME as Manager_LastName
from Employees E1
left join Employees E2 
    on E1.MANAGER_ID = E2.EMP_ID;

-- Display employees who changed jobs
select E.EMP_ID,
F_NAME as FirstName,
L_NAME as LastName,
E.JOB_ID as JOB_ID,
JH.JOB_ID  
from JOB_HISTORY JH
right join Employees E on JH.EMP_ID=E.EMP_ID
where  E.JOB_ID <>JH.JOB_ID ;

-- Show all departments and the number of employees in each

select COUNT(Employees.EMP_ID) as Employee_Count,
DEP_NAME,DEPT_ID_DEP 
from Employees
right JOIN DEPARTMENTS ON DEPARTMENTS.DEPT_ID_DEP=Employees.DEPT_ID
group by  DEP_NAME,DEPT_ID_DEP;

-- Find the highest-paid employee in each department
select 
F_NAME as First_Name, 
L_NAME as LastName,
SALARY as PAID_SALARY
from Employees E
where salary =
(select max(SALARY)  as Highest_Paid from Employees E2
where E.DEPT_ID=E2.DEPT_ID );

-- Show the department with the maximum average salary

select avg(SALARY) As Average_Salary, 
DEP_NAME AS Departments,
DEPT_ID_DEP as Departments_ID 
from DEPARTMENTS D
left join Employees E on E.DEPT_ID=D.DEPT_ID_DEP
group by Departments, Departments_ID
order by Average_Salary desc
limit 1;

-- retrieve employees who earn more than their department’s average salary

select SALARY, 
F_NAME as FirstName ,
L_NAME as LastName ,
DEPT_ID as Department_Id 
from Employees E
where  SALARY>
(select round(avg(salary),2) as Average_Salary FROM Employees E1
 where E.DEPT_ID=E1.DEPT_ID) ;
-- If we want to compare Average Salary and Salary we use Window Function
select* from( 
 
 select F_NAME as FirstName ,
L_NAME as LastName,
SALARY,
DEPT_ID as Department_Id,
avg(SALARY) over (partition by DEPT_ID) As Average_SALARY
from Employees)t
where  SALARY >  Average_SALARY;


-- Find employees who have never appeared in JOB_HISTORY

	select Employees.EMP_ID, 
    F_NAME as FirstName ,
    L_NAME as LastName ,
    Employees.JOB_ID 
    from Employees 
    where Employees.EMP_ID not in 
( select JOB_HISTORY.EMP_ID from JOB_HISTORY ) ;

-- Show employees whose salary is between the min and max salary defined for their job in Jobs

select 
  Employees.EMP_ID,
  Employees.F_NAME, 
  Employees.L_NAME, 
  Employees.SALARY, 
JOBS.MIN_SALARY, 
JOBS.MAX_SALARY
from Employees 
join JOBS on Employees.JOB_ID =JOBS.JOB_ID
where Employees.SALARY between JOBS.MIN_SALARY and JOBS.MAX_SALARY;

-- Departments with highest-paid employees using Window Function

select * from
( select E.EMP_ID,
E.F_NAME as FirstName, 
E.L_NAME as LastName,
E.DEPT_ID as Deparment, 
E.SALARY AS SALARY ,
rank() over( partition by DEPT_ID   order by SALARY desc ) As SalaryRank
from Employees E
) as Ranked
where SalaryRank=1









