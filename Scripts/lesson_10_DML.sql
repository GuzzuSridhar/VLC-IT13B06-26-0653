-- create a temp table to work on DML statements
-- create is a DDL statement
create table emp as select * from employees where 1=2;

-- describe the structure
desc emp;

-- Insert one record with all values
/* 
INSERT INTO	table [(column [, column...])]
VALUES		(value [, value...]), (value [, value...]), … ; 
*/

--with column list
insert into emp 
(employee_id,first_name,last_name,email,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID)
values
(9000,'Bill','Gates','bgates','12345678',SYSDATE,'IT_PROG',7000,null,null,50);

select * from emp;

commit; -- finalize changes
rollback; -- discard changes

-- Insert without the column list
-- will work only when the values for all the columns present are given in the values clause
insert into emp 
values
(9001,'adam','Gates','agates','12345678',SYSDATE,'IT_PROG',8000,null,null,60);


-- insert record with only required column values
-- error shown as not enough values
-- no values for all 11 columns
insert into emp 
values
('Alex','alex',sysdate,'IT_PROG');

-- add the column list for appropriate values
insert into emp (LAST_NAME,EMAIL,HIRE_DATE,JOB_ID)
values
('Alex','alex',sysdate,'IT_PROG');

-- change the sequence of columns
insert into emp (EMAIL,HIRE_DATE,JOB_ID,LAST_NAME)
values
('alex',sysdate,'IT_PROG','Alex');

-- insert multiple records
insert into emp (LAST_NAME,EMAIL,HIRE_DATE,JOB_ID)
values
('Phil','phil',sysdate,'IT_PROG'),
('Obama','obama',sysdate,'IT_PROG'),
('Sara','sara',sysdate,'IT_PROG');

-- insert using the data sheet

-- Insert using a select statement
insert into emp select * from employees; -- this works only when both the tables have same structure

select * from emp;

-- update
-- update
/*
UPDATE		table
SET		column = value [, column = value, ...]
[WHERE 		condition];

*/

-- update salary for employee 197
update emp set salary = 3500; -- changes the salary for all records as the where clause is missing
rollback;
update emp set salary = 3500 where employee_id = 197 ; -- changes the salary for employee 197
commit;

-- update salary and commission
update emp set salary = salary+100, commission_pct= .3 where employee_id = 196 ; -- changes the salary for employee 196

-- update using sub query
-- update all the programmers salaries to the department avg salary
update emp 
set salary = 
(select avg(SALARY) from emp where job_id='IT_PROG')
where job_id='IT_PROG';

-- update based on a different table from in update
-- joins in UPDATE statements were introduced in Oracle Database 23ai.
UPDATE employees e
SET e.salary = j.max_salary
FROM jobs j
WHERE e.job_id = j.job_id;

rollback;


-- delete
/*
DELETE [FROM]	  table
[WHERE	  condition];
*/
-- delete all records
delete emp ;

-- delete specific records
delete from emp where employee_id = 196;

select * from emp;
commit;

-- savepoints

select * from regions;

insert into regions 
values(60,'Australia');

select * from REGIONS;
select * from emp;

insert into regions 
values(70,'Antartica');

-- create a savepoint
savepoint after_antartica;

insert into emp (EMAIL,HIRE_DATE,JOB_ID,LAST_NAME)
values
('alex',sysdate,'IT_PROG','Alex');
-- create savepoint
savepoint after_ins_emp;

rollback to savepoint after_antartica;
commit;



