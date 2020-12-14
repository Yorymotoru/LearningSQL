SELECT *
FROM CONTR
WHERE PERS_ID IN (SELECT p.PERS_ID
                  FROM PERS p
                  WHERE p.DEPART_ID IN (SELECT d.DEPART_ID
                                        FROM DEPART d
                                        WHERE d.PARENT_ID = 4))
  AND EXISTS(SELECT p.PERS_ID
             FROM PERS p
             WHERE p.SALARY < 1000);