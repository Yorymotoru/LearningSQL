SELECT d.dname,
       e.ename,
       (SELECT 'boss'
        FROM DUMMY
        WHERE e.sal = (SELECT MAX(sal)
                       FROM emp
                       WHERE deptno = e.deptno)) AS IS_BOSS
FROM dept d,
     emp e
WHERE d.deptno = e.deptno
ORDER BY d.dname