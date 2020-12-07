SELECT depart_id,
       SUM(salary),
       MIN(salary),
       MAX(salary),
       AVG(salary),
       COUNT(pers_id)
FROM pers
GROUP BY depart_id
HAVING COUNT(pers_id) > 15;
--HAVING COUNT(PERS_ID) > 20
SELECT d.*,
       count_pers_id,
       p.sum_salary,
       p.min_salary AS fact_min_salary,
       p.max_salary AS fact_max_salary,
       p.avg_salary
FROM depart d,
     (SELECT depart_id,
             SUM(salary)    AS sum_salary,
             MIN(salary)    AS min_salary,
             MAX(salary)    AS max_salary,
             AVG(salary)    AS avg_salary,
             COUNT(pers_id) AS count_pers_id
      FROM pers
      GROUP BY depart_id
      HAVING COUNT(pers_id) > 15) p
WHERE d.depart_id = p.depart_id
  AND NOT p.avg_salary BETWEEN d.min_salary AND d.max_salary;