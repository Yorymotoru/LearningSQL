SELECT *
FROM (
         SELECT *
         FROM depart d
         WHERE d.MAX_SALARY IN (1000)
            OR d.MIN_SALARY IN (1000)) d1000
WHERE d1000.PARENT_ID IN (1);
