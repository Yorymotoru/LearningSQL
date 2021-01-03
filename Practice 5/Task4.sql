SELECT p.pers_id,
       p.firstname || ' ' || p.lastname || ' ' || p.middlename AS pers_fio,
       c.contr_amount,
       d.depart_path,
       p.depart_id,
       (SELECT (SELECT lastname || ' ' || SUBSTR(firstname, 1, 1)
                           || '. ' || SUBSTR(middlename, 1, 1) || '.'
                FROM pers pp
                WHERE pp.pers_id = dd.director_id)
        FROM depart dd
        WHERE dd.depart_id = p.depart_id)                      AS director_fio
FROM pers p,
     -- Возвращает depart_id и его "путь"
     (SELECT depart_id, SYS_CONNECT_BY_PATH(name, '/') AS depart_path
      FROM depart
      START WITH parent_id IS NULL
      CONNECT BY PRIOR depart_id = parent_id) d,

     -- Возвращает pers_id и сумму заключённых им контрактов для подразделений логистики и входящих в него подразделений
     (SELECT pers_id, SUM(amount) AS contr_amount
      FROM contr
      WHERE depart_id IN (SELECT depart_id
                          FROM depart
                          START WITH depart_id = 4
                          CONNECT BY PRIOR depart_id = parent_id)
      GROUP BY pers_id) c
WHERE p.pers_id = c.pers_id
  AND p.depart_id = d.depart_id
  -- Для подразделений в которых 1500 входит в промежуток между минимальной и максимальной зарплатой
  AND p.depart_id IN (SELECT depart_id
                      FROM depart
                      WHERE 1500 BETWEEN min_salary AND max_salary)
ORDER BY hire_date;
