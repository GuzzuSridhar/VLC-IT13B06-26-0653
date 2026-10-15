-- GTT  & PTT
-- Global Temporary table
-- Private Temporary table

--step 1
create global temporary table temp_emp (
    emp_id number,
    name varchar(50),
    salary number(5,2)
) ON COMMIT PRESERVE ROWS; -- (or) ON COMMITT DELETE ROWS

-- step 2
insert into temp_emp values(100,'Alex',100);
insert into temp_emp values(101,'Bill',101);
insert into temp_emp values(102,'Adam',120);

select * from temp_emp;

commit;

drop table temp_emp;

-- step 3 
-- disconnect and connect back to the DB
-- the records will not be seen

--Private temporary table ( name has to start with ora$ptt)
create PRIVATE temporary table ora$ptt_tab
( id number) ON COMMIT DROP DEFINITION; -- (or) on commit preserve definition

insert into ora$ptt_tab values (100);

select * from  ora$ptt_tab;

commit;

drop table ora$ptt_tab;



