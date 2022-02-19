
-- Isertar perona
INSERT INTO person VALUES (1321651, 'Juan', 'Bermudez', 'C.C', 'juan@email.com', to_date('31/10/2007','DD/MM/YYYY'))

-- Isertar estudiante
INSERT INTO student VALUES (20161020065, 1321651, 'Ing. Sistemas');

-- Obtener el ultimo registro
SELECT * FROM audition WHERE idaudition=(SELECT max(idaudition) FROM audition);

INSERT INTO audition (code, idplay, dateaudition) VALUES (1321651, 1, timestamp '20/02/2022 08:00','DD/MM/YYYY HH:MI');