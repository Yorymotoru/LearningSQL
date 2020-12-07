SELECT *
FROM depart
WHERE (parent_id = 4 AND (min_salary < 800 OR max_salary <= 1000))
   OR (parent_id = 1 AND (max_salary <= 1000 AND min_salary <= 600));