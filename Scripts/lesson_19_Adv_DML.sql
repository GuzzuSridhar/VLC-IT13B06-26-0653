-- crate a audit table
create table salary_audit(
    emp_id number,
    old_sal number,
    new_sal number,
    changed_on date default sysdate
);
-- explicit default insert
insert into SALARY_AUDIT(emp_id,old_sal,new_sal,CHANGED_ON)
values(999,1000,2000,DEFAULT);

-- Conditional insert all
create table high_sal as select employee_id, salary from employees where 1=2;
create table standard_sal as select employee_id, salary from employees where 1=2;
create table low_sal as select employee_id, salary from employees where 1=2;

insert all
  when salary > 10000 then into high_sal(EMPLOYEE_ID,SALARY) values (EMPLOYEE_ID,SALARY)
  when salary = 10000 then into standard_sal(EMPLOYEE_ID,SALARY) values (EMPLOYEE_ID,SALARY)
  when salary < 10000 then into low_sal(EMPLOYEE_ID,SALARY) values (EMPLOYEE_ID,SALARY)
select employee_id,salary from employees;

select * from high_sal;
select * from standard_sal;
select * from low_sal;

truncate table high_sal;
truncate table standard_sal;

-- flashback query support
-- query database for historic values of columns.
select employee_id, salary
from employees as of timestamp (systimestamp - interval '5' minute);
select employee_id, salary
from employees as of timestamp (systimestamp - interval '1' day);

  
