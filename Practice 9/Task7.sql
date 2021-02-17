CREATE OR REPLACE PACKAGE TOP_SALE_EMP
AS
    PROCEDURE TOP_EMP(n number);
end;

CREATE OR REPLACE PACKAGE BODY TOP_SALE_EMP
AS
    PROCEDURE TOP_EMP(n number)
    AS
        c number;
    begin
        SELECT count(*)
        into c
        FROM user_tables
        WHERE table_name = 'TOP_EMP';
        if (c > 0) then
            execute immediate 'DROP TABLE TOP_EMP';
        end if;
        execute immediate 'CREATE TABLE TOP_EMP
                           (
                               name varchar2(10),
                               sal  number(7, 2)
                           )';

        FOR i in (SELECT *
                  FROM (SELECT e.ENAME, e.SAL
                        FROM EMP e
                        ORDER BY e.sal DESC)
                  WHERE rownum <= n)
            LOOP
                INSERT INTO TOP_EMP VALUES (i.ENAME, i.SAL);
            end loop;

    exception
        when OTHERS then
            raise;
    end;
end;