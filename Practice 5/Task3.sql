SELECT *
FROM contr c
         JOIN pers p ON c.pers_id = p.pers_id
WHERE c.depart_id <> p.depart_id
  AND p.depart_id IN (SELECT depart_id
                      FROM depart d
                      START WITH d.depart_id = c.depart_id
                      CONNECT BY PRIOR d.depart_id = d.parent_id)