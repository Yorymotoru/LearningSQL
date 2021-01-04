SELECT *
FROM (SELECT d.dname, e.ename, e.sal
      FROM dept d,
           emp e
      WHERE e.deptno = d.deptno
      ORDER BY e.ename)
UNION
SELECT NULL,
       'TOTAL:',
       sum(sal)
FROM emp