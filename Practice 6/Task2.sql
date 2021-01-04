SELECT d.dname,
       e.ename,
       ROW_NUMBER() over (PARTITION BY d.DNAME ORDER BY e.deptno, e.empno) ROW_N
FROM emp e,
     dept d
WHERE d.deptno = e.deptno