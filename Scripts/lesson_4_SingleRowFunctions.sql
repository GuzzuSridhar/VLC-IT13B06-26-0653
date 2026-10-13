-- case conversion functions
--upper
select upper('test') from dual;
select upper(first_name) from employees;
--lower
select lower('TEST') from dual;
select lower(first_name) from employees;
--initcap (Oracle)
select initcap('TEST') from dual;
select initcap(first_name) from employees;

-- use case
select * from employees;
select * from employees where first_name = 'kevin'; -- case sensitive search
select * from employees where lower(first_name) = 'kevin'; -- case in sensitive search
select * from employees where upper(first_name) = 'KEVIN'; -- case in sensitive search
select * from employees where initcap(first_name) = 'Kevin'; -- case in sensitive search

-- character manipulation
--concat 
-- takes exactly 2 arguments
-- same as the || operator
select concat(first_name,last_name) from employees;
-- if more columns are needed then nest the function
select concat(concat(first_name,' '),last_name) from employees;

--substring
-- syntax SUBSTR(string, start_pos,[length])
select substr('Oracle Database', 1,6);
select substr('Oracle Database', 8);
-- negative start position 
-- starts search from the last character
select substr('Oracle Database', -8, 4);

select concat(employee_id,substr(first_name,1,3)) as Acct_Id from employees;

--length
select length('testing');
select * from employees where length(first_name) = 4;
select length(salary) from EMPLOYEES; --implicit datatype conversion of salary (number) to string
select length(100000000000000000000000); -- data type converted
select length(hire_date) from EMPLOYEES; --implicit datatype conversion of date  to string

--instring 
-- search for a string within a string
--syntax INSTR(string, substring [,position [,occurence]])
select instr('Welcome to Oracle Database', 'Welcome');
select instr('Welcome to Oracle Database', 'Oracle');
select instr('Welcome to Oracle Database', 'Database');
select instr('Welcome to Oracle Database', 'o');
select instr('Welcome to Oracle Database', 'o', 6);
select instr('Welcome to Oracle Database', 'o', 1,2); -- finding the 2nd occurence of 'o' starting from position 1

select * from employees where instr(lower(first_name),'c') > 0 or instr(lower(last_name),'c') > 0;
select * from employees where instr(lower(first_name),'c') > 0 and instr(lower(last_name),'c') > 0;

-- padding
--lpad (left pad)
select lpad(100,10,'0');
select lpad(salary,10,'0') from employees;
select lpad(salary,10,'*') from employees;
select lpad(first_name,10,'*') from employees;
--rpad (right pad)
select rpad(100,10,'0'); -- avoid this
select rpad(100,10,'*');
select rpad(employee_id,7,'*') from employees;

-- nested padding
select rpad(lpad('test',10,'*'),20,'*');
--print test with 6 *'s on to right and left of the text

--trim
select length(' Oracle ')||' '|| length(trim(' Oracle '));
--ltrim and rtrim
select length(ltrim(' Oracle '));
select length(rtrim(' Oracle '));
select length(rtrim(ltrim(' Oracle ')));
select length(trim(' Oracle '));

-- Replace
--syntax - REPLACE(string, search_string [, replaced_String])
select replace('Oracle Database', 'Oracle', 'Mysql');

select * from employees;
select replace(phone_number,'.') from EMPLOYEES;

-- nesting functions
-- inner most function is executed first
select lpad(first_name,length(first_name)+1,'*') from employees;
select lpad('Ellen',length('Ellen')+1,'*');
select length('Ellen')+1; -- step 1
select lpad('Ellen',6,'*'); -- step 2

-- Number functions
-- Round
    -- syntax ROUND(number[,decimal_places])
    -- 5 or higher rounds up
    -- less than 5 rounds down
    select round(125.456); -- rounds down without decimals
    select round(125.556);-- rounds up without decimals
    
    select round(125.556,2); -- round off to 2 decimal places

    select round(125.556,-1); -- rounds off to nearest 10
    select round(125.556,-2); -- rounds off to nearest 100
    select round(1253.556,-3); -- rounds off to nearest 1000

-- display commission value of employees
    select 
      first_name, salary, COMMISSION_PCT, round(salary*commission_pct) as comm_value 
    from
     employees 
    where
     COMMISSION_PCT is not null;


-- Trunc
-- Syntax TRUNC(number[,decimal_places])
select trunc(123.456); -- removes decimals
select trunc(123.456,2); -- retains 2 decimals
select trunc(123.456,1); -- retains 1 decimal
select trunc(123.456,-1); -- Rounds of to nearest 10 
select trunc(123.456,-2); -- Rounds of to nearest 100 

select first_name, trunc(salary*12, -3) annsaltrunc, trunc(salary*12) annsal from employees;
-- Ceil
    -- returns the integer that greater than or equal to the given number
    select ceil(5.2);
    select ceil(5.8);
    select ceil(-5.8);
    select ceil(5);

-- Floor
-- returns the integer that lesser than or equal to the given number
    select floor(5.8);
    select floor(5.2);
    select floor(-5.8);
    select floor(5);

-- Mod
-- returns reminder of a division
select mod(7,2);

select first_name from employees where mod(employee_id,2) = 0;
select first_name from employees where mod(employee_id,2) <> 0;


-- Dates
select 
    sysdate, 
    current_date,
    systimestamp,
    current_timestamp
from dual;

--sysdate & systimestamp are from db server
--current_date & current_timestamp are from curent session

-- date functions
-- arithmetic operations on dates
select sysdate + 10;
select sysdate - 10;

select hire_date, abs(round(hire_date - sysdate)) "exp in days" from employees; -- experience in days
select hire_date, abs(trunc((hire_date - sysdate)/7)) "exp in weeks" from employees; -- experience in weeks
select hire_date, abs(trunc((hire_date - sysdate)/30)) "exp in months" from employees; -- experience in months
select hire_date, abs(trunc((hire_date - sysdate)/365)) "exp in years" from employees; -- experience in years

--next_day
select next_day(sysdate, 'MONDAY');

-- months between
select round(months_between(sysdate,hire_date)) from employees fetch first 5 rows only;

-- add months
select add_months(sysdate,10);

-- last day
select last_day(sysdate);

select to_char(sysdate,'MON-DD-YYYY: HH:MM');

--round on date
select round(sysdate,'MONTH');
select round(sysdate,'YEAR');
select trunc(sysdate,'MONTH');
select trunc(sysdate,'YEAR');











