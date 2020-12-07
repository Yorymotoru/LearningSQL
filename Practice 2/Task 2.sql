SELECT FIRSTNAME                                                     AS "Имя",
       LASTNAME                                                      AS "Фамилия",
       MIDDLENAME                                                    AS "Отчество",
       TO_DATE(TO_CHAR(HIRE_DATE, 'DD.MM') || '.2010')               AS "Дата приёма",
       --TO_CHAR(HIRE_DATE, 'YYYY-MM')                               AS "Дата приёма",
       REPLACE(TO_CHAR(TRUNC(HIRE_DATE, 'MM'), 'YYYY.MM'), '.', '-') AS "Дата приёма"
FROM PERS
WHERE TO_NUMBER(TO_CHAR(HIRE_DATE, 'DD')) < 5;
