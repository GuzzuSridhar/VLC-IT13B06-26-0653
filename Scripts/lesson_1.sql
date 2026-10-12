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



