CREATE OR REPLACE PROCEDURE new_emp(ename emp.ename%type,
                                    job emp.job%type,
                                    mgr emp.mgr%type,
                                    sal emp.sal%type,
                                    comm emp.comm%type,
                                    deptno emp.deptno%type)
AS
    empno emp.empno%type;
begin
    SELECT max(e.EMPNO)
    into empno
    FROM EMP e;
    empno := empno + 1;
    INSERT INTO EMP VALUES (empno, ename, job, mgr, CURRENT_DATE, sal, comm, deptno);
end;

BEGIN
    NEW_EMP('NAME', 'JOB', 7934, 1111, null, 10);
END;

SELECT *
FROM EMP
ORDER BY EMPNO;