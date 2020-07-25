-- DATOS DE PRUEBA

-- DELETES --

DELETE FROM HOSPEDAJE;
DELETE FROM COMPRAS_EVENTO;
DELETE FROM EVENTO;
DELETE FROM REGISTRO_CAMBIOS_VOTANTE;
DELETE FROM REGISTRO_DESAFILIACION;
DELETE FROM HISTORIAL_PAGOS;
DELETE FROM CONTROL_VOTACION;
DELETE FROM VOTO;
DELETE FROM MOCION;
DELETE FROM INTEGRANTE_COMISION;
DELETE FROM LISTA;
DELETE FROM VOTANTE;
DELETE FROM VOTACION;
DELETE FROM ADMINISTRATIVO;

-- TABLE : ADMINISTRATIVO --

INSERT INTO ADMINISTRATIVO (NRO_ADMIN) VALUES (1);
INSERT INTO ADMINISTRATIVO (NRO_ADMIN) VALUES (2);
INSERT INTO ADMINISTRATIVO (NRO_ADMIN) VALUES (3);
INSERT INTO ADMINISTRATIVO (NRO_ADMIN) VALUES (4);
INSERT INTO ADMINISTRATIVO (NRO_ADMIN) VALUES (5);
INSERT INTO ADMINISTRATIVO (NRO_ADMIN) VALUES (6);
INSERT INTO ADMINISTRATIVO (NRO_ADMIN) VALUES (7);

SELECT *
FROM ADMINISTRATIVO;

-- TABLE : VOTACION --

INSERT INTO VOTACION (INICIO, FIN, ESTADO)
VALUES (TO_DATE('2018/01/01 01:00:00', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/01/02 01:00:00', 'YYYY/MM/DD HH:MI:SS'), 'BORRADOR');
INSERT INTO VOTACION (INICIO, FIN, ESTADO)
VALUES (TO_DATE('2018/01/02 02:00:00', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/01/03 02:00:00', 'YYYY/MM/DD HH:MI:SS'), 'BORRADOR');
INSERT INTO VOTACION (INICIO, FIN, ESTADO)
VALUES (TO_DATE('2018/01/03 03:00:00', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/01/04 03:00:00', 'YYYY/MM/DD HH:MI:SS'), 'BORRADOR');
INSERT INTO VOTACION (INICIO, FIN, ESTADO)
VALUES (TO_DATE('2018/01/04 04:00:00', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/01/05 04:00:00', 'YYYY/MM/DD HH:MI:SS'), 'BORRADOR');
INSERT INTO VOTACION (INICIO, FIN, ESTADO)
VALUES (TO_DATE('2018/01/20 04:00:00', 'YYYY/MM/DD HH:MI:SS'), TO_DATE('2018/01/30 04:00:00', 'YYYY/MM/DD HH:MI:SS'), 'BORRADOR');

UPDATE VOTACION
SET ESTADO = 'HABILITADA'
    WHERE ID = 2; 

SELECT *
FROM VOTACION;

-- TABLE : VOTANTE --

INSERT INTO VOTANTE (CI, CREDENCIAL, USUARIO, CONTRASENA, NOMBRE, APELLIDO, ADMIN_STAMP)
VALUES ('19087659', '982098349', 'MATIASHRNNDZ', 'CONTRASENA1', 'MATIAS', 'HERNANDEZ', 1);
INSERT INTO VOTANTE (CI, CREDENCIAL, USUARIO, CONTRASENA, NOMBRE, APELLIDO, ADMIN_STAMP)
VALUES ('29087659', '897657432', 'GIAN', 'CONTRASENA2', 'GIANFRANCO', 'DRAGO', 2);
INSERT INTO VOTANTE (CI, CREDENCIAL, USUARIO, CONTRASENA, NOMBRE, APELLIDO, ADMIN_STAMP)
VALUES ('39087659', '997657432', 'JUAN94', 'CONTRASENA3', 'JUAN', 'RODRIGUEZ', 3);
INSERT INTO VOTANTE (CI, CREDENCIAL, USUARIO, CONTRASENA, NOMBRE, APELLIDO, ADMIN_STAMP)
VALUES ('49087659', '107657432', 'AGUSDR', 'CONTRASENA4', 'AGUSTINA', 'DROCCO', 4);
INSERT INTO VOTANTE (CI, CREDENCIAL, USUARIO, CONTRASENA, NOMBRE, APELLIDO, ADMIN_STAMP)
VALUES ('59087659', '117657432', 'JOSEM', 'CONTRASENA5', 'JOSE', 'MARTINEZ', 5);
INSERT INTO VOTANTE (CI, CREDENCIAL, USUARIO, CONTRASENA, NOMBRE, APELLIDO, ADMIN_STAMP)
VALUES ('43087659', '117653232', 'RUDOLF', 'NETBEANS', 'RODOLFO', 'MARTINEZ', 5);

SELECT *
FROM VOTANTE;

-- TABLE : LISTA --

INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (21, 2, 'LEMA 21');
INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (22, 2, 'LEMA 22');
INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (23, 2, 'LEMA 23');
INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (31, 3, 'LEMA 31');
INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (32, 3, 'LEMA 32');
INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (41, 4, 'LEMA 41');
INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (42, 4, 'LEMA 42');
INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (51, 5, 'LEMA 51');
INSERT INTO LISTA (NUMERO, VOTACION_ID, LEMA)
VALUES (52, 5, 'LEMA 52');

SELECT *
FROM LISTA;

-- INTEGRANTE_COMISION --

INSERT INTO INTEGRANTE_COMISION (VOTANTE_NRO_AFILIADO, VOTACION_ID, LISTA_NUMERO, COMISION_TIPO, PENDIENTE)
VALUES (1, 2, 21, 'DIRECTIVA', 'V');
INSERT INTO INTEGRANTE_COMISION (VOTANTE_NRO_AFILIADO, VOTACION_ID, LISTA_NUMERO, COMISION_TIPO, PENDIENTE)
VALUES (2, 2, 21, 'ELECTORAL', 'F');
INSERT INTO INTEGRANTE_COMISION (VOTANTE_NRO_AFILIADO, VOTACION_ID, LISTA_NUMERO, COMISION_TIPO, PENDIENTE)
VALUES (3, 2, 21, 'FISCAL', 'V');
INSERT INTO INTEGRANTE_COMISION (VOTANTE_NRO_AFILIADO, VOTACION_ID, LISTA_NUMERO, COMISION_TIPO, PENDIENTE)
VALUES (1, 3, 22, 'FISCAL', 'V');
INSERT INTO INTEGRANTE_COMISION (VOTANTE_NRO_AFILIADO, VOTACION_ID, LISTA_NUMERO, COMISION_TIPO, PENDIENTE)
VALUES (1, 4, 22, 'DIRECTIVA', 'V');
INSERT INTO INTEGRANTE_COMISION (VOTANTE_NRO_AFILIADO, VOTACION_ID, LISTA_NUMERO, COMISION_TIPO, PENDIENTE)
VALUES (5, 5, 52, 'ELECTORAL', 'F');

SELECT *
FROM INTEGRANTE_COMISION;

-- MOCION --

INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_21', 2, 'DESCRIPCION_1');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_22', 2, 'DESCRIPCION_2');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_23', 2, 'DESCRIPCION_3');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_24', 2, 'DESCRIPCION_4');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_25', 2, 'DESCRIPCION_5');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_26', 2, 'DESCRIPCION_6');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_27', 2, 'DESCRIPCION_7');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_31', 3, 'DESCRIPCION_8');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_32', 3, 'DESCRIPCION_9');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_33', 3, 'DESCRIPCION_10');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_51', 5, 'DESCRIPCION_1');
INSERT INTO MOCION (NOMBRE, VOTACION_ID, DESCRIPCION)
VALUES ('MOCION_52', 5, 'DESCRIPCION_2');

SELECT *
FROM MOCION;

-- VOTO -- 

INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'DIRECTIVA', 21, 22, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'APROBACION MOCION', NULL, NULL, NULL, 'APROBADA', 'RECHAZADA', 'EN BLANCO', 'RECHAZADA', 'APROBADA', 'RECHAZADA', 'EN BLANCO', NULL, NULL, NULL);
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'SELECCION MOCION', NULL, NULL, NULL, 'EN BLANCO', 'APROBADA', 'EN BLANCO', 'EN BLANCO', 'EN BLANCO', 'EN BLANCO', 'EN BLANCO', NULL, NULL, NULL);
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'DIRECTIVA', 21, 21, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- SE PUEDE VOTAR EN BLANCO ALGUNA LISTA CON NULL
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'DIRECTIVA', 21, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- SE PUEDE VOTAR EN BLANCO TODAS LAS LISTA CON NULL
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'DIRECTIVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Rechaza porque hay 7 mociones en la votaci�n y ac� se intenta votar 8 mociones
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'APROBACION MOCION', NULL, NULL, NULL, 'EN BLANCO', 'EN BLANCO', 'EN BLANCO', 'EN BLANCO', 'EN BLANCO', 'EN BLANCO', 'EN BLANCO', 'RECHAZADA', NULL, NULL);
-- No se puede ingresar valores a otra votacion que no sea Directiva.
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'DIRECTIVA', 21, 22, 23, 'APROBADA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- No existe la lista 29, por eso no deja
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'DIRECTIVA', 29, 22, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- No pueden haber votos para la votacion directiva cuando se esta votando aprobacion de mocion.
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'APROBACION MOCION', 21, 22, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- No pueden haber votos para la votacion directiva cuando se esta votando seleccion de mocion.
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'SELECCION MOCION', 21, 22, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Voto de seleccion de mocion invalido. Mas de 1 aprobada.
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (2, 'SELECCION MOCION', NULL, NULL, NULL, 'APROBADA', 'RECHAZADA', 'EN BLANCO', 'RECHAZADA', 'APROBADA', 'RECHAZADA', 'EN BLANCO', NULL, NULL, NULL);
-- Se realizan votos para la eliminaci�n de votaci�n
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (5, 'DIRECTIVA', 51, 52, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO VOTO (VOTACION_ID, TIPO_VOTACION, COMISION_DIRECTIVA, COMISION_FISCAL, COMISION_ELECTORAL,
MOCION_1, MOCION_2, MOCION_3, MOCION_4, MOCION_5, MOCION_6, MOCION_7, MOCION_8, MOCION_9, MOCION_10)
VALUES (5, 'APROBACION MOCION', NULL, NULL, NULL, 'APROBADA', 'RECHAZADA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

SELECT *
FROM VOTO;

-- CONTROL_VOTACION --

INSERT INTO CONTROL_VOTACION (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
VALUES (1, 2, 'DIRECTIVA');
INSERT INTO CONTROL_VOTACION (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
VALUES (1, 2, 'APROBACION MOCION');
INSERT INTO CONTROL_VOTACION (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
VALUES (1, 2, 'SELECCION MOCION');
INSERT INTO CONTROL_VOTACION (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
VALUES (2, 2, 'DIRECTIVA');
INSERT INTO CONTROL_VOTACION (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
VALUES (3, 2, 'DIRECTIVA');
INSERT INTO CONTROL_VOTACION (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
VALUES (4, 2, 'DIRECTIVA');
INSERT INTO CONTROL_VOTACION (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
VALUES (5, 5, 'DIRECTIVA');
INSERT INTO CONTROL_VOTACION (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
VALUES (5, 5, 'APROBACION MOCION');

SELECT *
FROM CONTROL_VOTACION;

-- HISTORIAL_PAGOS --

INSERT INTO HISTORIAL_PAGOS (VOTANTE_NRO_AFILIADO, FECHA)
VALUES (1, TO_DATE('2018/01/01 01:00:00', 'YYYY/MM/DD HH:MI:SS'));
INSERT INTO HISTORIAL_PAGOS (VOTANTE_NRO_AFILIADO, FECHA)
VALUES (2, TO_DATE('2018/01/02 01:00:00', 'YYYY/MM/DD HH:MI:SS'));
INSERT INTO HISTORIAL_PAGOS (VOTANTE_NRO_AFILIADO, FECHA)
VALUES (3, TO_DATE('2018/01/03 01:00:00', 'YYYY/MM/DD HH:MI:SS'));

SELECT * 
FROM HISTORIAL_PAGOS;

-- REGISTRO_DESAFILIACION --

INSERT INTO REGISTRO_DESAFILIACION (NRO_AFILIADO, MOTIVO, FECHA)
VALUES (8, 'No estaba al dia.', TO_DATE('2018/01/01 01:00:00', 'YYYY/MM/DD HH:MI:SS'));
INSERT INTO REGISTRO_DESAFILIACION (NRO_AFILIADO, MOTIVO, FECHA)
VALUES (9, 'No estaba interesado.', TO_DATE('2018/01/02 02:00:00', 'YYYY/MM/DD HH:MI:SS'));

SELECT *
FROM REGISTRO_DESAFILIACION;

-- REGISTRO_CAMBIOS_VOTANTE --

INSERT INTO REGISTRO_CAMBIOS_VOTANTE (VOTANTE_NRO_AFILIADO, ADMINISTRATIVO_NRO_ADMIN, FECHA)
VALUES(5, 1, TO_DATE('2018/01/08 02:00:00', 'YYYY/MM/DD HH:MI:SS'));
INSERT INTO REGISTRO_CAMBIOS_VOTANTE (VOTANTE_NRO_AFILIADO, ADMINISTRATIVO_NRO_ADMIN, FECHA)
VALUES(4, 2, TO_DATE('2018/11/24 7:39:00', 'YYYY/MM/DD HH:MI:SS'));

SELECT *
FROM REGISTRO_CAMBIOS_VOTANTE;

-- EVENTO --

INSERT INTO EVENTO (VOTACION_ID, CIUDAD)
VALUES(1, 'MONTEVIDEO');
INSERT INTO EVENTO (VOTACION_ID, CIUDAD)
VALUES(2, 'COLONIA');
INSERT INTO EVENTO (VOTACION_ID, CIUDAD)
VALUES(3, 'CANELONES');
INSERT INTO EVENTO (VOTACION_ID, CIUDAD)
VALUES(4, 'MONTEVIDEO');
INSERT INTO EVENTO (VOTACION_ID, CIUDAD)
VALUES(5, 'RIO');

SELECT *
FROM EVENTO;

-- COMPRAS_EVENTO --

INSERT INTO COMPRAS_EVENTO(EVENTO_ID, ADMINISTRATIVO_NRO_ADMIN, FECHA, MONEDA, TIPO_CAMBIO, MONTO)
VALUES(1, 1, TO_DATE('2018/02/25 7:00:00', 'YYYY/MM/DD HH:MI:SS'), 'N', 33.25, 5000); 
INSERT INTO COMPRAS_EVENTO(EVENTO_ID, ADMINISTRATIVO_NRO_ADMIN, FECHA, MONEDA, TIPO_CAMBIO, MONTO)
VALUES(1, 1, TO_DATE('2018/01/24 7:00:00', 'YYYY/MM/DD HH:MI:SS'), 'N', 34.26, 10000); 
INSERT INTO COMPRAS_EVENTO(EVENTO_ID, ADMINISTRATIVO_NRO_ADMIN, FECHA, MONEDA, TIPO_CAMBIO, MONTO)
VALUES(2, 2, TO_DATE('2018/02/20 7:00:00', 'YYYY/MM/DD HH:MI:SS'), 'N', 32.5, 100500); 
INSERT INTO COMPRAS_EVENTO(EVENTO_ID, ADMINISTRATIVO_NRO_ADMIN, FECHA, MONEDA, TIPO_CAMBIO, MONTO)
VALUES(5, 2, TO_DATE('2018/02/20 7:00:00', 'YYYY/MM/DD HH:MI:SS'), 'N', 32.5, 34345);

SELECT *
FROM COMPRAS_EVENTO;

-- HOSPEDAJE --

INSERT INTO HOSPEDAJE (VOTANTE_NRO_AFILIADO, EVENTO_ID, ACOMPANANTE_NRO_AFILIADO, TIPO_HABITACION)
VALUES(1, 1, 3, 'SUITE');
INSERT INTO HOSPEDAJE (VOTANTE_NRO_AFILIADO, EVENTO_ID, ACOMPANANTE_NRO_AFILIADO, TIPO_HABITACION)
VALUES(2, 1, 4, 'DOBLE');
INSERT INTO HOSPEDAJE (VOTANTE_NRO_AFILIADO, EVENTO_ID, ACOMPANANTE_NRO_AFILIADO, TIPO_HABITACION)
VALUES(3, 3, 2, 'SIMPLE');
INSERT INTO HOSPEDAJE (VOTANTE_NRO_AFILIADO, EVENTO_ID, ACOMPANANTE_NRO_AFILIADO, TIPO_HABITACION)
VALUES(4, 4, 1, 'SUITE');
INSERT INTO HOSPEDAJE (VOTANTE_NRO_AFILIADO, EVENTO_ID, ACOMPANANTE_NRO_AFILIADO, TIPO_HABITACION)
VALUES(5, 5, 1, 'SUITE');

SELECT *
FROM HOSPEDAJE;

--


