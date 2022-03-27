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