--DDL (Data Definition Language)
-- CREATE ALTER DROP

-- Create Statement
--Used to create Database objects
-- TABLE VIEW SEQUENCE INDEX SYNONYM

-- Naming Rules for Tables and Columns
--Begin with a letter
-- max length of 128 characters
--Allowed characters - A-Z , a-z, 0-9, _, $, #
-- for every user the table name has to be unique
-- no oracle reserved names allowed 

-- Syntax for create table
/*
CREATE TABLE [schema.]table
          (column datatype [DEFAULT expr][, ...]);
*/

create table dept 
(
    deptno number(2),
    dname varchar2(15),
    location varchar2(20),
    created_on date default sysdate
);

desc dept;

insert into dept (deptno,dname,location) values(10,'sales','sg'); 
insert into dept (deptno,dname,location, created_on) values(11,'mktg','sg', to_date('2026-09-15','YYYY-MM-DD')); 

select * from dept;

-- Datatypes Available
/*
    Varchar2(size) -- variable Length character data
    char(size) - fixed length character data
    Number(p, s)- Variable length numeric data
    Date - date and time
    Long -- variable Length character data (up to 2GB)
    CLOB -- Character Large Object -- 4 GB
    BLOB -- Binary Large Object - 4 GB
    Boolean -- true false
*/

-- difference between char and varchar
create table test_char(char_col char(4), var_col varchar2(4));

insert into test_char 
values
('ab','ab'),
('abc','abc'),
('abcd','abcd');

select * from test_char;
select char_col,length(char_col), var_col, length(var_col) from test_char;

-- table with boolean Types
create table test_bool
(id number, b1 boolean, b2 boolean);

-- insert booleans
insert into TEST_BOOL values (1,'true', 'false'),(2,'yes', 'no'),(3,'y', 'n'); 

select * from test_bool;

-- default values for null
create table test_null( id number, name varchar2(100) DEFAULT ON NULL for insert and update 'Missing Info');

insert into test_null values(1,null),(2,'test');
select * from test_null;


-- constraints
-- List
/*
Primary Key
    Does not allow Null or duplicate values 
    Applies Not Null and Unique constraints to the column
    every table can have only one primary key
Unique
Not Null
Check
Foreign key
*/
--Apply constraints in create or alter statements
-- emp and dept tables
desc dept;
-- adding primary key to deptno in dept table
Alter table dept add constraint dept_pk primary key (deptno);

-- create emp table with constraints
create table  if not exists emp (
    emp_id number constraint em_pk primary key,
    fname varchar2(25) Not null,
    email varchar2(50) unique,
    salary number(10,2) constraint chk_sal check (salary > 0),
    deptno number(2) constraint em_dep_fk references dept(deptno)
);

desc emp;
-- Check the constraints
--primary key violation
insert into emp values (null,'alex','alex',1000,10);
insert into emp values (100,'alex','alex',1000,10);
insert into emp values (100,'alex','alex',1000,10);

-- check constraint violation
insert into emp values (101,'alex','alex',0,10); -- bad
insert into emp values (101,'alex','alex1',10,10); -- good


-- check foreign key violation
insert into emp values (102,'alex','alex12',10,30);

-- table level constraint
-- all constraints can be mentioned at table level except for Not null
-- all table level constraints are to be named using the constraint <name> syntax
-- if more than one column is given than the constraints becomes composite
create table test_composite (id number, name varchar2(10), constraint comp_emp primary key (id,name));

-- insert into composite key columns
insert into TEST_COMPOSITE values(100,'abc'); -- allowed
insert into TEST_COMPOSITE values(100,'abc'); -- not allowed
insert into TEST_COMPOSITE values(100,'xyz'); -- allowed
insert into TEST_COMPOSITE values(100,'xyz'); -- not allowed

-- create table based on other table with data
create table copy_emp as select * from emp;
-- create table based on other table without data (only structure)
create table copy_emp as select * from emp where 1=2;

drop table copy_emp;

select * from dept;
select * from emp;

delete from dept where deptno = 10; -- not allowed

-- drop table
drop table dept ; -- not allowed as there is a relation (pk-> fk)
drop table dept cascade constraints; -- all constraints are deleted also
insert into emp values (102,'alex','alex13',10,50); -- good as dept table is dropped
drop table if exists emp; -- run this to avoid errors
drop table emp; -- reports an error if the table is not present

-- Alter Statement
-- Add columns
    alter table emp add (bonus number (3));
    desc emp
-- Modify Columns
    -- change the column's datatype, size, default value
    alter table emp modify (FNAME CHAR(25)); 
    alter table emp modify (FNAME number); -- not allowed if the table is not empty

    alter table emp modify (email varchar2(75));
    
    alter table emp modify (bonus default 0);

-- Rename columns
    alter table emp rename column bonus to commission;

-- Drop columns
    alter table emp drop column commission;

-- mark columns as unused
    alter table emp set unused (email);
    -- column is no longer allowed for any query or dml operation.
-- drop unused columns
    alter table emp drop unused columns;

-- add contsraints
    alter table emp add constraint chk_sal check (salary > 0);
-- drop constraints
    alter table emp drop constraint chk_sal;

-- mark table as read only
    alter table emp  read only;
    -- try insert (will not be allowed)
    -- allow write
    alter table emp read write;
    -- try insert (will  be allowed)


