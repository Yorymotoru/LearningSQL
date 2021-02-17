CREATE OR REPLACE FUNCTION total_pay(sal in number, bonus in number) RETURN NUMBER
AS
begin
    if (sal is NULL) then
        return NULL;
    else
        return sal + sal * (nvl(bonus,0) / 100);
    end if;
end;

begin
    dbms_output.put_line(total_pay(1000, 10));
    dbms_output.put_line(total_pay(1000, null));
    dbms_output.put_line(total_pay(null, null));
    dbms_output.put_line(nvl(total_pay(null, null), 0));
end;