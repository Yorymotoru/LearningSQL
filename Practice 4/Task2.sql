DELETE FROM PERS WHERE PERS_ID > 106;

INSERT INTO PERS -- 1
    (SELECT PERS_SEQ$PERS_ID.nextval,
            6,
            'Христодул',
            'Устименко' || PERS_SEQ$PERS_ID.currval,
            'Романович',
            CURRENT_DATE,
            1100
     FROM DUMMY);

INSERT INTO PERS -- 2
    (SELECT PERS_SEQ$PERS_ID.nextval,
            4,
            'Овсей',
            'Львов' || PERS_SEQ$PERS_ID.currval,
            'Галактионович',
            CURRENT_DATE,
            900
     FROM DUMMY);

INSERT INTO PERS -- 3
    (SELECT PERS_SEQ$PERS_ID.nextval,
            6,
            'Эдуард',
            'Ардабьев' || PERS_SEQ$PERS_ID.currval,
            'Альфредович',
            CURRENT_DATE,
            1200
     FROM DUMMY);

INSERT INTO PERS -- 4
    (SELECT PERS_SEQ$PERS_ID.nextval,
            3,
            'Гай',
            'Одоевский' || PERS_SEQ$PERS_ID.currval,
            'Наркисович',
            CURRENT_DATE,
            800
     FROM DUMMY);

INSERT INTO PERS -- 5
    (SELECT PERS_SEQ$PERS_ID.nextval,
            3,
            'Олег',
            'Рюмин' || PERS_SEQ$PERS_ID.currval,
            'Романович',
            CURRENT_DATE,
            1300
     FROM DUMMY);

INSERT INTO PERS -- 6
    (SELECT PERS_SEQ$PERS_ID.nextval,
            7,
            'Протасий',
            'Горталов' || PERS_SEQ$PERS_ID.currval,
            'Дормедонтович',
            CURRENT_DATE,
            700
     FROM DUMMY);

INSERT INTO PERS -- 7
    (SELECT PERS_SEQ$PERS_ID.nextval,
            3,
            'Валериан',
            'Никольский' || PERS_SEQ$PERS_ID.currval,
            'Аггеевич',
            CURRENT_DATE,
            1200
     FROM DUMMY);

INSERT INTO PERS -- 8
    (SELECT PERS_SEQ$PERS_ID.nextval,
            2,
            'Фома',
            'Юренев' || PERS_SEQ$PERS_ID.currval,
            'Кирьякович',
            CURRENT_DATE,
            1000
     FROM DUMMY);

INSERT INTO PERS -- 9
    (SELECT PERS_SEQ$PERS_ID.nextval,
            8,
            'Митрофан',
            'Бородин' || PERS_SEQ$PERS_ID.currval,
            'Лукьянович',
            CURRENT_DATE,
            900
     FROM DUMMY);

INSERT INTO PERS -- 10
    (SELECT PERS_SEQ$PERS_ID.nextval,
            1,
            'Януарий',
            'Харченко' || PERS_SEQ$PERS_ID.currval,
            'Еремеевич',
            CURRENT_DATE,
            1500
     FROM DUMMY);

SELECT *
FROM PERS;