SELECT d.DIRECTOR_ID,
       (
           SELECT RTRIM(p.LASTNAME) || ' ' ||
                  SUBSTR(p.FIRSTNAME, 1, 1) || '. ' ||
                  SUBSTR(p.MIDDLENAME, 1, 1) || '.' AS fio
           FROM PERS p,
                DEPART
           WHERE d.DIRECTOR_ID = p.PERS_ID
       ) AS director_fio
FROM DEPART d;