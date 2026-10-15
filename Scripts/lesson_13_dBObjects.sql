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






