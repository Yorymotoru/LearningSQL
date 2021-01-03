-- USING IN
SELECT *
FROM pers
WHERE depart_id IN (SELECT depart_id
                    FROM depart
                    START WITH depart_id = 4
                    CONNECT BY PRIOR depart_id = parent_id);

-- USING EXISTS
SELECT *
FROM pers p
WHERE EXISTS(SELECT NULL
             FROM depart d
             WHERE p.depart_id = d.depart_id
             START WITH d.depart_id = 4
             CONNECT BY PRIOR d.depart_id = d.parent_id);
