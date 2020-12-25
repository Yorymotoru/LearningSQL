SELECT MAX (p.PERS_ID)
    FROM PERS p;

--Выполнив запрос получаем число 106, записываем 107

CREATE SEQUENCE pers_seq$pers_id
    START WITH 107
    INCREMENT BY 1;