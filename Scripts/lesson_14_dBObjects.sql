-- view
-- Is a Database Object
-- Stored Query
/*
 Create or replace view <view_name> as
 <select statement>
 */

 -- could be any select statement
 -- we can reuse complex queries

-- simple view
-- is a view created on a single table
 create or replace view emp_view as
 select first_name, salary from employees where salary > (select avg(salary) from employees);

 select * from emp_view;

 -- views with column aliases in query
 create or replace view emp_view_alias as
 select first_name ||' '|| last_name full_name, to_char(salary * 12,'$999,999.99') Annual_salary from employees;

select full_name, Annual_salary from EMP_VIEW_ALIAS;

-- dictionary table for views.
 desc user_views

 select view_name, text from user_views;

 -- create a view with all not null columns of employees
 create or replace view emp_man as
 select employee_id,last_name,email,hire_date,job_id from EMPLOYEES; 
 -- Query the view
 select * from emp_man;
-- Apply DML on to view
 insert into emp_man values (300,'gates','gates',sysdate,'IT_PROG');

 -- complex view
 -- group functions and also values from more than one table
 -- No DML allowed
 create or replace view comp_view 
  (dname, minsal, maxsal, avgsal)
 as  select 
    d.department_name , min(e.salary), max(e.salary) , round(avg(e.salary))
    from employees e join departments d using (department_id)
    group by d.DEPARTMENT_NAME;

desc comp_view;
select * from comp_view;

--read only views
create or replace view empvu10
as select employee_id,last_name,job_id,email,hire_date
from EMPLOYEES where department_id = 10
with read only;

/*
insert into a view is not allowed when the following is included:
Group Functions
Group By clause
distinct keyword
derived columns ( expression based columns)
Not Null Column without a default value
*/

select view_name from user_views;

-- drop all the views
drop view EMP_VIEW_ALIAS;
drop view EMP_VIEW;
drop view EMP_MAN;
drop view COMP_VIEW;
drop view EMPVU10;
drop view EMP_DETAILS_VIEW;
