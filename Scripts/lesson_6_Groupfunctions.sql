-- Group functions or called as Aggregate Functions
-- act on multiple records and give one result
--Functions are -> Count SUM MIN MAX AVG

--count
select count(*) from employees;
select count(*) from departments;
select count(*) from countries;
select count(department_id) from employees; -- null values ignored
select count(distinct department_id) from employees; -- null values ignored
select count(COMMISSION_PCT) from employees where DEPARTMENT_ID = 80; -- null values ignored

select first_name, count(*) from employees; -- Invalid

-- AVG MAX MIN SUM
select AVG(Salary) Avg, Max(salary) max, Min(salary) Min, sum(salary) sum from EMPLOYEES;
select round(AVG(Salary)) Avg, Max(salary) max, Min(salary) Min, sum(salary) sum from EMPLOYEES;

-- Creating groups of data
select 
    department_id,
    round(avg(salary)) "Averege Salary"
from employees
group by DEPARTMENT_ID;


-- group by column position
-- turned off by default
Alter session set group_by_position_enabled = true;

select 
    department_id,
    round(avg(salary)) "Averege Salary"
from employees
group by 1;

-- group by multiple columns
select 
    department_id, job_id,
    round(avg(salary)) "Averege Salary"
from employees
group by DEPARTMENT_ID, JOB_ID;

select 
    department_id,
    round(avg(salary)) "Averege Salary",
    round(max(salary)) "Max Salary",
    round(min(salary)) "Min Salary",
    round(sum(salary)) "Total Salary"
from employees
group by DEPARTMENT_ID;

select 
    to_char(Hire_date,'yyyy') as YoJ,
    round(avg(salary)) "Averege Salary",
    round(Max(salary)) "Max Salary",
    round(Min(salary)) "Min Salary",
    round(Sum(salary)) "total Salary"
from employees
group by YoJ
having round(sum(salary)) >100000;

-- netsing Group functions
select max(avg(salary)) from employees group by DEPARTMENT_ID;

-- Syntax of a select statement
/*
SELECT    column, group_function
FROM      table
[WHERE    condition]
[GROUP BY group_by_expression or position]
[HAVING   group_condition]
[ORDER BY column];
*/
