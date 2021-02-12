SELECT d.DNAME,
       e.ENAME,
       decode(e.SAL, max(e.SAL) over (PARTITION BY d.DEPTNO), 'boss', NULL) AS is_boss
FROM EMP e
         INNER JOIN DEPT d ON e.DEPTNO = d.DEPTNO
ORDER BY d.DEPTNO, e.ENAME;
