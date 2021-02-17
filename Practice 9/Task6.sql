CREATE OR REPLACE PROCEDURE UPDATE_DEPTNO(p_loc dept.loc%type,
                                          p_deptno dept.deptno%type)
AS
    v_old_deptno dept.deptno%type;
begin
    SELECT DEPTNO
    into v_old_deptno
    FROM DEPT
    WHERE LOC = p_loc;

    UPDATE DEPT
    SET DEPTNO = p_deptno
    WHERE DEPTNO = v_old_deptno;

    UPDATE EMP
    SET DEPTNO = p_deptno
    WHERE DEPTNO = v_old_deptno;

    EXCEPTION
    when no_data_found then
        dbms_output.put_line('This location not found');
end;