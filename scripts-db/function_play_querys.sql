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
SELECT DISTINCT P.id_play
FROM play P, function F
WHERE state = 1
  AND F.id_play = P.id_play
  AND to_date('05/05/2022', 'DD/MM/YYYY') > (SELECT max(function_date)
                                             FROM function
                                             WHERE id_play = 'RADJ');

-- Obtener la obra activa de un docente
SELECT P.title
FROM play P, stage_play_staff STS, Employee E
WHERE P.id_play = STS.id_play
  AND STS.employee_code = E.employee_code
  AND STS.unit_code = E.unit_code
  AND P.state = 1
  AND E.employee_code = 'SNOD';

-- Obtener listado de sesiones en las que participo un estudiante
-- Obtener datos de estudiantes de una obra
SELECT S.student_names,
  student_surnames,
FROM student S,
  character_student CS,
  character C,
  play P
WHERE S.student_code = CS.student_code
  AND CS.id_character = C.id_character
  AND C.id_play = P.id_play
  AND P.id_play = 'RADJ';
-- Obtener num de sesiones de un estudiante
SELECT COUNT(student_code)
FROM student_attendance SA
WHERE SA.student_code = '20172020071'
  AND id_play = 'RADJ';
-- Obtener num de horas de un estudiante
SELECT ST.student_code sum(to_char(F.end_time, 'HH24') - to_char(F.start_time, 'HH24'))
FROM function F, student_attendance ST
WHERE ST.id_play = F.id_play
  AND ST.id_function = F.id_function;


SELECT COUNT(student_code)
FROM student_attendance SA
WHERE SA.student_code = '20172020071'
  AND id_play = 'RADJ';
-- Obtener num de horas de un estudiante
SELECT to_char(to_date(to_char(F.end_time, 'HH24'), 'HH24'), 'HH24'), 
      to_char(to_date(to_char(F.start_time, 'HH24'), 'HH24'), 'HH24')
FROM function F;

-- Estudiantes con asistencias
select distinct 
       pl.title,
       s.student_names || ' ' ||
       s.student_surnames,
       s.student_code,
       u.uni_name,
       SUM(to_char(f.END_TIME,'HH24') - to_char(f.START_TIME,'HH24')),
       COUNT(sa.student_code),
       T.term_desc             
from Play pl,
     Student s,
     Character c,
     character_student cs,
     unit u,
     function f,
     Student_Attendance sa,
     expend_play EP,
     term T
where pl.id_play = c.id_play
       and c.id_character = cs.id_character
       and c.id_play = cs.id_play
       and cs.student_code = s.student_code       
       and s.unit_code = u.unit_code
       and pl.title = 'Romeo y Julieta'
       and f.id_play=sa.id_play
       and f.id_function=sa.id_function
       and sa.student_code=s.student_code
       AND EP.id_term = T.id_term
       AND EP.id_play = pl.id_play
group by pl.title,
       s.student_names, 
       s.student_surnames,
       s.email_address2,
       s.student_code,
       u.uni_name,
       T.term_desc;

-- Obtener la fecha de la ultima funcion, consultando dias despues de dicha funcion
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY'), TO_CHAR(min(F.function_date), 'DD/MM/YYYY'), 
                TO_CHAR(max(function_date), 'DD/MM/YYYY'), P.title
FROM function F, play P
WHERE F.id_play = 'RADJ'
  AND F.id_play = P.id_play
GROUP BY P.title;

SELECT id_function
FROM function
WHERE function_date = (SELECT min(function_date)
                       FROM function
                       WHERE id_play = 'RADJ')
  AND id_play = 'RADJ';

Select p.title
from  play p, Stage_Play_Staff sps, employee e
where p.id_play=sps.id_play
       and sps.employee_code=e.employee_code
       and sps.unit_code=e.unit_code
       and e.email_address='sonia@correo.com';