-- Insertar persona
INSERT INTO person
VALUES (
              1321651,
              'Juan',
              'Bermudez',
              'C.C',
              'juan@email.com',
              to_date('15/08/1996', 'DD/MM/YYYY')
       ) -- Isertar estudiante
INSERT INTO student
VALUES (20161020065, 1321651, 'Ing. Sistemas') -- Obtener el ultimo registro
SELECT *
FROM audition
WHERE idaudition =(
              SELECT max(idaudition)
              FROM audition
       ) -- Insertar audicion
INSERT INTO audition (idnumber, code, idplay, dateaudition)
VALUES (
              1321651,
              20161020065,
              1,
              to_date('2022/02/22 08:00:00', 'yyyy/mm/dd hh24:mi:ss')
       ) -- Obtener los datos de un estudiante
SELECT S.code,
       CONCAT(CONCAT(P.idtype, ' '), P.idnumber),
       CONCAT(CONCAT(P.names, ' '), P.surname),
       P.email,
       S.career
FROM person P,
       student S
WHERE P.idnumber = S.idnumber;
-- Obtener todas las audiciones
<<<<<<< HEAD
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

=======
SELECT PE.names,
       PL.title,
       A.code,
       A.dateaudition
FROM person PE,
       play PL,
       audition A,
       student S
WHERE PE.idnumber = S.idnumber
       and S.code = A.code
       and A.idplay = PL.idplay -- Insertar Pais
INSERT INTO country
VALUES (44, 'United Kingdom') -- Insertar tipos de obra
INSERT INTO typeplay (nametypeplay)
VALUES ('Melodrama') -- Insertar una obra
INSERT INTO play (idtypeplay, countrycode, title, releasedate)
VALUES (
              1,
              44,
              'Romeo y Julieta',
              to_date('31/10/1597', 'DD/MM/YYYY')
       )
SELECT PE.names,
       PL.title,
       A.code,
       A.dateaudition
FROM person PE,
       play PL,
       audition A,
       student S
WHERE PE.idnumber = S.idnumber
       and S.code = A.code
       and A.idplay = PL.idplay
ORDER BY a.dateaudition DESC 
>>>>>>> 4b3a9e197f8f6bc0564120e51d04791a85df13a6
--Login
Select em.identification_number
from employee em
where en.email_address = 'campoA';
Select em.email_address,
       em.identification_number
from employee em
where em.email_address = 'sonia@correo.com'
       and em.identification_number = '51915567';
Select em.email_address,
       em.identification_number
from employee em
where em.email_address = 'campoA'
       and em.identification_number = 'campoB';
select distinct(s.student_names || ' ' || s.student_surnames) "Nombres"
from Play pl,
       Function f,
       character_student cs,
       Character c,
       Student s
where f.id_play = pl.id_play
       and pl.id_play = c.id_play
       and c.id_character = cs.id_character
       and c.id_play = cs.id_play
       and cs.student_code = s.student_code
       and pl.title = 'Romeo y Julieta'
       and f.FUNCTION_DATE = to_date('25/03/2022', 'DD/MM/YYYY')
       and f.START_TIME <(
              to_date('25/03/2022 09:00', 'DD/MM/YYYY hh24:mi')
       )
       and f.END_TIME >(
              to_date('25/03/2022 09:00', 'DD/MM/YYYY hh24:mi')
       );
-- Login
Select em.identification_number
from employee em
where en.email_address = 'campoA';
Select em.email_address,
       em.identification_number
from employee em
where em.email_address = 'sonia@correo.com'
       and em.identification_number = '51915567';
Select em.email_address,
       em.identification_number
from employee em
where em.email_address = 'campoA'
       and em.identification_number = 'campoB';


select distinct(s.student_names || ' ' || s.student_surnames) "Nombres"
from Play pl,
       Function f,
       character_student cs,
       Character c,
       Student s
where f.id_play = pl.id_play
       and pl.id_play = c.id_play
       and c.id_character = cs.id_character
       and c.id_play = cs.id_play
       and cs.student_code = s.student_code
       and pl.title = 'Romeo y Julieta'
       and f.FUNCTION_DATE = to_date('25/03/2022', 'DD/MM/YYYY')
       and f.START_TIME <(
              to_date('25/03/2022 09:00', 'DD/MM/YYYY hh24:mi')
       )
       and f.END_TIME >(
              to_date('25/03/2022 09:00', 'DD/MM/YYYY hh24:mi')
       );

--falta cedula y la fecha de fin de actividades

select SYSDATE,        
       pl.title,
       s.student_names, 
       s.student_surnames,
       s.email_address2,
       s.student_code,
       e.names,
       e.surnames,
       e.identification_number,
       u.uni_name
from Play pl,
     Student s,
     Character c,
     character_student cs,
     Stage_Play_Staff sps,
     Employee e,
     Unit u,
     Role r
where pl.id_play = c.id_play 
       and c.id_character = cs.id_character
       and c.id_play = cs.id_play
       and cs.student_code = s.student_code
       and pl.id_play=sps.id_play(+)
       and r.id_role=sps.id_role(+)
       and e.unit_code=sps.unit_code(+)
       and e.employee_code=sps.employee_code(+)
       and u.unit_code=e.unit_code(+)
       and u.unit_code=s.unit_code
       and pl.title='Romeo y Julieta'
       and r.name_role='Docente';



/*select distinct(s.student_names || ' ' || s.student_surnames) "Nombres"
 from Play pl, Function f, character_student cs, Character c, Student s
 where f.id_play=pl.id_play and pl.id_play=c.id_play  and c.id_character=cs.id_character and c.id_play=cs.id_play 
 and cs.student_code=s.student_code and pl.title='Romeo y Julieta' and f.FUNCTION_DATE=to_char('25/03/2022');*/

-- Obt
/* select SYSDATE,        
       pl.title,
       s.student_names, 
       s.student_surnames,
       s.email_address2,
       s.student_code,
       u.uni_name
from Play pl,
     Student s,
     Character c,
     character_student cs,
     unit u     
where pl.id_play = c.id_play
       and c.id_character = cs.id_character
       and c.id_play = cs.id_play
       and cs.student_code = s.student_code       
       and s.unit_code = u.unit_code*/

-- Obtener datos del profesor
select e.names || ' ' ||
       e.surnames,
       e.identification_number,
       DU.uni_name
from employee e,
     Unit u,
     unit DU
where e.unit_code = u.unit_code
       AND e.email_address = 'sonia@correo.com'
       AND u.dependency_unit = DU.unit_code;

select distinct SYSDATE,        
       pl.title,
       s.student_names, 
       s.student_surnames,
       s.email_address2,
       s.student_code,
       e.names,
       e.surnames,
       e.identification_number,
       u.uni_name
from Play pl,
     Student s,
     Character c,
     character_student cs,
     Stage_Play_Staff sps,
     Employee e,
     Unit u,
     Role r
where pl.id_play = c.id_play 
       and c.id_character = cs.id_character
       and c.id_play = cs.id_play
       and cs.student_code = s.student_code
       and pl.title = 'Romeo y Julieta'
       and pl.title in (select  distinct pl.title
       from Stage_Play_Staff sps,
              Employee e,
              Unit u,
              Role r
       where pl.id_play=sps.id_play
              and r.id_role=sps.id_role
              and e.unit_code=sps.unit_code
              and e.employee_code=sps.employee_code
              and u.unit_code=e.unit_code
              and u.unit_code=s.unit_code      
              and r.name_role='Docente'
              and pl.title = 'Romeo y Julieta');


select (first_name || ' ' || last_name) "Nombre Empleado"
from s_emp where title in (select title
from s_emp where lower(first_name || ' ' || last_name) = 'carmen velasquez');       

select SYSDATE,        
       pl.title,
       s.student_names, 
       s.student_surnames,
       s.email_address2,
       s.student_code,
       u.uni_name
from Play pl,
     Student s,
     Character c,
     character_student cs,
     unit u     
where pl.id_play = c.id_play
       and c.id_character = cs.id_character
       and c.id_play = cs.id_play
       and cs.student_code = s.student_code       
       and s.unit_code = u.unit_code
       and pl.title = 'Romeo y Julieta';


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
       s.email_addres;

--Buscar las obras del profesor

Select p.title
from  play p, Stage_Play_Staff sps, employee e
where p.id_play=sps.id_play
       and sps.employee_code=e.employee_code
       and sps.unit_code=e.unit_code
       and e.email_address='sonia@correo.com';

--Obras en las cuales participo el estudiante

select p.title
from play p, Character c, character_student cs, student S
where p.id_play = c.id_play
       and c.id_Character=cs.id_Character
       and c.id_play=cs.id_play
       and cs.student_code=s.student_code
       and s.student_code='20172020068';

--Certificado Estudiante

select p.title, 
       e.names || ' '|| e.surnames, 
       t.term_desc, 
       c.character_name, 
       s.email_address2
from play p, 
       employee e, 
       term t, 
       student s, 
       Character c, 
       character_student cs, 
       Stage_Play_Staff sps, 
       activity_list al,
       work_play_staff wps       
where p.id_play = c.id_play
       and c.id_Character=cs.id_Character
       and c.id_play=cs.id_play
       and cs.student_code=s.student_code
       and s.student_code='20172020068'
       and p.title='Romeo y Julieta'
       and sps.id_play=p.id_play
       and e.unit_code=sps.unit_code
       and e.employee_code=sps.employee_code
       and wps.unit_code=sps.unit_code
       and wps.employee_code=sps.employee_code
       and wps.id_sta_pla_staff=sps.id_sta_pla_staff
       and wps.activity_code='DRTR1'
       and al.id_term=wps.id_term
       and al.activity_code=wps.activity_code
       and t.id_term=al.id_term;
