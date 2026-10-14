-- Data dictionary
-- meta data (data about the database)
-- user_ prefix (user owned)
-- ALL_ prefix (what is allowed to be accessed by the used )
-- DBA_ prefix (only the DBA is allowed acced to these tables)

desc dictionary;

select * from DICTIONARY where table_name='USER_OBJECTS';
desc user_objects;

select object_name, object_type, status from user_objects;

--user_tables
desc user_tables
select table_name from user_tables;
--user_tab_columns
desc user_tab_columns
select table_name from user_tables;
select table_name, column_name from user_tab_columns;

-- all_tables
select table_name from all_tables;
-- all_tab_columns
select table_name, column_name from all_tab_columns;

-- looking for constraints
desc user_constraints
desc user_cons_columns;

select constraint_name, constraint_type, search_condition from user_constraints where lower(table_name)='employees';
select constraint_name, column_name, table_name from user_cons_columns where table_name = 'EMPLOYEES';

-- creating comments on tables
comment on table employees is 'information of all the employees in the organiztion';
-- creating comments on columns
comment on column employees.first_name is 'First name of the employee';
-- read the comments
desc user_tab_comments
select table_name, comments from user_tab_comments;
desc user_col_comments
select table_name, column_name, comments from user_col_comments;

