WITH dept_with_sal_sum AS (SELECT e.deptno, d.dname, SUM(e.sal) AS sal_sum
                           FROM dept d,
                                emp e
                           WHERE e.deptno(+) = d.deptno
                           GROUP BY e.deptno, d.dname)

SELECT d.dname,
       e.ename,
       ROUND(e.sal/d.sal_sum, 2)
FROM dept_with_sal_sum d,
     emp e
WHERE e.deptno(+) = d.deptno;