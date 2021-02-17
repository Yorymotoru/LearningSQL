CREATE OR REPLACE PACKAGE EMP_RISE
AS

    PROCEDURE rise(p_empno emp.empno%type,
                   p_percent number);
    PROCEDURE rise(p_deptno emp.deptno%type,
                   p_percent number,
                   is_depart boolean);

end EMP_RISE;

CREATE OR REPLACE PACKAGE BODY EMP_RISE
AS

    PROCEDURE rise(p_empno emp.empno%type,
                   p_percent number)
    AS
        v_sal     emp.sal%type;
        v_sal_mgr emp.sal%type;
        v_ename   emp.ename%type;
        v_mgr     emp.mgr%type;
    begin
        SELECT e.SAL, e.ename, e.MGR
        into v_sal, v_ename, v_mgr
        FROM EMP e
        WHERE e.EMPNO = p_empno;
        if (v_mgr is null) then
            v_sal_mgr := 0;
        else
            SELECT e.SAL
            into v_sal_mgr
            FROM EMP e
            WHERE e.EMPNO = (SELECT MGR
                             FROM EMP
                             WHERE EMP.EMPNO = p_empno);
        end if;

        if (v_sal * (1 + p_percent / 100) > v_sal_mgr) then
            dbms_output.put_line(v_ename || ': not to raise');
        else
            dbms_output.put_line(v_ename || ': ' || v_sal * (1 + p_percent / 100));
        end if;
    end;

    PROCEDURE rise(p_deptno emp.deptno%type,
                   p_percent number,
                   is_depart boolean)
    AS
        v_sal emp.sal%type;
    begin

        FOR i IN (SELECT EMPNO
                  FROM EMP
                  WHERE DEPTNO = p_deptno)
            LOOP
                rise(i.EMPNO, p_percent);
            end loop;
    end;

end;
