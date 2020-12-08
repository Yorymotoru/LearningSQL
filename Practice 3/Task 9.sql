SELECT *
FROM emp e
WHERE e.sal > (SELECT SAL
    FROM emp
    WHERE EMPNO = e.MGR)