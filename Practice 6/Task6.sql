WITH str AS (select 'b' AS s from dual union all
             select 'aaa' from dual union all
             select 'cccc' from dual union all
             select 'dd' from dual),
     tab AS (SELECT s AS s,
                    ROWNUM AS rn
             FROM str)
SELECT LAG(NVL(s,'')) over (ORDER BY rn) || s
FROM tab;
