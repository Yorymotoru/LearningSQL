CREATE INDEX contr_test_i$depart_id
ON CONTR_TEST (DEPART_ID, PERS_ID, BEG_DATE);

-----

SELECT * FROM contr c, depart d
WHERE d.depart_id = 7 AND c.depart_id = d.depart_id;

SELECT * FROM contr_test c, depart d
WHERE d.depart_id = 7 AND c.depart_id = d.depart_id;

SELECT beg_date FROM contr WHERE pers_id = 1;

SELECT beg_date FROM contr_test WHERE pers_id = 1;
