SELECT UPPER(FIRSTNAME) AS "ИМЯ",
       TRIM(LASTNAME)
           || ' '
           || SUBSTR(FIRSTNAME, 1, 1)
           || '. '
           || SUBSTR(MIDDLENAME, 1, 1)
           || '.'       AS "ФИО"
FROM PERS
WHERE INSTR(FIRSTNAME, 'м') != 0
  AND LENGTH(LASTNAME) < 7;
