SELECT d.*, LEVEL, SYS_CONNECT_BY_PATH(name, '/') AS PATH
FROM depart d
START WITH parent_id is null
CONNECT BY PRIOR depart_id = parent_id
ORDER SIBLINGS BY name DESC
