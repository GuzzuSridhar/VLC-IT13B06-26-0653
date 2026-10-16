-- Time zones

select sysdate ;
select current_date ;

select systimestamp, current_timestamp, dbtimezone, sessiontimezone;

-- offset for a region
select 
    TZ_OFFSET('America/NEW_York') as Ny_Time,
    TZ_OFFSET('Asia/Singapore') as Sg_Time,
    TZ_OFFSET('Asia/kolkata') as In_Time
;

-- adding interval to time
-- Year to Month (YMINTERVAL)
-- Day to Second (DSINTERVAL)

select 
    to_yminterval('PY') as "five years",
    to_yminterval('P6M') as "6 months",
    to_yminterval('P2Y6M') as "two years 6 months",
    to_dsinterval('P10D') as "10 days",
    to_dsinterval('P10D') as "10 days";

select employee_id, first_name,hire_date,
    hire_date + to_yminterval('P1Y') as First_anniversary, 
    hire_date + to_yminterval('P2Y') as Second_anniversary, 
    hire_date + to_yminterval('P3Y') as Third_anniversary 
from employees;
select employee_id, first_name,hire_date,
    hire_date + to_dsinterval('30 00:00:00') as "30_day_Check", 
    hire_date + to_yminterval('01-00') as First_anniversary, 
    hire_date + to_yminterval('P2Y') as Second_anniversary, 
    hire_date + to_yminterval('P3Y') as Third_anniversary 
from employees;

-- extract function on dates
select extract(YEAR from sysdate);
select extract(MONTH from sysdate);
select extract(DAY from sysdate);
select extract(HOUR from current_timestamp);
select extract(HOUR from systimestamp);

select 
    first_name|| ' Joined the organization in the year ' || Extract(YEAR from hire_date) as "Joining Year" 
from employees; 



