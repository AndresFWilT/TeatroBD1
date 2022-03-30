/* Insertar tipo de obra ---ID_TYPE_PLAY, NAME_TYPE_PLAY*/
INSERT INTO type_play (name_type_play) VALUES ('Accion');

/*Insertar país ---COUNTRY_CODE, COUNTRY_NAME*/
INSERT INTO country VALUES ('55', 'Mexico');

/*Insertar escritor  ----ID_PLAYWRIGHT,  COUNTRY_CODE, PLAYWRIGHT_NAME*/
INSERT INTO playwright VALUES ('JRF', '34', 'Juan Rulfo');

/*Insertar obra ID_PLAY, ID_TYPE_PLAY, COUNTRY_CODE, ID_PLAYWRIGHT, DATE_PLAY, TITLE, STATE */
INSERT INTO play 
VALUES ('LLLL', 2, '55', 'JRF', TO_DATE('1955','YYYY'), 'El llano en llamas', 1);

--Inserción personajes de la obra --- id_play, id_character, character_name;
-- !!!Obra ¡El llano en llamas!!!
INSERT INTO character VALUES ('LLLL', 'TALP', 'Talpa');
INSERT INTO character VALUES ('LLLL', 'MCRO', 'Macario');
INSERT INTO character VALUES ('LLLL', 'RCGL', 'Arcangel');
INSERT INTO character VALUES ('LLLL', 'CCLT', 'Anacleto');

/*Inserción de teatro ---- THEATER_CODE,  THEATER_NAME, THEATER_ADDRESS*/
INSERT INTO theater VALUES ('NSO', 'En sueño', 'CALLE 4 No. 18 - 36');

/*Inserción Periodo ---- ID_TERM, TERM_DESC */
INSERT INTO TERM (TERM_DESC) VALUES ('2022-3');

/*Inserción Funciones ---- ID_TERM, ACTIVITY_CODE, ACTIVITY_DESC, HOUR_VALUE*/
INSERT INTO activity_list VALUES (4,'AULA1','Auxiliar labores administrativas',14);
INSERT INTO activity_list VALUES (4,'CART1','Coordinador artístico',21);
INSERT INTO activity_list VALUES (4,'AAPP1','Administrador aplicación',29);
INSERT INTO activity_list VALUES (4,'DRTR1','Director',31);

/*Inserción de modalidad ---- ID_TYPE_MODALITY, TYPE_MODALITY_DESC */
INSERT INTO MODALITY VALUES ('RT','Reintegro');

/*Inserción función ---- ID_PLAY, ID_FUNCTION, ID_TYPE_MODALITY, THEATER_CODE, FUNCTION_DATE, START_TIME, END_TIME*/
--!!! NSO SOLAMANTE SI SE AGREGO LA OBRA DE LLANO EN LLAMADAS
INSERT INTO function 
VALUES ('RADJ',0011,'CV','NSO',to_date('26/03/2022','DD/MM/YYYY'),to_date('26/03/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('26/03/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0012,'SY','LEO',to_date('02/04/2022','DD/MM/YYYY'),to_date('02/04/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('02/04/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('RADJ',0013,'FN','NSO',to_date('27/04/2022','DD/MM/YYYY'),to_date('27/04/2022 18:00', 'DD/MM/YYYY hh24:mi'),to_date('27/04/2022 20:00', 'DD/MM/YYYY hh24:mi'));
--- !!! SOLO SI SE AGREGA EL DE LLAMAS!!!!
INSERT INTO function 
VALUES ('LLLL',0014,'CV','NSO',to_date('26/03/2022','DD/MM/YYYY'),to_date('26/03/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('26/03/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('LLLL',0012,'SY','LEO',to_date('02/04/2022','DD/MM/YYYY'),to_date('02/04/2022 08:00', 'DD/MM/YYYY hh24:mi'),to_date('02/04/2022 10:00', 'DD/MM/YYYY hh24:mi'));
INSERT INTO function 
VALUES ('LLLL',0013,'FN','NSO',to_date('27/04/2022','DD/MM/YYYY'),to_date('27/04/2022 18:00', 'DD/MM/YYYY hh24:mi'),to_date('27/04/2022 20:00', 'DD/MM/YYYY hh24:mi'));

/*Inserción Tipo Unidad --- ID_TYPE_UNIT, UNIT_TYPE_DESCRIPTION */
INSERT INTO type_unit VALUES ('UE', 'Unidad de extensión');

/*Inserción Unidad --- UNIT_CODE, ID_TYPE_UNIT, DEPENDENCY_UNIT, UNI_NAME */
INSERT INTO unit (unit_code, id_type_unit, uni_name) 
VALUES ('IGNEL', 'AC', 'FCIGN', 'Ingenieria electrica');
--!!!SOLO SI SE AGREGO LA UNIDAD E EXTENSIÓN!!!
INSERT INTO unit (unit_code, id_type_unit, dependency_unit, uni_name) 
VALUES ('UEASC', 'UE', 'FCIGN', 'Áreas Sociales');

--  Inserción rol --- ID_ROLE, NAME_ROLE, DESC_ROLE
INSERT INTO role (name_role, desc_role) 
VALUES ('Monitor', 'Asistente');

/* Inserción estudiante --- student_code, unit_code, student_names, student_surnames, birth_date,
inscription_date, email_address */
INSERT INTO student 
VALUES ('20182020145', 'ATESC', 'Margarita', 'Sandoval', to_date('27/11/1998','DD/MM/YYYY'), 
         to_date('15/10/2021','DD/MM/YYYY'), 'alberto@gmail.com');
--!!!SOLO SI AGREGA ELECTRICA!!!
INSERT INTO student 
VALUES ('20142010035', 'IGNEL', 'Sandro', 'Barragan', to_date('26/10/1995','DD/MM/YYYY'), 
         to_date('01/02/2022','DD/MM/YYYY'), 'sandro@gmail.com');

/* Insertar personaje-estudiante --- ID_CHARACTER_STUDENT, ID_PLAY, ID_CHARACTER, STUDENT_CODE, START_CHARACTER_DATE,
END_CHARACTER_DATE */
INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('RADJ', 'MDEL', '20142010035', to_date('25/03/2022','DD/MM/YYYY'), 
        to_date('22/03/2022','DD/MM/YYYY'));

--!!!! SOLO SI SE AGREGA EL DE LLAMAS
INSERT INTO character_student (id_play, id_character, student_code, start_character_date, 
                               end_character_date) 
VALUES ('LLLL', 'TALP', '20172020068', to_date('26/03/2022','DD/MM/YYYY'), 
        to_date('27/04/2022','DD/MM/YYYY'));

/* UNIT_CODE, EMPLOYEE_CODE, NAMES, SURNAMES, IDENTIFICATION_NUMBER, PHONE_NUMBER
EMAIL_ADDRESS */

INSERT INTO employee 
VALUES ('ATESC', 'TNRN', 'Tatiana', 'Rincon', '1026783679', '3156728908', 'tatiana@correo.com');

INSERT INTO employee 
VALUES ('PLCD1', 'VNCT', 'Vanesa', 'Castro', '1026897689', '3146786789', 'vanesa@correo.com');

/* EXPENSE_LIST */
--GASTO DE PUBLICIDAD
INSERT INTO EXPENSE_LIST
VALUES (2,'PLCD1'); 

/* INSERT DE STAGE_PLAY_STAFF*/
/*UNIT_CODE, EMPLOYEE_CODE, ID_ROLE, ID_PLAY, STAFF_START_DATE, STAFF_END_DATE*/
INSERT INTO STAGE_PLAY_STAFF (UNIT_CODE, EMPLOYEE_CODE, ID_ROLE, ID_PLAY, STAFF_START_DATE, STAFF_END_DATE) 
VALUES ('ATDZR','AJDZ',2,'RADJ',to_date('25/03/2022','DD/MM/YYYY'),to_date('06/05/2022 20:00', 'DD/MM/YYYY hh24:mi'));                                                                                      
---!!!! SOLO SI SE AGREGA LLAMAS
INSERT INTO STAGE_PLAY_STAFF (UNIT_CODE, EMPLOYEE_CODE, ID_ROLE, ID_PLAY, STAFF_START_DATE, STAFF_END_DATE) 
VALUES ('ATESC','TNRN',1,'LLLL',to_date('26/03/2022','DD/MM/YYYY'),to_date('27/04/2022 20:00', 'DD/MM/YYYY hh24:mi'));                                                                                      

/*INSERT WORK_PLAY_STAFF*/
 /*ID_WORK_PL_STA, UNIT_CODE, EMPLOYEE_CODE, ID_STA_PLA_STAFF, ID_PLAY, ID_FUNCTION, ID_TERM, ACTIVITY_CODE */
                                                                        
INSERT INTO WORK_PLAY_STAFF (UNIT_CODE, EMPLOYEE_CODE, ID_STA_PLA_STAFF, ID_PLAY, ID_FUNCTION, ID_TERM, ACTIVITY_CODE) 
VALUES ('ATDZR','AJDZ',4,'RADJ',7,2,'AULA1');                                                                                      
--- !!! SOLO SE SI AGREGA LLAMAS 
INSERT INTO WORK_PLAY_STAFF (UNIT_CODE, EMPLOYEE_CODE, ID_STA_PLA_STAFF, ID_PLAY, ID_FUNCTION, ID_TERM, ACTIVITY_CODE) 
VALUES ('PLCD1','VNCT',2,'LLLL',5,2,'AULA1');   

-- id_term, expense_code, id_expend_play, id_play, expend_date, 
INSERT INTO expend_play (id_term, expense_code, id_play, expend_date)
VALUES (2, 'GDECN', 'RADJ', to_date('23/03/2022','DD/MM/YYYY'));