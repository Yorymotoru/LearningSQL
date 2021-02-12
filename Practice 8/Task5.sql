SELECT d.DNAME,
       e.ENAME,
       e.SAL - lag(e.SAL) over (ORDER BY e.SAL) AS sal_different
FROM EMP e
         INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
ORDER BY e.SAL;
