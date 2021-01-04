WITH emp_sorted_by_sal AS (SELECT d.dname,
                                  e.*
                           FROM emp e,
                                dept d
                           WHERE e.deptno = d.deptno
                           ORDER BY e.sal)

SELECT e.DNAME,
       e.ENAME,
       e.sal - LAG(e.SAL) over (ORDER BY e.SAL) AS SAL_DIFF
FROM emp_sorted_by_sal e