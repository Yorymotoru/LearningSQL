CREATE OR REPLACE PROCEDURE emp_message(p_empno emp.empno%type)
AS
    v_flag number;
    v_ename emp.ename%type;
    v_hiredate emp.hiredate%type;
    v_sal emp.sal%type;
begin
    v_flag := 0;

    SELECT e.ENAME, e.HIREDATE, e.SAL
    into v_ename, v_hiredate, v_sal
    FROM EMP e
    WHERE e.EMPNO = p_empno;

    if (regexp_count(v_ename, '[rR]') > 0) then
        dbms_output.put_line('Name contains R');
        v_flag := 1;
    end if;

    if (to_char(v_hiredate, 'mm') = '03') then
        dbms_output.put_line('March start date');
        v_flag := 1;
    end if;

    if (v_sal > 1200) then
        dbms_output.put_line('Salary>1200');
        v_flag := 1;
    end if;

    if (v_flag = 0) then
        dbms_output.put_line('**None**');
    end if;

end emp_message;