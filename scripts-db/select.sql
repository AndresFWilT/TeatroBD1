--Ver estudiantes
SELECT s.student_code, s.student_names||' '||s.student_surnames, s.email_address2, u.uni_name 
FROM student s, unit u
WHERE s.unit_code = u.unit_code;

--Validar Email
SELECT em.identification_number 
    FROM EMPLOYEE em WHERE em.email_address like 'sonia@correo.com';

--Validación empleado
SELECT em.names, em.surnames, em.email_address, 
    to_char(SYSDATE,'DD/MM/YYYY HH24:MI'), em.employee_code
FROM EMPLOYEE em, DUAL WHERE em.email_address like 'sonia@correo.com';

--Datos empleado
SELECT P.title
    FROM play P, stage_play_staff STS, Employee E
    WHERE P.id_play = STS.id_play
    AND STS.employee_code = E.employee_code
    AND STS.unit_code = E.unit_code
    AND P.state = 1
    AND E.employee_code = 'SNOD';

--Habilitar botón asistencia
SELECT id_play, id_function
FROM function
WHERE function_date = to_date('{29/03/2022 09:00[:10]}', 'DD/MM/YYYY')
    AND start_time <= (to_date('29/03/2022 09:00', 'DD/MM/YYYY HH24:MI'))
    AND end_time >= (to_date('29/03/2022 09:00', 'DD/MM/YYYY HH24:MI'));

--travel expenses -- costos de viaje
SELECT id_function
FROM function
WHERE function_date = (SELECT max(function_date)
FROM function
WHERE id_play = 'RNDJ')
    AND id_play = 'RNDJ'
    AND function_date < to_date('{29/03/2022 09:00[:10]}', 'DD/MM/YYYY')

--viaticos: Suma de horas en la obra y cantidad de seciones que participo
select distinct                                    
    s.student_names || ' ' ||
    s.student_surnames,
    s.student_code,
    COUNT(sa.student_code),
    SUM(to_char(f.END_TIME,'HH24') - to_char(f.START_TIME,'HH24'))
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
    and pl.id_play = 'RADJ'
    and f.id_play=sa.id_play
    and f.id_function=sa.id_function
    and sa.student_code=s.student_code
    AND EP.id_term = T.id_term
    AND EP.id_play = pl.id_play
group by s.student_names||' '||
    s.student_surnames,
    s.student_code;

--Liquidación empleados

select e.names || ' ' ||
    e.surnames,
    e.identification_number,
    DU.uni_name
from employee e,
    Unit u,
    unit DU
where e.unit_code = u.unit_code
    AND e.email_address = 'sonia@correo.com'
    AND u.dependency_unit = DU.unit_code

--viaticos: datos para traer el día, cuando inicio y finalizo la obra

SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY'), TO_CHAR(min(F.function_date), 'DD/MM/YYYY'), 
    TO_CHAR(max(function_date), 'DD/MM/YYYY'), P.title
FROM function F, play P
WHERE F.id_play = 'RADJ'
    AND F.id_play = P.id_play
GROUP BY P.title

-- Datos para la generación de los viaticos

select distinct                                    
    s.student_names || ' ' ||
    s.student_surnames,
    s.student_code,
    s.email_address2,
    COUNT(sa.student_code),
    SUM(to_char(f.END_TIME,'HH24') - to_char(f.START_TIME,'HH24')),
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
    and pl.id_play = 'RADJ'
    and f.id_play=sa.id_play
    and f.id_function=sa.id_function
    and sa.student_code=s.student_code
    AND EP.id_term = T.id_term
    AND EP.id_play = pl.id_play
group by s.student_names||' '||
    s.student_surnames,
    s.student_code,
    T.term_desc,
    s.email_address2;

--Obra docente
Select p.title
from  play p, Stage_Play_Staff sps, employee e
where p.id_play=sps.id_play
    and sps.employee_code=e.employee_code
    and sps.unit_code=e.unit_code
    and e.email_address like 'sonia@correo.com';

--Certificado: obra estudiantes generales
select DISTINCT p.title, 
    s.student_names|| ' ' || s.student_surnames,
    e.names || ' '|| e.surnames, 
    t.term_desc, 
    c.character_name, 
    s.email_address2,
    u.uni_name,
    e.identification_number,
    s.student_code
from play p, 
    employee e, 
    term t, 
    student s, 
    Character c, 
    character_student cs, 
    Stage_Play_Staff sps, 
    activity_list al,
    work_play_staff wps,  
    unit u,    
    student_attendance sa
where p.id_play = c.id_play
    and c.id_Character=cs.id_Character
    and c.id_play=cs.id_play
    and cs.student_code=s.student_code
    and p.title = 'Romeo y Julieta'
    and sps.id_play=p.id_play
    and e.unit_code=sps.unit_code
    and e.employee_code=sps.employee_code
    and wps.unit_code=sps.unit_code
    and wps.employee_code=sps.employee_code
    and wps.id_sta_pla_staff=sps.id_sta_pla_staff
    and wps.activity_code = 'DRTR1'
    and al.id_term=wps.id_term
    and al.activity_code=wps.activity_code
    and t.id_term=al.id_term
    and s.unit_code=u.unit_code
    and sa.student_code = s.student_code;

--Certificado: filtro de las Obras del estudiante por codigo
select p.title, s.student_code
from play p, Character c, character_student cs, student S
where p.id_play = c.id_play
    and c.id_Character=cs.id_Character
    and c.id_play=cs.id_play
    and cs.student_code=s.student_code
    and s.student_code = '20172020068';


--Obras por profesor
Select p.title
from  play p, Stage_Play_Staff sps, employee e
where p.id_play=sps.id_play
    and sps.employee_code=e.employee_code
    and sps.unit_code=e.unit_code
    and e.email_address like 'sonia@correo.com'

--obra estudiante por codigo
select p.title, 
    s.student_names|| ' ' || s.student_surnames,
    e.names || ' '|| e.surnames, 
    t.term_desc, 
    c.character_name, 
    s.email_address2,
    u.uni_name,
    e.identification_number
from play p, 
    employee e, 
    term t, 
    student s, 
    Character c, 
    character_student cs, 
    Stage_Play_Staff sps, 
    activity_list al,
    work_play_staff wps,  
    unit u     
where p.id_play = c.id_play
    and c.id_Character=cs.id_Character
    and c.id_play=cs.id_play
    and cs.student_code=s.student_code
    and s.student_code = '20172020068'
    and p.title = 'Romeo y Julieta'
    and sps.id_play=p.id_play
    and e.unit_code=sps.unit_code
    and e.employee_code=sps.employee_code
    and wps.unit_code=sps.unit_code
    and wps.employee_code=sps.employee_code
    and wps.id_sta_pla_staff=sps.id_sta_pla_staff
    and wps.activity_code = 'DRTR1'
    and al.id_term=wps.id_term
    and al.activity_code=wps.activity_code
    and t.id_term=al.id_term
    and s.unit_code=u.unit_code;

--Asistencia: Datos del estudiante por obras
SELECT S.student_code, student_names||' '||student_surnames,email_address2, U.uni_name
FROM student S, character_student CS, character C, play P, unit U
WHERE S.unit_code like U.unit_code
    AND S.student_code = CS.student_code
    AND CS.id_character = C.id_character
    AND C.id_play = P.id_play
    AND P.id_play = 'RADJ';

--Asistencia: Verificación Código estudiante
SELECT ea.id_student_attendance
FROM student_attendance ea, student s
WHERE s.student_code = '20172020068'
    AND ea.student_code = '20172020068'
    AND ea.id_function = '2';

--todas las asistencias
SELECT S.student_code
FROM student S, character_student CS, character C, play P, unit U
WHERE S.unit_code like U.unit_code
    AND S.student_code = CS.student_code
    AND CS.id_character = C.id_character
    AND C.id_play = P.id_play
    AND P.id_play like 'RADJ';

--Insertar asistencia
INSERT INTO student_attendance (student_code, id_play, id_function) 
VALUES ('20172020068', 'RADJ', '3');
