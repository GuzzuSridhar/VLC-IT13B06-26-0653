-- Set Operators
-- Union ALL
-- display the unique employees from department 60 and 90
select first_name, department_id
from employees
where department_id in (60,90)
union
select first_name, department_id
from employees
where department_id = 90;

-- union all
-- display the unique employees from department 60 and 90
select first_name, department_id
from employees
where department_id in (60,90)
union all
select first_name, department_id
from employees
where department_id = 90;

--Intersect
--show all employees earning salary > 5000 and <10000
select first_name, salary
from EMPLOYEES  where salary > 5000
intersect
select first_name, salary
from EMPLOYEES where salary < 10000
order by salary;

-- display departments without employees
select department_id from DEPARTMENTS
minus
select distinct department_id from employees where department_id is not null;

-- apply set operator in a sub query
select department_name 
from departments
where department_id in
(select department_id 
    from DEPARTMENTS
        minus
        select distinct department_id 
        from employees 
        where department_id is not null);