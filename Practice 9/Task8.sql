CREATE OR REPLACE TRIGGER TRIGGER_EMP_LOG
    AFTER update or delete
    on EMP
    for each row
begin
    if (updating or deleting) then
        insert into EMP_LOG
        VALUES (CURRENT_DATE,
                :old.empno,
                :old.ename,
                :old.job,
                :old.mgr,
                :old.hiredate,
                :old.sal,
                :old.comm,
                :old.deptno);
    end if;
end;