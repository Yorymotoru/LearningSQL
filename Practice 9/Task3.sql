CREATE OR REPLACE PACKAGE emp_copy_functions
AS
    PROCEDURE new_emp(ename_f emp.ename%type,
                      job_f emp.job%type,
                      mgr_f emp.mgr%type,
                      sal_f emp.sal%type,
                      comm_f emp.comm%type,
                      deptno_f emp.deptno%type);
    FUNCTION get_emp(empno_f emp.empno%type,
                     ename_f emp.ename%type,
                     hiredate_f emp.hiredate%type,
                     sal_f emp.sal%type,
                     deptno_f emp.deptno%type) return emp_copy%rowtype;
    FUNCTION del_emp(empno_f emp.empno%type,
                     ename_f emp.ename%type,
                     hiredate_f emp.hiredate%type,
                     sal_f emp.sal%type,
                     deptno_f emp.deptno%type) return number;
end emp_copy_functions;

CREATE OR REPLACE PACKAGE BODY emp_copy_functions
IS
    PROCEDURE new_emp(ename_f emp.ename%type,
                      job_f emp.job%type,
                      mgr_f emp.mgr%type,
                      sal_f emp.sal%type,
                      comm_f emp.comm%type,
                      deptno_f emp.deptno%type)
    AS
        empno_f  emp.empno%type;
        v_deptno emp.deptno%type;
    begin
        SELECT max(e.EMPNO)
        into empno_f
        FROM EMP_COPY e;
        empno_f := empno_f + 1;

        if (deptno_f is null) then
            SELECT DEPTNO
            into v_deptno
            FROM (SELECT e.DEPTNO, count(1)
                  FROM EMP_COPY e
                  GROUP BY e.DEPTNO
                  ORDER BY count(e.DEPTNO))
            WHERE ROWNUM = 1;
        else
            v_deptno := deptno_f;
        end if;

        INSERT INTO EMP_COPY VALUES (empno_f, ename_f, job_f, mgr_f, CURRENT_DATE, sal_f, comm_f, v_deptno);
    end;

    FUNCTION get_emp(empno_f emp.empno%type,
                     ename_f emp.ename%type,
                     hiredate_f emp.hiredate%type,
                     sal_f emp.sal%type,
                     deptno_f emp.deptno%type) return emp_copy%rowtype
    AS
        out emp_copy%rowtype;
    begin
        if (empno_f is NULL) then
            SELECT *
            into out
            FROM EMP_COPY e
            WHERE ename_f = e.ENAME
              AND hiredate_f = e.HIREDATE
              AND deptno_f = e.DEPTNO
              AND sal_f = e.SAL;
        else
            SELECT *
            into out
            FROM EMP_COPY e
            WHERE e.EMPNO = empno_f;
        end if;
        return out;
    end;

    FUNCTION del_emp(empno_f emp.empno%type,
                     ename_f emp.ename%type,
                     hiredate_f emp.hiredate%type,
                     sal_f emp.sal%type,
                     deptno_f emp.deptno%type) return number
    AS
    begin
        if (empno_f is NULL) then
            DELETE
            FROM EMP_COPY e
            WHERE ename_f = e.ENAME
              AND hiredate_f = e.HIREDATE
              AND deptno_f = e.DEPTNO
              AND sal_f = e.SAL;
        else
            DELETE
            FROM EMP_COPY e
            WHERE e.EMPNO = empno_f;
        end if;

        return sql%rowcount;
    end;

end emp_copy_functions;

-- BEGIN
--     EMP_COPY_FUNCTIONS.NEW_EMP('NAME1', 'JOB1', 7934, 1111, null, 20);
--     EMP_COPY_FUNCTIONS.NEW_EMP('NAME2', 'JOB2', 7934, 2222, null, null);
--
--     EMP_COPY_FUNCTIONS.GET_EMP(15, 'NAME1', '', 1111, 20);
--     EMP_COPY_FUNCTIONS.GET_EMP(null, 'NAME2', '', 2222, 10);
--
--     dbms_output.put_line(EMP_COPY_FUNCTIONS.DEL_EMP(15, 'NAME1', '', 1111, 20));
--     dbms_output.put_line(EMP_COPY_FUNCTIONS.DEL_EMP(null, 'NAME2', '', 2222, 10));
-- END;