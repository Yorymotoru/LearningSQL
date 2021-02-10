SELECT d.DNAME,
       e.ENAME,
       row_number() over (PARTITION BY d.DEPTNO ORDER BY e.ENAME) AS num_in_depart
FROM EMP e
         INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
ORDER BY d.DEPTNO, e.ENAME;
