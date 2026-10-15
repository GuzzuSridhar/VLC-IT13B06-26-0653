-- all table records are deleted.
truncate table test_bool; -- DDL command (applies implicit commit, cannot be undone)
delete from emp; -- DML command ( can be rolled back)

