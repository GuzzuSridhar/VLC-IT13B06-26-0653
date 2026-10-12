--limiting rows in query result using where clause
select * from employees where department_id = 50;
-- combine column and row limiting
select first_name, last_name, department_id from employees where department_id = 50;
-- beautify query
select
    first_name,
    last_name,
    department_id
from 
    employees
where 
    department_id = 50;

-- writing a condition that is always true
select * from employees where 1=1; -- all records will be returned
-- writing a condition that is always false
select * from employees where 1=0; -- no records will be returned

-- comparision operators
-- equal to
select * from employees where department_id = 50; -- null value records will not be returned
-- not equal to
select * from employees where department_id <> 50; -- null value records will not be returned
select * from employees where department_id != 50; -- null value records will not be returned
-- greater than
select * from employees where salary>5000; -- null value records will not be returned
--less than
select * from employees where salary<5000; -- null value records will not be returned
--greater than or equal to
select * from employees where salary>=5000; -- null value records will not be returned
--less than or equal to
select * from employees where salary<=5000; -- null value records will not be returned
--between operator
select * from employees where salary between 5000 and 10000; -- records with salary between 5000 (inclusive) and 10000 (inclusive) will be returned
--in operator
select * from employees where department_id in (50, 60, 70); -- records with department_id 50 or 60 or 70 will be returned.
---like operator (pattern matching)
-- 2 wildcard characters are used with like operator
-- % - represents zero or more characters
-- _ - represents a single character 
select * from employees where first_name like 'A%'; -- records with first_name starting with 'A' will be returned
select * from employees where first_name like '%a'; -- records with first_name ending with 'a' will be returned
select * from employees where first_name like '%a%'; -- records with first_name containing 'a' will be returned
select * from employees where first_name like '_a%'; -- records with first_name having 'a' as second character will be returned
select * from employees where first_name like '____'; -- records with first_name having exactly 4 characters will be returned
-- is operator used with null values
select * from employees where commission_pct is null; -- records with null commission_pct will be returned
select * from employees where commission_pct = null; -- syntactically correct but will not return any records because null is not equal to null

--logical operators
-- and operator
select * from employees where department_id = 50 and salary > 5000; -- records with department_id 50 and salary greater than 5000 will be returned
select * from employees where department_id =50 and department_id = 60; -- logically impossible condition, no records will be returned
-- or operator
select * from employees where department_id =50 or department_id = 60; -- records with department_id 50 or 60 will be returned
-- not operator
select * from employees where not department_id = 50; -- records with department_id not equal to 50 will be returned
-- combining not logical operator with in, is and between operators
select * from employees where department_id not in (50, 60);
select * from employees where salary not between 5000 and 10000;
select * from employees where commission_pct is not null;

--Order by clause
select * from employees order by first_name; -- records will be sorted in ascending order by default
select * from employees order by first_name desc; -- records will be sorted in descending order
-- numeric columns will be sorted in ascending order by default
select * from employees order by salary asc; -- records will be sorted in ascending order by default
select * from employees order by salary desc; -- records will be sorted in descending order
-- order by alias column name
select first_name, last_name, salary*12 as annual_salary from employees order by annual_salary;
--order by column position (numeric position of the column in the select list)
select first_name, last_name, salary*12 as annual_salary from employees order by 3; -- records will be sorted in ascending order by default
--order by multiple columns
select first_name|| ' '|| last_name as full_name, department_id, salary from employees order by department_id desc, salary desc; -- records will be sorted in ascending order by department_id and then in descending order by salary
select first_name|| ' '|| last_name as full_name, department_id, HIRE_DATE from employees order by department_id , hire_date desc; -- records will be sorted in ascending order by department_id and then in descending order by hired_date

/*
select
  column1 [as alias_name],
  column2 [as alias_name],
from
  table_name
where
  condition1
  [and | or] condition2
orer by
  column1 [asc | desc],
  column2 [asc | desc];
*/

-- using where clause with order by clause
select first_name, last_name, department_id from employees where department_id = 50 order by last_name; -- records with department_id 50 will be returned and sorted in ascending order by last_name

--Sql row limiting clause
-- row limiting clause is used to limit the number of rows returned by a query
select * from employees fetch first 5 rows only; -- first 5 records will be returned

-- percent of rows returned
select * from employees fetch first 10 percent rows only; -- first 5 records will be returned

-- using the offset clause to skip rows
select * from employees offset 5 rows fetch next 5 rows only; -- first 5 records will be skipped and next 5 records will be returned

select first_name, salary from employees order by 2 asc fetch first 1 rows only; -- first record with lowest salary will be returned
select first_name, salary from employees order by 2 desc fetch first 1 rows only; -- first record with highest salary will be returned

-- with ties clause is used to return all records that have the same value as the last record in the result set
select first_name, salary from employees order by 2 desc;
select first_name, salary from employees order by 2 desc fetch first 2 rows only;
select first_name, salary from employees order by 2 desc fetch first 2 rows with ties;

-- Using variables in sql query
select * from employees where department_id = &did;
--variables can be used in where clause, orderby clause, table names, column names
select first_name, &col_name from employees;
select * from employees where first_name = '&name';
select * from employees where &cond;
select * from employees order by &col;
-- reusing variables using &&
select first_name, &&col_name from employees order by &col_name; 
undefine col_name;

-- set verify on ( works on Sql plus only)

