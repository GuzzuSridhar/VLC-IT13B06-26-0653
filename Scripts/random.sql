-- all table records are deleted.
truncate table test_bool; -- DDL command (applies implicit commit, cannot be undone)
delete from emp; -- DML command ( can be rolled back)

-- exists key word 

-- co related sub query

select 
e.first_name, 
e.department_id 
from employees e 
where exists (
    select 1 from departments d where e.DEPARTMENT_ID = d.DEPARTMENT_ID 
    );

select 
e.first_name, 
e.department_id 
from employees e 
where not exists (
    select 1 from departments d where e.DEPARTMENT_ID = d.DEPARTMENT_ID 
    );

-- CTE (Common Table Expression)
-- readable queries.
-- all employees earning more than 10,000
with high_salary as (
    select employee_id,
    first_name,
    last_name,
    salary
from employees
where salary > 10000
)
select * from high_salary;

-- subquery scope and visibility of the columns

-- display employees whose salary is greater than the avg salary of their respective departments

select 
    e.employee_id,
    e.first_name,
    e.salary,
    e.department_id
from employees e
where e. salary > 
    (
        select avg(salary) 
        from EMPLOYEES d
        where d.department_id = e.DEPARTMENT_ID
    );

-- One way visibility demo ( results in an error)
select 
    e.employee_id,
    e.first_name,
    e.salary,
    d.avg_salary,
    e.department_id
from employees e
where e. salary > 
    (
        select avg(salary) avg_salary 
        from EMPLOYEES d
        where d.department_id = e.DEPARTMENT_ID
    );

