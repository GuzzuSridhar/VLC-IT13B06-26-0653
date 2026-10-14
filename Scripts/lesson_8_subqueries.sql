--subquery
--query within a query

select * from employees where salary > (select avg(salary) from employees);
select * from employees where salary < (select salary from employees where upper(first_name) = 'SUSAN');

-- nested sub query
-- All the employees in the same department as of employee "Steven" but, based on the employee_id
select * 
    from  employees
    where 
        department_id = 
            (select department_id 
                from employees 
                    where employee_id = 
                        (select employee_id 
                            from employees 
                                where lower(first_name) = 'adam')) ;

-- show all the departments which employ staff
select DEPARTMENT_ID, department_name 
    from departments 
        where DEPARTMENT_ID  in 
            (select distinct department_id 
                from employees 
                    where DEPARTMENT_ID is not null);
-- show all the departments which do not employ staff
select DEPARTMENT_ID, department_name 
    from departments 
        where DEPARTMENT_ID  not in 
            (select distinct department_id 
                from employees 
                    where DEPARTMENT_ID is not null);

-- a subquery that does not return any value
select * from employees where salary < (select salary from employees where upper(first_name) = 'ABC');

-- ANY Clause
-- Applies OR operator to search

-- selects the employees with salary greater than the lowest salary from the sub query
select first_name,last_name, salary 
    from employees 
    where SALARY > any
        (select salary 
            from employees 
                where department_id = 60)
                order by salary; -- salaries greater than 4200

-- selects the employees with salary less than the highest salary from the sub query
select first_name,last_name, salary 
    from employees 
    where SALARY < any
        (select salary 
            from employees 
                where department_id = 60)
                order by salary desc; -- salaries less than 9000 

--ALL clause
-- uses the AND operator to search

---- selects the employees with salary greater than the highest salary from the sub query
select first_name,last_name, salary 
    from employees 
    where SALARY > all
        (select salary 
            from employees 
                where department_id = 60)
                order by salary; -- salaries greater than 9000
-- selects the employees with salary less than the lowest salary from the sub query
select first_name,last_name, salary 
    from employees 
    where SALARY < all
        (select salary 
            from employees 
                where department_id = 60)
                order by salary desc; -- salaries less than 4200 

-- Multiple column subquery
select employee_id, first_name, last_name, department_id, job_id
from EMPLOYEES
where (DEPARTMENT_ID,job_id) in 
    (select department_id, job_id 
    from EMPLOYEES
    where employee_id in (100,101));




-- sub query in the from clause
select * from (select last_name, first_name from employees);





