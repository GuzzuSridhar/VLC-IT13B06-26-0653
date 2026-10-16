-- DCL - Data Control Language

-- password change
/*
Alter user <user_name> identified by <new_password>; -- Admin
Alter user <user_name> identified by <new_password> replace <old_password>; -- from a logged in session/user
*/

--create user
/*
create user <user_name> identified by <password>;
*/
 -- for the user to login
 /*
    grant session to <user_name>
 */

 -- priveleges
 /*
GRANT privilege [, privilege...]			
TO user [, user| role, PUBLIC...];

-- for a user to perform database tasks
grant create session to <user>; -- allow the user to connect
grant unlimited/size tablespace on <tablespace_name> to <user> -- unless this is given the user will not be able to create objects
grant create table to <user>;
grant create sequence to <user>;
grant view sequence to <user>;
.... with all other required object privileges
 */

 -- Roles
 -- create role <role_name> 
 -- assign permissions to a role rather than a user
 -- Grant create table , create view to <role_name>;
 -- assign the role to user
 -- Grant <role_name> to <user>

 -- Object privileges
 -- grant permission on your own objects
/*
GRANT	object_priv [(columns)]|ALL
 ON		object
 TO		{user|role|PUBLIC}
 [WITH GRANT OPTION];
*/

create table test_dcl(id number, name varchar2(10));

grant 
    select 
on
    test_dcl
to SQLSTUDENT02;

grant 
    select 
on
    test_dcl
to SQLSTUDENT03;

grant 
    select 
on
    test_dcl
to SQLSTUDENT05;

select * from SQLSTUDENT01.test_dcl; -- table name is prefixed with the user_name.table_name
insert into SQLSTUDENT01.test_dcl values(20,'XYZ');

commit;

-- grant insert
grant insert on test_dcl to SQLSTUDENT02, SQLSTUDENT03, SQLSTUDENT05;

-- update
grant update on test_dcl to SQLSTUDENT02, SQLSTUDENT03, SQLSTUDENT05;
grant update(name) on test_dcl to SQLSTUDENT02, SQLSTUDENT03, SQLSTUDENT05;

update SQLSTUDENT01.test_dcl set id = 20;
update SQLSTUDENT01.test_dcl set name = 'ghgh' where id =10;

commit;

/*
grant all on <object> to <user_name>;
*/

create table test_class(id number,name varchar2(20));
grant 
    select 
on
    test_dcl
to SQLSTUDENT01;

select * from SQLSTUDENT02.test_class;
create synonym dam_class for SQLSTUDENT02.test_class; 
select * from dam_class;
insert into dam_class values (10,'abv');
commit;


select * from SQLSTUDENT05.test_class;
select * from SQLSTUDENT03.jeff_class;

create synonym jeff_class for SQLSTUDENT03.jeff_class;
select * from jeff_class;

-- revoke privileges
/*
revoke privilege | ALL on <object> from <user_name>
*/

revoke all on test_dcl from SQLSTUDENT03,SQLSTUDENT02,SQLSTUDENT05;

--dictionary
desc user_tab_privs

select * from user_tab_privs;
select * from user_tab_privs where owner = 'SQLSTUDENT05';

-- pass on grant option
grant select on test_dcl to SQLSTUDENT03,SQLSTUDENT02,SQLSTUDENT05 with grant option;
