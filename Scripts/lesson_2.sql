--show all tables in the current schema
select * from tab;
select * from departments;

--syntax for selecting all columns from a table 
-- * represents all columns in the table
SELECT
  *
FROM employees;

-- selecting specific columns from a table
--select last_name from employees;
SELECT LAST_NAME FROM EMPLOYEES;
--select first_name and last_name from employees;
SELECT first_name, LAST_NAME FROM EMPLOYEES;
-- apply beautification to a query
SELECT 
    first_name, 
    last_name
FROM employees;

--using dual table to select a constant value
SELECT 
    'Hello World!' 
FROM dual;
--show user from dual;
SELECT user FROM dual;
--use dual as calculator to perform arithmetic operations
SELECT 2 + 2 FROM dual;
SELECT 2 * 2 FROM dual;
--dual is used for testing and performing calculations, it is a special one-row, one-column table present by default in all Oracle databases.
-- simplified dual usage (no from clause needed. Works on versions 23 and upwards)
SELECT 2 + 2;
select user;
select sysdate;

-- USING Arithmetic Operators in SQL
-- addition
SELECT 2 + 2 AS addition FROM dual;
-- subtraction
SELECT 5 - 3 AS subtraction FROM dual;
-- multiplication
SELECT 4 * 3 AS multiplication FROM dual;
-- division
SELECT 10 / 2 AS division FROM dual;

--using arithmetic operators on columns in a table
--show all names and salaries of employees.
select first_name, last_name, salary from employees;
--show annual salary of employees by multiplying their salary by 12
select first_name, last_name, salary, salary * 12 from employees;

--operator precedence in SQL
--parentheses have the highest precedence, followed by multiplication and division, and then addition and subtraction
select 2 + 3 * 4 from dual; -- result is 14
select (2 + 3) * 4 from dual; -- result is 20

--setting a column alias to make the output more readable
select first_name as name, last_name as surname, salary * 12 as annual_salary from employees;
--if the alias has spaces or special characters, it should be enclosed in double quotes
select first_name as "First Name", last_name as "Last Name", salary * 12 as "Annual Salary" from employees;

--concatenation of strings in SQL
--using the concatenation operator (||) to combine strings
select first_name||last_name as full_name from employees;
-- incluse spaces between first and last names
select first_name||' '||last_name as "Full Name" from employees;
select first_name||' '||last_name|| ' is working as ' || job_id as "Employee details" from employees;

--using escape for single quotes in strings
--using 2 single quotes to represent a single quote in a string
select 'It''s a beautiful day!' from dual;
--using the q operator to avoid using escape characters (can use any character as a delimiter)
select q'[It's a beautiful day!]' from dual;
select q'(It's a beautiful day!)' from dual;
select q'{It's a beautiful day!}' from dual;
select q'<It's a beautiful day!>' from dual;
select q'!It's a beautiful day!' from dual;
--using the q operator to include single quotes in a string without escaping on tables
select first_name||q'['s salary is ]' || salary as "Employee Salary" from employees; 
select department_name|| q'[ department's manager is ]' || manager_id as "Department Manager" from departments;

--Distinct keyword in SQL
--using the distinct keyword to eliminate duplicate values in a output column (result set)
select * from employees;
select department_id from employees;
select distinct department_id from employees;
select distinct job_id from employees;
select distinct hire_date from employees;
select distinct phone_number from employees;

--describe table structure
desc employees;

--Null values in SQL
--Null values represent missing (empty) or unknown data in a database.
select first_name,last_name, salary,commission_pct from employees;
--perform arithmetic operations on columns with null values
select first_name,last_name, salary,commission_pct*100 from employees;
--any arithmetic operation on null values will result in null








