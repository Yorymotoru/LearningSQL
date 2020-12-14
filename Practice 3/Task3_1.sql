SELECT d.DIRECTOR_ID,
       director_fio.FIO
FROM DEPART d,
     (SELECT RTRIM(p.LASTNAME) || ' ' ||
             SUBSTR(p.FIRSTNAME, 1, 1) || '. ' ||
             SUBSTR(p.MIDDLENAME, 1, 1) || '.' AS fio,
             DIRECTOR_ID
      FROM PERS p,
           DEPART
      WHERE DIRECTOR_ID = p.PERS_ID
     ) director_fio
WHERE d.DIRECTOR_ID = director_fio.DIRECTOR_ID;
