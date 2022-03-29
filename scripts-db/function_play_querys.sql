-- Obtener datos de estudiantes de una obra
SELECT S.student_names,
  student_surnames,
  P.title
FROM student S,
  character_student CS,
  character C,
  play P
WHERE S.student_code = CS.student_code
  AND CS.id_character = C.id_character
  AND C.id_play = P.id_play
  AND P.title = 'Romeo y Julieta';

-- Obtener funcion en determinada fecha y hora
SELECT id_play,
  id_function
FROM function
WHERE function_date = to_date('25/03/2022', 'DD/MM/YYYY')
  AND start_time <= to_date('25/03/2022 09:00', 'DD/MM/YYYY HH24:MI')
  AND end_time >= to_date('25/03/2022 09:00', 'DD/MM/YYYY HH24:MI');

/* id_student_attendance, student_code, id_play, id_function */
-- Insertar en la tabla estudiante-asistencia
INSERT INTO student_attendance (student_code, id_play, id_function)
VALUES ('', '', ''); 

-- Obtener la fecha de la ultima funcion, consultando dias despues de dicha funcion
SELECT id_function
FROM function
WHERE function_date = (SELECT max(function_date)
                       FROM function
                       WHERE id_play = 'RADJ')
  AND id_play = 'RADJ'
  AND function_date < to_date('07/05/2022', 'DD/MM/YYYY');

-- Verificar si hay obras activas
SELECT id_play
FROM play
WHERE state = 1;

-- Obtener la obra activa de un docente
SELECT P.title
FROM play P, stage_play_staff STS, Employee E
WHERE P.id_play = STS.id_play
  AND STS.employee_code = E.employee_code
  AND STS.unit_code = E.unit_code
  AND P.state = 1
  AND E.employee_code = 'SNOD';