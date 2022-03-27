
-- Isertar perona
INSERT INTO person 
VALUES (1321651, 'Juan', 'Bermudez', 'C.C', 'juan@email.com', to_date('15/08/1996','DD/MM/YYYY'))

-- Isertar estudiante
INSERT INTO student VALUES (20161020065, 1321651, 'Ing. Sistemas')

-- Obtener el ultimo registro
SELECT * FROM audition WHERE idaudition=(SELECT max(idaudition) FROM audition)

-- Insertar audicion
INSERT INTO audition (idnumber, code, idplay, dateaudition) 
VALUES (1321651, 20161020065, 1, to_date('2022/02/22 08:00:00', 'yyyy/mm/dd hh24:mi:ss'))

-- Obtener los datos de un estudiante
SELECT S.code, CONCAT(CONCAT(P.idtype, ' '), P.idnumber), 
       CONCAT(CONCAT(P.names, ' '), P.surname), P.email , S.career 
FROM person P, student S WHERE P.idnumber = S.idnumber;

-- Obtener todas las audiciones
SELECT PE.names, PL.title, A.code, A.dateaudition
FROM person PE, play PL, audition A, student S
WHERE PE.idnumber = S.idnumber and S.code = A.code and A.idplay = PL.idplay

-- Insertar Pais
INSERT INTO country VALUES (44, 'United Kingdom')

-- Insertar tipos de obra
INSERT INTO typeplay (nametypeplay) VALUES ('Melodrama')

-- Insertar una obra
INSERT INTO play (idtypeplay, countrycode, title, releasedate) 
VALUES (1, 44, 'Romeo y Julieta', to_date('31/10/1597','DD/MM/YYYY'))
SELECT PE.names, PL.title, A.code, A.dateaudition 
FROM person PE, play PL, audition A, student S 
WHERE PE.idnumber = S.idnumber and S.code = A.code and A.idplay = PL.idplay 
ORDER BY a.dateaudition DESC