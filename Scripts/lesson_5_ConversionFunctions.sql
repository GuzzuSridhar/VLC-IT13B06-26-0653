-- Explicit Conversions
-- to_char() -- used to display dates and numbers as strings (with format)

-- dates
select to_char(sysdate,'DD-MM-YYYY');
--format elements (YYYY YEAR MM MONTH MON DAY DY DD HH24 MI SS AM )
select to_char(current_date,'Year - Month - DDsp');
select to_char(current_date,'Ddspth Month Year');
select to_char(current_date,'DDspth Month YEAR');

select first_name || ' joined on the '|| to_char(hire_date,'Ddspth Month Year') from employees; 

-- numbers
select to_char(salary,'$999,999.00') from employees;
select to_char(salary,'L99,99,999.00') from employees;

-- to_number()
-- use the to_number to convert string to a number
select ('2500') +100 ; -- implicit
select to_number('2500') +100 ; -- explicit
select to_number('2500.50','9999.99')  ; -- explicit

--to_date()
-- converts strings to dates
select to_date('25-DEC-2005', 'DD-MON-YYYY');
select * from employees where hire_date > to_date('1-3-2015', 'dd-MM-YYYY');

-- General Functions
-- Null value functions
-- NVL
select nvl(commission_pct,0) from employees;
select nvl(DEPARTMENT_ID,'Not Assigned') from employees; -- incompatible data types
select nvl(DEPARTMENT_ID,0) from employees; -- incompatible data types

-- NVL2
Select nvl2(commission_pct, 'Eligible', 'Not Eligible') from employees;
Select nvl2(DEPARTMENT_ID, 'Assigned', 'Not Assigned') from employees;

--coalesce
-- takes n arguments, and returns first non null value
select first_name, coalesce(email,phone_number) from EMPLOYEES;

-- case statement
-- equivalent to if-then-else

--Simple case
select last_name, job_id, salary,
    case job_id 
        when 'IT_PROG' then salary*1.10
        when 'ST_CLERK' then salary*1.15
        when 'SA_REP' then salary*1.20
    else
        salary 
    end as "Revised Salary"
from employees;

--Searched case
select first_name, salary,
case
    when salary > 10000 then 'High Salary'
    when salary between 5000 and 10000 then 'Mid Salary'
    else 'Low Salary'
 end as "Salary Status"
 from employees;

 --decode (Legacy Function)
SELECT 
    department_id,
    DECODE(department_id, 
           10, 'Administration', 
           20, 'Marketing', 
           30, 'Purchasing', 
           'Other Department') AS department_name
FROM employees; 





