SELECT DEPART_ID,
       SUM(SALARY),
       MIN(SALARY),
       MAX(SALARY),
       AVG(SALARY),
       COUNT(PERS_ID)
FROM pers
GROUP BY depart_id
HAVING COUNT(PERS_ID) > 15
--HAVING COUNT(PERS_ID) > 20
UNION
SELECT *
FROM depart d,
     (SELECT *
      FROM pers
      GROUP BY depart_id
      HAVING COUNT(PERS_ID) > 15) p
WHERE d.depart_id = p.depart_id
  AND NOT p.avg_salary