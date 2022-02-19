
-- Isertar perona
INSERT INTO person 
VALUES (1321651, 'Juan', 'Bermudez', 'C.C', 'juan@email.com', to_date('31/10/2007','DD/MM/YYYY'))

-- Isertar estudiante
INSERT INTO student VALUES (20161020065, 1321651, 'Ing. Sistemas');

-- Obtener el ultimo registro
SELECT * FROM audition WHERE idaudition=(SELECT max(idaudition) FROM audition);

-- Insertar audicion
INSERT INTO audition (code, idplay, dateaudition) 
VALUES (1321651, 1, timestamp '20/02/2022 08:00','DD/MM/YYYY HH:MI');

-- Obtener los datos de un estudiante
SELECT P.names, P.surname, S.code, S.career FROM person P, student S WHERE P.idnumber = S.idnumber 

-- Obtener todas las audiciones
SELECT PE.names, PL.title, A.code, A.dateaudition
FROM person PE, play PL, audition A, student S
WHERE PE.idnumber = S.idnumber and S.code = A.code and A.idplay = PL.idplay