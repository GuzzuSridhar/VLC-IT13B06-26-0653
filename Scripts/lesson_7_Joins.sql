-- Using Joins
-- two or more tables are needed for Join

-- display employee name with the job title
select 
    first_name , job_title 
from 
    employees, jobs 
where 
    employees.job_id=jobs.job_id;

-- Display employee with department name
select 
    first_name , department_name 
from 
    employees, DEPARTMENTS 
where 
    employees.DEPARTMENT_ID=DEPARTMENTS.department_id;

-- joining 3 tables
select 
    first_name , 
    job_title , 
    DEPARTMENT_name 
from
    employees, jobs, departments 
where employees.job_id=jobs.job_id and employees.DEPARTMENT_ID=departments.DEPARTMENT_ID;

-- all the above are called as inner joins
-- all the unmatched records are omitted in a inner join.

-- Natural join
-- based on the columns that have same name and data type
select
    first_name, job_title 
from
 employees 
NATURAL JOIN 
jobs; -- based on the column job_id

-- using clause (if there are more than one matching column names in the joining tables specify the exact column to use for join)
select
 last_name, department_name
 from EMPLOYEES join DEPARTMENTS
 using(department_id);

 -- using alisases (dont use aliases in a natural join or using clause queries)

select 
    first_name , 
    job_title , 
    e. job_id,
    DEPARTMENT_name 
from
    employees e, jobs j, departments d 
where e.job_id=j.job_id and e.DEPARTMENT_ID=d.DEPARTMENT_ID;

-- on clause (3 way join)
select employee_id,city, department_name
from employees e join departments d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
join locations l on d.LOCATION_ID=l.LOCATION_ID;

-- using the on and the AND clause
select e.employee_id,e.department_id,d.location_id
from EMPLOYEES e join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.MANAGER_ID = 149;

-- self join
-- joining a table to itself
-- display all employee names and their manager names

select worker.FIRST_NAME Employee, manager.FIRST_NAME Manager
from employees worker join employees manager
on worker.MANAGER_ID = manager.EMPLOYEE_ID;

-- noneqi join
-- using any other comparision operator other than = in the join condition

select 
    first_name,
    salary,
    job_title,
    min_salary,
    max_salary
from employees e join jobs j 
on e.salary between j.min_salary and max_salary;

--outer join
-- LEFT OUTER JOIN
    select e.last_name, e.department_id, d.department_name
    from EMPLOYEES e LEFT OUTER JOIN departments d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- RIGHT OUTER JOIN
select e.last_name, e.department_id, d.department_name
    from EMPLOYEES e Right OUTER JOIN departments d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- FULL OUTER JOIN
select e.last_name, e.department_id, d.department_name
    from EMPLOYEES e full OUTER JOIN departments d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- cross join (cartesian product)
-- use this with extreme caution
select d.department_name, j.job_title
from departments d cross join jobs j;


