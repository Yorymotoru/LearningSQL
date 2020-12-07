SELECT *
FROM CONTR c,
     PERS p
WHERE c.PERS_ID = p.PERS_ID
  AND (p.DEPART_ID = 1 OR p.DEPART_ID IN (SELECT d.DEPART_ID
                                          FROM DEPART d
                                          WHERE d.PARENT_ID = 1));