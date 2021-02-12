SELECT *
FROM (SELECT d.DNAME,
             e.ENAME,
             e.SAL
      FROM EMP e
               INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
      ORDER BY e.ENAME)
UNION
SELECT NULL,
       'TOTAL:',
       sum(SAL)
FROM EMP;
