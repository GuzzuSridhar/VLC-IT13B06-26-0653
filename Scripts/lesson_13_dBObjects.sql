--Other Database objects
-- sequences
-- synonyms
-- index

-- Sequence
/*
is an db object that automatically generates a sequence of numeric values
used for insertion of values into a primary key column
can be used with the default value of a column
*/

/*
CREATE SEQUENCE [ schema. ] sequence
  [ { START WITH|INCREMENT BY } integer
  | { MAXVALUE integer | NOMAXVALUE }
  | { MINVALUE integer | NOMINVALUE }
  | { CYCLE | NOCYCLE }
  | { CACHE integer | NOCACHE }
  | { ORDER | NOORDER }
  | { SCALE | NOSCALE }
  | { SHARD | NOSHARD }
];
*/

-- create a sequence with default values
create sequence test_seq;

desc user_sequences;

-- Query the details of the sequence
select min_value, max_value, increment_by from user_sequences where lower(sequence_name) = 'test_seq';

-- pseudo columns to work with sequences
-- NEXTVAL
    -- generates the next value in the sequence
    -- sequence_name.nextval
-- CURRVAL
    -- shows the last generated value in the sequence
    -- sequence_name.currtval

select test_seq.currval from dual;
select test_seq.nextval from dual;

-- restart the sequence
ALter sequence test_seq restart;

create table if not exists test_seq_tab (id number constraint ts primary key);
Alter table test_seq_tab modify(id default test_seq.nextval);
Alter table test_seq_tab add(name varchar2(20));

desc test_seq_tab

-- insert into the table using sequence
insert into TEST_SEQ_TAB values (TEST_SEQ.nextval);
insert into TEST_SEQ_TAB(name) values ('Alex');

select * from TEST_SEQ_TAB;

rollback;
-- The sequence will generate unique numbers but does not guarentee a series in a table's column values
-- the series in a table may break when a roll back is issued.

drop table test_seq_tab purge;

-- creation of a sequence with other parameters
create sequence order_seq 
start with 1000
increment by 10
maxvalue 9999
cycle;

drop sequence order_seq;
-- Query the details of the sequence
select min_value, max_value, increment_by from user_sequences where lower(sequence_name) = 'order_seq';

-- negative sequence
create sequence neg_seq
start with 1000
increment by -1
minvalue -1
maxvalue 1000;

select neg_seq.nextval;
alter sequence neg_seq minvalue 0;

--synonym
-- is a different name given to a database object
-- Alternative name to the db object
-- when using tables from a different user.

desc employees
desc hr.employees

create synonym emp_syn for employees; 

desc emp_syn;
select * from emp_syn;

select * from hr.employees;
create synonym hemp for hr.employees;
select * from hemp;

select * from user_synonyms;
-- no alter statement ( use create or replace statment )
create or replace synonym hemp for departments;

drop synonym hemp;
drop synonym emp_syn;

-- index
-- are created on table columns
-- increase performace of queries (select statements)

-- syntax
/*
create [unique] index <index_name> on <table_name> (column_name[,column_name])
*/

--implicit indexes created
    -- when a primary key is created on a column
    -- when a unique constraint is applied to a column
-- performace a query will be good if indexed columns are mentioned in the where clause

select index_name, table_name from user_indexes;

create index char_idx on test_char(char_col)

-- function based index
create index fun_idx on employees(upper(first_name)); -- created when the associated function is frequently used in select statement's where clause

-- meta data
desc USER_INDEXES






