/* ID_TYPE_PLAY, NAME_TYPE_PLAY*/

INSERT INTO type_play (name_type_play) VALUES ('Drama');
INSERT INTO type_play (name_type_play) VALUES ('Tragedia');
INSERT INTO type_play (name_type_play) VALUES ('Comedia');

/*COUNTRY_CODE, COUNTRY_NAME*/

INSERT INTO country VALUES ('57', 'Colombia');
INSERT INTO country VALUES ('34', 'España');
INSERT INTO country VALUES ('44', 'Reino Unido');
INSERT INTO country VALUES ('33', 'Francia');
INSERT INTO country VALUES ('54', 'Argentina');

/* ID_PLAYWRIGHT,  COUNTRY_CODE, PLAYWRIGHT_NAME*/
INSERT INTO playwright VALUES ('FDL', '34', 'Federico García Lorca');
INSERT INTO playwright VALUES ('WSP', '44', 'William Shakespeare');
INSERT INTO playwright VALUES ('LDV', '34', 'Lope de Vega');
INSERT INTO playwright VALUES ('FNR', '34', 'Fernando de Rojas');
INSERT INTO playwright VALUES ('MLR', '33', 'Molière');
INSERT INTO playwright VALUES ('GLF', '54', 'Gregorio de Laferrère');


/* ID_PLAY, ID_TYPE_PLAY, COUNTRY_CODE, ID_PLAYWRIGHT, DATE_PLAY, TITLE, STATE */
INSERT INTO play 
VALUES ('CDBA', 1, '34', 'FDL', TO_DATE('1945','YYYY'), 'La casa de Bernarda Alba', 0);

INSERT INTO play 
VALUES ('RADJ', 2, '44', 'WSP', TO_DATE('1597','YYYY'), 'Romeo y Julieta', 1);

INSERT INTO play 
VALUES ('HMLT', 2, '44', 'WSP', TO_DATE('1602','YYYY'), 'Hamlet', 0);

INSERT INTO play 
VALUES ('FTOJ', 1, '34', 'LDV', TO_DATE('1619','YYYY'), 'Fuenteovejuna', 0);

INSERT INTO play 
VALUES ('LCTN', 3, '34', 'FNR', TO_DATE('1500','YYYY'), 'La Celestina', 0);

INSERT INTO play 
VALUES ('EAVR', 3, '33', 'MLR', TO_DATE('1668','YYYY'), 'El Avaro', 0);

INSERT INTO play 
VALUES ('JTTR', 3, '54', 'GLF', TO_DATE('1904','YYYY'), '¡Jettatore!', 0);

-- id_play, id_character, character_name;
-- Obra La casa de Bernarda Alba
INSERT INTO character VALUES ('CDBA', 'BNRD', 'Bernarda');
INSERT INTO character VALUES ('CDBA', 'AGTS', 'Angustias');
INSERT INTO character VALUES ('CDBA', 'MTRO', 'Martirio');
INSERT INTO character VALUES ('CDBA', 'MGLN', 'Magdalena');

-- Obra Romeo y Julieta
INSERT INTO character VALUES ('RADJ', 'RMMT', 'Romeo Montesco');
INSERT INTO character VALUES ('RADJ', 'JTCT', 'Julieta Capuleto');
INSERT INTO character VALUES ('RADJ', 'MDEL', 'Mercurio Della Escala');
INSERT INTO character VALUES ('RADJ', 'FTLZ', 'Fray Lorenzo');

-- Obra Hamlet
INSERT INTO character VALUES ('HMLT', 'PHMT', 'Principe Hamlet');
INSERT INTO character VALUES ('HMLT', 'GTDS', 'Gertrudis');
INSERT INTO character VALUES ('HMLT', 'CADO', 'Claudio');
INSERT INTO character VALUES ('HMLT', 'RHMT', 'Rey Hamlet');

-- Obra Fuenteovejuna
INSERT INTO character VALUES ('FTOJ', 'FGDG', 'Fernán Gómez de Guzmán');
INSERT INTO character VALUES ('FTOJ', 'OTCC', 'Ortuño (criado del comendador)');
INSERT INTO character VALUES ('FTOJ', 'FCDC', 'Flores (criado del comendador)');
INSERT INTO character VALUES ('FTOJ', 'MCRT', 'El Maestre de Calatrava (Rodrigo T)');

-- Obra El Celestina
INSERT INTO character VALUES ('LCTN', 'CLTN', 'Celestina');
INSERT INTO character VALUES ('LCTN', 'CLTO', 'Calisto');
INSERT INTO character VALUES ('LCTN', 'MLBA', 'Malibea');
INSERT INTO character VALUES ('LCTN', 'LCRC', 'Lucrecia');

-- Obra El Avaro
INSERT INTO character VALUES ('EAVR', 'HAPG', 'Harpagon');
INSERT INTO character VALUES ('EAVR', 'CATE', 'Cléante');
INSERT INTO character VALUES ('EAVR', 'ELSE', 'Élise');
INSERT INTO character VALUES ('EAVR', 'VLRE', 'Valère');

-- Obra ¡Jettatore!
INSERT INTO character VALUES ('JTTR', 'DCML', 'Doña Camila');
INSERT INTO character VALUES ('JTTR', 'LONR', 'Leonor');
INSERT INTO character VALUES ('JTTR', 'LCIA', 'Lucia');
INSERT INTO character VALUES ('JTTR', 'ELVR', 'Elvira');

/*THEATER_CODE,  THEATER_NAME, THEATER_ADDRESS*/

INSERT INTO theater VALUES ('TLF', 'Factoria L.Explose', 'CARRERA 25 No. 50 - 34');
INSERT INTO theater VALUES ('LEO', 'Luis Enrique Osorio', 'Av. Jimenez De Quesada #13a-55 a 13a-1');
INSERT INTO theater VALUES ('CTC', 'Cortocinesis', 'Cl. 59 # 17 - 48');
INSERT INTO theater VALUES ('LCD', 'La Candelaria', 'Cl. 12 #2-59, La Candelaria');

/* ID_TERM, TERM_DESC */
INSERT INTO TERM (TERM_DESC) VALUES ('2021-1');
INSERT INTO TERM (TERM_DESC) VALUES ('2021-3');
INSERT INTO TERM (TERM_DESC) VALUES ('2022-1');

/* ID_TERM, ACTIVITY_CODE, ACTIVITY_DESC, HOUR_VALUE*/
INSERT INTO activity_list VALUES (1,'ESCN1','Escenografía',20);
INSERT INTO activity_list VALUES (1,'VEST1','Vestuario',22);
INSERT INTO activity_list VALUES (1,'MQLL1','Maquillaje',24);
INSERT INTO activity_list VALUES (1,'LUCS1','Luces',28);
INSERT INTO activity_list VALUES (1,'SNRZ1','Sonorización',15);
INSERT INTO activity_list VALUES (1,'PLCD1','Publicidad',17);
INSERT INTO activity_list VALUES (1,'AULA1','Auxiliar labores administrativas',13);
INSERT INTO activity_list VALUES (1,'CART1','Coordinador artístico',20);
INSERT INTO activity_list VALUES (1,'AAPP1','Administrador aplicación',28);
INSERT INTO activity_list VALUES (1,'DRTR1','Director',30);

INSERT INTO activity_list VALUES (2,'ESCN1','Escenografía',21);
INSERT INTO activity_list VALUES (2,'VEST1','Vestuario',23);
INSERT INTO activity_list VALUES (2,'MQLL1','Maquillaje',25);
INSERT INTO activity_list VALUES (2,'LUCS1','Luces',29);
INSERT INTO activity_list VALUES (2,'SNRZ1','Sonorización',16);
INSERT INTO activity_list VALUES (2,'PLCD1','Publicidad',18);
INSERT INTO activity_list VALUES (2,'AULA1','Auxiliar labores administrativas',14);
INSERT INTO activity_list VALUES (2,'CART1','Coordinador artístico',21);
INSERT INTO activity_list VALUES (2,'AAPP1','Administrador aplicación',29);
INSERT INTO activity_list VALUES (2,'DRTR1','Director',31);

INSERT INTO activity_list VALUES (3,'ESCN1','Escenografía',22);
INSERT INTO activity_list VALUES (3,'VEST1','Vestuario',24);
INSERT INTO activity_list VALUES (3,'MQLL1','Maquillaje',26);
INSERT INTO activity_list VALUES (3,'LUCS1','Luces',30);
INSERT INTO activity_list VALUES (3,'SNRZ1','Sonorización',17);
INSERT INTO activity_list VALUES (3,'PLCD1','Publicidad',19);
INSERT INTO activity_list VALUES (3,'AULA1','Auxiliar labores administrativas',15);
INSERT INTO activity_list VALUES (3,'CART1','Coordinador artístico',22);
INSERT INTO activity_list VALUES (3,'AAPP1','Administrador aplicación',30);
INSERT INTO activity_list VALUES (3,'DRTR1','Director',32);

/* ID_TYPE_MODALITY, TYPE_MODALITY_DESC */

INSERT INTO MODALITY VALUES ('CV','Convocatoria');
INSERT INTO modality VALUES ('SY','Ensayo');
INSERT INTO modality VALUES ('FN','Función');

/*ID_PLAY, ID_FUNCTION, ID_TYPE_MODALITY, THEATER_CODE, FUNCTION_DATE, START_TIME, END_TIME*/
INSERT INTO function 
VALUES ('RADJ',0001,'CV','TLF',to_date('25/03/2022','DD/MM/YYYY'),to_date('25/03/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('25/03/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0002,'SY','LEO',to_date('29/03/2022','DD/MM/YYYY'),to_date('29/03/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('29/03/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0003,'SY','CTC',to_date('01/04/2022','DD/MM/YYYY'),to_date('01/04/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('01/04/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0004,'SY','LCD',to_date('04/04/2022','DD/MM/YYYY'),to_date('04/04/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('04/04/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0005,'SY','TLF',to_date('07/04/2022','DD/MM/YYYY'),to_date('07/04/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('07/04/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0006,'SY','LEO',to_date('11/04/2022','DD/MM/YYYY'),to_date('11/04/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('11/04/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0007,'SY','CTC',to_date('14/04/2022','DD/MM/YYYY'),to_date('14/04/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('14/04/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0008,'FN','LCD',to_date('22/04/2022','DD/MM/YYYY'),to_date('22/04/2022 18:00', 'DD/MM/YYYY hh24:mi'),to_date('22/04/2022 20:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0009,'FN','LEO',to_date('29/04/2022','DD/MM/YYYY'),to_date('29/04/2022 18:00', 'DD/MM/YYYY hh24:mi'),to_date('29/04/2022 20:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0010,'FN','CTC',to_date('06/05/2022','DD/MM/YYYY'),to_date('06/05/2022 18:00', 'DD/MM/YYYY hh24:mi'),to_date('06/05/2022 20:00', 'DD/MM/YYYY hh24:mi'));

/* ID_TYPE_UNIT, UNIT_TYPE_DESCRIPTION */

INSERT INTO type_unit VALUES ('AC', 'Unidad academica');
INSERT INTO type_unit VALUES ('AD', 'Unidad administrativa');

/* UNIT_CODE, ID_TYPE_UNIT, DEPENDENCY_UNIT, UNI_NAME */
INSERT INTO unit (unit_code, id_type_unit, uni_name) 
VALUES ('RCTRA', 'AD', 'Rectoria');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('VRCTR', 'AD', 'RCTRA', 'Vicerectoria');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('FCIGN', 'AC', 'VRCTR', 'Facultad de Ingeniería');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('IGNST', 'AC', 'FCIGN', 'Ingeniería de Sistemas');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('IGCYG', 'AC', 'FCIGN', 'Ingeniería Catastral y Geodesia');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('FCATS', 'AC', 'VRCTR', 'Facultad de Artes');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('ATDZR', 'AC', 'FCATS', 'Arte Danzario');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('ATESC', 'AC', 'FCATS', 'Artes Escénicas');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('ATPYV', 'AC', 'FCATS', 'Artes Plasticas y Visuales');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('ATMSC', 'AC', 'FCATS', 'Artes Musicales');

-- ID_ROLE, NAME_ROLE, DESC_ROLE

INSERT INTO role (name_role, desc_role) 
VALUES ('Docente', 'Docente de planta');

INSERT INTO role (name_role, desc_role) 
VALUES ('Auxiliar', 'Personal administrativo');

/* student_code, unit_code, student_names, student_surnames, birth_date,
inscription_date, email_address */

INSERT INTO student 
VALUES ('20162020120', 'IGCYG', 'Alberto', 'Perez', to_date('15/08/1996','DD/MM/YYYY'), 
         to_date('15/10/2021','DD/MM/YYYY'), 'alberto@gmail.com');

INSERT INTO student 
VALUES ('20172010070', 'IGCYG', 'Maria', 'Gonzales', to_date('25/05/1998','DD/MM/YYYY'), 
         to_date('15/10/2021','DD/MM/YYYY'), 'maria@gmail.com');

INSERT INTO student 
VALUES ('20182009052', 'ATDZR', 'Felipe', 'Ovalles', to_date('08/02/1999','DD/MM/YYYY'), 
         to_date('15/01/2022','DD/MM/YYYY'), 'felipe@gmail.com');

INSERT INTO student 
VALUES ('20202015012', 'ATESC', 'Paula', 'Jimenez', to_date('28/06/1990','DD/MM/YYYY'), 
         to_date('15/01/2022','DD/MM/YYYY'), 'paula@gmail.com');

INSERT INTO student 
VALUES ('20191014068', 'ATPYV', 'Daniela', 'Wilches', to_date('10/11/1995','DD/MM/YYYY'), 
         to_date('15/01/2022','DD/MM/YYYY'), 'daniela@gmail.com');

INSERT INTO student 
VALUES ('20191004125', 'ATMSC', 'Rosa', 'Ordoñez', to_date('18/11/1998','DD/MM/YYYY'), 
         to_date('28/03/2022','DD/MM/YYYY'), 'rosa@gmail.com');

INSERT INTO student 
VALUES ('20171010058', 'ATPYV', 'Camila', 'Rincon', to_date('20/06/1999','DD/MM/YYYY'), 
         to_date('18/02/2022','DD/MM/YYYY'), 'camila@gmail.com');

INSERT INTO student 
VALUES ('20172020068', 'IGNST', 'Cristian', 'Ovalles', to_date('09/12/1996','DD/MM/YYYY'), 
         to_date('13/02/2022','DD/MM/YYYY'), 'cris_ovalles@hotmail.com');

INSERT INTO student 
VALUES ('20172020114', 'IGNST', 'Andres', 'Wilches', to_date('31/01/1999','DD/MM/YYYY'), 
         to_date('23/02/2022','DD/MM/YYYY'), 'andresfwilchest@gmail.com');

INSERT INTO student 
VALUES ('20172020071', 'IGNST', 'Josue', 'Nuñez', to_date('08/06/1999','DD/MM/YYYY'), 
         to_date('28/02/2022','DD/MM/YYYY'), 'josuenunezprada@gmail.com');

/* ID_CHARACTER_STUDENT, ID_PLAY, ID_CHARACTER, STUDENT_CODE, START_CHARACTER_DATE,
END_CHARACTER_DATE */

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'RMMT', '20172020071', to_date('28/02/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'FTLZ', '20172020068', to_date('13/02/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'MDEL', '20172020114', to_date('23/02/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'JTCT', '20171010058', to_date('18/02/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('CDBA', 'BNRD', '20191004125', to_date('15/01/2022','DD/MM/YYYY'), 
        to_date('02/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('CDBA', 'AGTS', '20191014068', to_date('15/01/2022','DD/MM/YYYY'), 
        to_date('02/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('CDBA', 'MTRO', '20182009052', to_date('15/01/2022','DD/MM/YYYY'), 
        to_date('02/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('CDBA', 'MGLN', '20202015012', to_date('15/01/2022','DD/MM/YYYY'), 
        to_date('02/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('HMLT', 'PHMT', '20162020120', to_date('15/10/2021','DD/MM/YYYY'), 
        to_date('02/12/2021','DD/MM/YYYY'));
      
INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('HMLT', 'GTDS', '20172010070', to_date('15/10/2021','DD/MM/YYYY'), 
        to_date('02/12/2021','DD/MM/YYYY'));



/* UNIT_CODE, EMPLOYEE_CODE, NAMES, SURNAMES, IDENTIFICATION_NUMBER, PHONE_NUMBER
EMAIL_ADDRESS */

INSERT INTO employee 
VALUES ('IGNST', 'SNOD', 'Sonia', 'Ordoñez', '51915567', '3052185424', 'sonia@correo.com');

INSERT INTO employee 
VALUES ('IGNST', 'AJDZ', 'Alejandro', 'Daza', '25781245', '3185261656', 'daza@correo.com');

INSERT INTO employee 
VALUES ('FCIGN', 'CLMD', 'Carolina', 'Mendez', '54265948', '3165895645', 'carolina@email.com');

INSERT INTO employee 
VALUES ('FCIGN', 'SNOR', 'Susana', 'Oria', '52169485', '3154895645', 'susanita@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'MCTS', 'Michael', 'Torres', '1025459862', '3024584459', 'michael@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'RQMY', 'Raquel', 'Mayorca', '1016459862', '3205487898', 'raquel@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'RNQT', 'Runny', 'Quintero', '42485448', '3195487845', 'runny@email.com');

INSERT INTO employee 
VALUES ('ATDZR', 'CLVZ', 'Carlos', 'Velez', '56919562', '3212564878', 'carlosve@correo.com');

INSERT INTO employee 
VALUES ('ATDZR', 'AJDZ', 'Alenjandra', 'Muñoz', '1016584578', '3015895645', 'alemu@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'MGHD', 'Miguel', 'Hernandez', '1013599866', '3147859565', 'miguel@correo.com');

INSERT INTO employee 
VALUES ('FCATS', 'LCLP', 'Lucia', 'Lopez', '1014894512', '3016597845', 'licu@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'FNBJ', 'Fran', 'Bejarano', '79451245', '3225797982', 'fran@email.com');


/* HACER INSERT DE STAGE_PLAY_STAFF*/

/* WORK_PLAY_STAFF*/

/* EXPENSE_LIST */

/* SE LLENA STUDENT_ATTENDANCE */

/* 
-----------------------------
fecha finalizada
-----------------------------
*/

/* ID_TYPE_PLAY, NAME_TYPE_PLAY*/

INSERT INTO type_play (name_type_play) VALUES ('Drama');
INSERT INTO type_play (name_type_play) VALUES ('Tragedia');
INSERT INTO type_play (name_type_play) VALUES ('Comedia');

/*COUNTRY_CODE, COUNTRY_NAME*/

INSERT INTO country VALUES ('57', 'Colombia');
INSERT INTO country VALUES ('34', 'España');
INSERT INTO country VALUES ('44', 'Reino Unido');
INSERT INTO country VALUES ('33', 'Francia');
INSERT INTO country VALUES ('54', 'Argentina');

/* ID_PLAYWRIGHT,  COUNTRY_CODE, PLAYWRIGHT_NAME*/
INSERT INTO playwright VALUES ('FDL', '34', 'Federico García Lorca');
INSERT INTO playwright VALUES ('WSP', '44', 'William Shakespeare');
INSERT INTO playwright VALUES ('LDV', '34', 'Lope de Vega');
INSERT INTO playwright VALUES ('FNR', '34', 'Fernando de Rojas');
INSERT INTO playwright VALUES ('MLR', '33', 'Molière');
INSERT INTO playwright VALUES ('GLF', '54', 'Gregorio de Laferrère');


/* ID_PLAY, ID_TYPE_PLAY, COUNTRY_CODE, ID_PLAYWRIGHT, DATE_PLAY, TITLE, STATE */
INSERT INTO play 
VALUES ('CDBA', 1, '34', 'FDL', TO_DATE('1945','YYYY'), 'La casa de Bernarda Alba', 0);

INSERT INTO play 
VALUES ('RADJ', 2, '44', 'WSP', TO_DATE('1597','YYYY'), 'Romeo y Julieta', 1);

INSERT INTO play 
VALUES ('HMLT', 2, '44', 'WSP', TO_DATE('1602','YYYY'), 'Hamlet', 0);

INSERT INTO play 
VALUES ('FTOJ', 1, '34', 'LDV', TO_DATE('1619','YYYY'), 'Fuenteovejuna', 0);

INSERT INTO play 
VALUES ('LCTN', 3, '34', 'FNR', TO_DATE('1500','YYYY'), 'La Celestina', 0);

INSERT INTO play 
VALUES ('EAVR', 3, '33', 'MLR', TO_DATE('1668','YYYY'), 'El Avaro', 0);

INSERT INTO play 
VALUES ('JTTR', 3, '54', 'GLF', TO_DATE('1904','YYYY'), '¡Jettatore!', 0);

-- id_play, id_character, character_name;
-- Obra La casa de Bernarda Alba
INSERT INTO character VALUES ('CDBA', 'BNRD', 'Bernarda');
INSERT INTO character VALUES ('CDBA', 'AGTS', 'Angustias');
INSERT INTO character VALUES ('CDBA', 'MTRO', 'Martirio');
INSERT INTO character VALUES ('CDBA', 'MGLN', 'Magdalena');

-- Obra Romeo y Julieta
INSERT INTO character VALUES ('RADJ', 'RMMT', 'Romeo Montesco');
INSERT INTO character VALUES ('RADJ', 'JTCT', 'Julieta Capuleto');
INSERT INTO character VALUES ('RADJ', 'MDEL', 'Mercurio Della Escala');
INSERT INTO character VALUES ('RADJ', 'FTLZ', 'Fray Lorenzo');

-- Obra Hamlet
INSERT INTO character VALUES ('HMLT', 'PHMT', 'Principe Hamlet');
INSERT INTO character VALUES ('HMLT', 'GTDS', 'Gertrudis');
INSERT INTO character VALUES ('HMLT', 'CADO', 'Claudio');
INSERT INTO character VALUES ('HMLT', 'RHMT', 'Rey Hamlet');

-- Obra Fuenteovejuna
INSERT INTO character VALUES ('FTOJ', 'FGDG', 'Fernán Gómez de Guzmán');
INSERT INTO character VALUES ('FTOJ', 'OTCC', 'Ortuño (criado del comendador)');
INSERT INTO character VALUES ('FTOJ', 'FCDC', 'Flores (criado del comendador)');
INSERT INTO character VALUES ('FTOJ', 'MCRT', 'El Maestre de Calatrava (Rodrigo T)');

-- Obra El Celestina
INSERT INTO character VALUES ('LCTN', 'CLTN', 'Celestina');
INSERT INTO character VALUES ('LCTN', 'CLTO', 'Calisto');
INSERT INTO character VALUES ('LCTN', 'MLBA', 'Malibea');
INSERT INTO character VALUES ('LCTN', 'LCRC', 'Lucrecia');

-- Obra El Avaro
INSERT INTO character VALUES ('EAVR', 'HAPG', 'Harpagon');
INSERT INTO character VALUES ('EAVR', 'CATE', 'Cléante');
INSERT INTO character VALUES ('EAVR', 'ELSE', 'Élise');
INSERT INTO character VALUES ('EAVR', 'VLRE', 'Valère');

-- Obra ¡Jettatore!
INSERT INTO character VALUES ('JTTR', 'DCML', 'Doña Camila');
INSERT INTO character VALUES ('JTTR', 'LONR', 'Leonor');
INSERT INTO character VALUES ('JTTR', 'LCIA', 'Lucia');
INSERT INTO character VALUES ('JTTR', 'ELVR', 'Elvira');

/*THEATER_CODE,  THEATER_NAME, THEATER_ADDRESS*/

INSERT INTO theater VALUES ('TLF', 'Factoria L.Explose', 'CARRERA 25 No. 50 - 34');
INSERT INTO theater VALUES ('LEO', 'Luis Enrique Osorio', 'Av. Jimenez De Quesada #13a-55 a 13a-1');
INSERT INTO theater VALUES ('CTC', 'Cortocinesis', 'Cl. 59 # 17 - 48');
INSERT INTO theater VALUES ('LCD', 'La Candelaria', 'Cl. 12 #2-59, La Candelaria');

/* ID_TERM, TERM_DESC */
INSERT INTO TERM (TERM_DESC) VALUES ('2021-1');
INSERT INTO TERM (TERM_DESC) VALUES ('2021-3');
INSERT INTO TERM (TERM_DESC) VALUES ('2022-1');

/* ID_TERM, ACTIVITY_CODE, ACTIVITY_DESC, HOUR_VALUE*/
INSERT INTO activity_list VALUES (1,'ESCN1','Escenografía',20);
INSERT INTO activity_list VALUES (1,'VEST1','Vestuario',22);
INSERT INTO activity_list VALUES (1,'MQLL1','Maquillaje',24);
INSERT INTO activity_list VALUES (1,'LUCS1','Luces',28);
INSERT INTO activity_list VALUES (1,'SNRZ1','Sonorización',15);
INSERT INTO activity_list VALUES (1,'PLCD1','Publicidad',17);
INSERT INTO activity_list VALUES (1,'AULA1','Auxiliar labores administrativas',13);
INSERT INTO activity_list VALUES (1,'CART1','Coordinador artístico',20);
INSERT INTO activity_list VALUES (1,'AAPP1','Administrador aplicación',28);
INSERT INTO activity_list VALUES (1,'DRTR1','Director',30);

INSERT INTO activity_list VALUES (2,'ESCN1','Escenografía',21);
INSERT INTO activity_list VALUES (2,'VEST1','Vestuario',23);
INSERT INTO activity_list VALUES (2,'MQLL1','Maquillaje',25);
INSERT INTO activity_list VALUES (2,'LUCS1','Luces',29);
INSERT INTO activity_list VALUES (2,'SNRZ1','Sonorización',16);
INSERT INTO activity_list VALUES (2,'PLCD1','Publicidad',18);
INSERT INTO activity_list VALUES (2,'AULA1','Auxiliar labores administrativas',14);
INSERT INTO activity_list VALUES (2,'CART1','Coordinador artístico',21);
INSERT INTO activity_list VALUES (2,'AAPP1','Administrador aplicación',29);
INSERT INTO activity_list VALUES (2,'DRTR1','Director',31);

INSERT INTO activity_list VALUES (3,'ESCN1','Escenografía',22);
INSERT INTO activity_list VALUES (3,'VEST1','Vestuario',24);
INSERT INTO activity_list VALUES (3,'MQLL1','Maquillaje',26);
INSERT INTO activity_list VALUES (3,'LUCS1','Luces',30);
INSERT INTO activity_list VALUES (3,'SNRZ1','Sonorización',17);
INSERT INTO activity_list VALUES (3,'PLCD1','Publicidad',19);
INSERT INTO activity_list VALUES (3,'AULA1','Auxiliar labores administrativas',15);
INSERT INTO activity_list VALUES (3,'CART1','Coordinador artístico',22);
INSERT INTO activity_list VALUES (3,'AAPP1','Administrador aplicación',30);
INSERT INTO activity_list VALUES (3,'DRTR1','Director',32);

/* ID_TYPE_MODALITY, TYPE_MODALITY_DESC */

INSERT INTO MODALITY VALUES ('CV','Convocatoria');
INSERT INTO modality VALUES ('SY','Ensayo');
INSERT INTO modality VALUES ('FN','Función');

/*ID_PLAY, ID_FUNCTION, ID_TYPE_MODALITY, THEATER_CODE, FUNCTION_DATE, START_TIME, END_TIME*/
INSERT INTO function 
VALUES ('RADJ',0001,'CV','TLF',to_date('25/01/2022','DD/MM/YYYY'),to_date('25/01/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('25/01/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0002,'SY','LEO',to_date('29/01/2022','DD/MM/YYYY'),to_date('29/01/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('29/01/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0003,'SY','CTC',to_date('01/02/2022','DD/MM/YYYY'),to_date('01/02/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('01/02/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0004,'SY','LCD',to_date('04/02/2022','DD/MM/YYYY'),to_date('04/02/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('04/02/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0005,'SY','TLF',to_date('07/02/2022','DD/MM/YYYY'),to_date('07/02/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('07/02/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0006,'SY','LEO',to_date('11/02/2022','DD/MM/YYYY'),to_date('11/02/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('11/02/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0007,'SY','CTC',to_date('14/02/2022','DD/MM/YYYY'),to_date('14/02/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('14/02/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0008,'FN','LCD',to_date('22/02/2022','DD/MM/YYYY'),to_date('22/02/2022 18:00', 'DD/MM/YYYY hh24:mi'),to_date('22/02/2022 20:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0009,'FN','LEO',to_date('29/02/2022','DD/MM/YYYY'),to_date('29/02/2022 18:00', 'DD/MM/YYYY hh24:mi'),to_date('29/02/2022 20:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0010,'FN','CTC',to_date('06/03/2022','DD/MM/YYYY'),to_date('06/03/2022 18:00', 'DD/MM/YYYY hh24:mi'),to_date('06/03/2022 20:00', 'DD/MM/YYYY hh24:mi'));

/* ID_TYPE_UNIT, UNIT_TYPE_DESCRIPTION */

INSERT INTO type_unit VALUES ('AC', 'Unidad academica');
INSERT INTO type_unit VALUES ('AD', 'Unidad administrativa');



/* UNIT_CODE, ID_TYPE_UNIT, DEPENDENCY_UNIT, UNI_NAME */


INSERT INTO unit (unit_code, id_type_unit, uni_name) 
VALUES ('RCTRA', 'AD', 'Rectoria');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('VRCTR', 'AD', 'RCTRA', 'Vicerectoria');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('FCIGN', 'AC', 'VRCTR', 'Facultad de Ingeniería');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('IGNST', 'AC', 'FCIGN', 'Ingeniería de Sistemas');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('IGCYG', 'AC', 'FCIGN', 'Ingeniería Catastral y Geodesia');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('FCATS', 'AC', 'VRCTR', 'Facultad de Artes');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('ATDZR', 'AC', 'FCATS', 'Arte Danzario');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('ATESC', 'AC', 'FCATS', 'Artes Escénicas');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('ATPYV', 'AC', 'FCATS', 'Artes Plasticas y Visuales');

INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('ATMSC', 'AC', 'FCATS', 'Artes Musicales');

-- ID_ROLE, NAME_ROLE, DESC_ROLE

INSERT INTO role (name_role, desc_role) 
VALUES ('Docente', 'Docente de planta');

INSERT INTO role (name_role, desc_role) 
VALUES ('Auxiliar', 'Personal administrativo');

/* student_code, unit_code, student_names, student_surnames, birth_date,
inscription_date, email_address */

INSERT INTO student 
VALUES ('20162020120', 'IGCYG', 'Alberto', 'Perez', to_date('15/08/1996','DD/MM/YYYY'), 
         to_date('15/10/2021','DD/MM/YYYY'), 'alberto@gmail.com');

INSERT INTO student 
VALUES ('20172010070', 'IGCYG', 'Maria', 'Gonzales', to_date('25/05/1998','DD/MM/YYYY'), 
         to_date('15/10/2021','DD/MM/YYYY'), 'maria@gmail.com');

INSERT INTO student 
VALUES ('20182009052', 'ATDZR', 'Felipe', 'Ovalles', to_date('08/02/1999','DD/MM/YYYY'), 
         to_date('15/01/2022','DD/MM/YYYY'), 'felipe@gmail.com');

INSERT INTO student 
VALUES ('20202015012', 'ATESC', 'Paula', 'Jimenez', to_date('28/06/1990','DD/MM/YYYY'), 
         to_date('15/01/2022','DD/MM/YYYY'), 'paula@gmail.com');

INSERT INTO student 
VALUES ('20191014068', 'ATPYV', 'Daniela', 'Wilches', to_date('10/11/1995','DD/MM/YYYY'), 
         to_date('15/01/2022','DD/MM/YYYY'), 'daniela@gmail.com');

INSERT INTO student 
VALUES ('20191004125', 'ATMSC', 'Rosa', 'Ordoñez', to_date('18/11/1998','DD/MM/YYYY'), 
         to_date('28/02/2022','DD/MM/YYYY'), 'rosa@gmail.com');

INSERT INTO student 
VALUES ('20171010058', 'ATPYV', 'Camila', 'Rincon', to_date('20/06/1999','DD/MM/YYYY'), 
         to_date('18/02/2022','DD/MM/YYYY'), 'camila@gmail.com');

INSERT INTO student 
VALUES ('20172020068', 'IGNST', 'Cristian', 'Ovalles', to_date('09/12/1996','DD/MM/YYYY'), 
         to_date('13/02/2022','DD/MM/YYYY'), 'cris_ovalles@hotmail.com');

INSERT INTO student 
VALUES ('20172020114', 'IGNST', 'Andres', 'Wilches', to_date('31/01/1999','DD/MM/YYYY'), 
         to_date('23/02/2022','DD/MM/YYYY'), 'andresfwilchest@gmail.com');

INSERT INTO student 
VALUES ('20172020071', 'IGNST', 'Josue', 'Nuñez', to_date('08/06/1999','DD/MM/YYYY'), 
         to_date('28/02/2022','DD/MM/YYYY'), 'josuenunezprada@gmail.com');

/* ID_CHARACTER_STUDENT, ID_PLAY, ID_CHARACTER, STUDENT_CODE, START_CHARACTER_DATE,
END_CHARACTER_DATE */


INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'RMMT', '20172020071', to_date('28/02/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'FTLZ', '20172020068', to_date('13/02/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'MDEL', '20172020114', to_date('23/02/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'JTCT', '20171010058', to_date('18/02/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));


INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('CDBA', 'BNRD', '20191004125', to_date('15/01/2022','DD/MM/YYYY'), 
        to_date('02/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('CDBA', 'AGTS', '20191014068', to_date('15/01/2022','DD/MM/YYYY'), 
        to_date('02/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('CDBA', 'MTRO', '20182009052', to_date('15/01/2022','DD/MM/YYYY'), 
        to_date('02/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('CDBA', 'MGLN', '20202015012', to_date('15/01/2022','DD/MM/YYYY'), 
        to_date('02/03/2022','DD/MM/YYYY'));

INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('HMLT', 'PHMT', '20162020120', to_date('15/10/2021','DD/MM/YYYY'), 
        to_date('02/12/2021','DD/MM/YYYY'));
      
INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('HMLT', 'GTDS', '20172010070', to_date('15/10/2021','DD/MM/YYYY'), 
        to_date('02/12/2021','DD/MM/YYYY'));



/* UNIT_CODE, EMPLOYEE_CODE, NAMES, SURNAMES, IDENTIFICATION_NUMBER, PHONE_NUMBER
EMAIL_ADDRESS */

INSERT INTO employee 
VALUES ('IGNST', 'SNOD', 'Sonia', 'Ordoñez', '51915567', '3052185424', 'sonia@correo.com');

INSERT INTO employee 
VALUES ('IGNST', 'AJDZ', 'Alejandro', 'Daza', '25781245', '3185261656', 'daza@correo.com');

INSERT INTO employee 
VALUES ('FCIGN', 'CLMD', 'Carolina', 'Mendez', '54265948', '3165895645', 'carolina@email.com');

INSERT INTO employee 
VALUES ('FCIGN', 'SNOR', 'Susana', 'Oria', '52169485', '3154895645', 'susanita@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'MCTS', 'Michael', 'Torres', '1025459862', '3024584459', 'michael@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'RQMY', 'Raquel', 'Mayorca', '1016459862', '3205487898', 'raquel@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'RNQT', 'Runny', 'Quintero', '42485448', '3195487845', 'runny@email.com');

INSERT INTO employee 
VALUES ('ATDZR', 'CLVZ', 'Carlos', 'Velez', '56919562', '3212564878', 'carlosve@correo.com');

INSERT INTO employee 
VALUES ('ATDZR', 'AJDZ', 'Alenjandra', 'Muñoz', '1016584578', '3015895645', 'alemu@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'MGHD', 'Miguel', 'Hernandez', '1013599866', '3147859565', 'miguel@correo.com');

INSERT INTO employee 
VALUES ('FCATS', 'LCLP', 'Lucia', 'Lopez', '1014894512', '3016597845', 'licu@email.com');

INSERT INTO employee 
VALUES ('FCATS', 'FNBJ', 'Fran', 'Bejarano', '79451245', '3225797982', 'fran@email.com');
