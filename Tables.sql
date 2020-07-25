-- BASES DE DATOS 2 - OBLIGATORIO

---------------------------------------------------------- TABLES --------------------------------------------------------------

-- DROP TABLES --

DROP TABLE HOSPEDAJE;
DROP TABLE COMPRAS_EVENTO;
DROP TABLE EVENTO;
DROP TABLE REGISTRO_CAMBIOS_VOTANTE;
DROP TABLE REGISTRO_DESAFILIACION;
DROP TABLE HISTORIAL_PAGOS;
DROP TABLE CONTROL_VOTACION;
DROP TABLE VOTO;
DROP TABLE MOCION;
DROP TABLE INTEGRANTE_COMISION;
DROP TABLE LISTA;
DROP TABLE VOTANTE;
DROP TABLE VOTACION;
DROP TABLE ADMINISTRATIVO;

-- TABLE : ADMINISTRATIVO --

CREATE TABLE ADMINISTRATIVO (
    NRO_ADMIN NUMBER(8) NOT NULL,
    PRIMARY KEY (NRO_ADMIN)
);

-- TABLE : VOTACION --

CREATE TABLE VOTACION (
    ID NUMBER(10) NOT NULL,
    INICIO DATE NOT NULL,
    FIN DATE NOT NULL,
    ESTADO VARCHAR(10) NOT NULL,
    CHECK (INICIO < FIN),
    CHECK (ESTADO IN ('HABILITADA', 'BORRADOR', 'CERRADA', 'PUBLICADA')),
    PRIMARY KEY (ID)
);

-- TABLE : VOTANTE --

CREATE TABLE VOTANTE (
    NRO_AFILIADO NUMBER(10) NOT NULL,
    CI NUMBER(8) NOT NULL UNIQUE,
    CREDENCIAL VARCHAR(9) NOT NULL UNIQUE,
    USUARIO VARCHAR(40) NOT NULL UNIQUE,
    CONTRASENA VARCHAR(255) NOT NULL,
    NOMBRE VARCHAR(40) NOT NULL,
    APELLIDO VARCHAR (40) NOT NULL,
    HABILITADO CHAR(1) DEFAULT 'F' NOT NULL,
    ADMIN_STAMP NUMBER(8) NOT NULL REFERENCES ADMINISTRATIVO (NRO_ADMIN),
    CHECK(HABILITADO IN ('V', 'F')),
    PRIMARY KEY(NRO_AFILIADO)
);

-- TABLE : LISTA --

CREATE TABLE LISTA (
    NUMERO NUMBER(4) NOT NULL UNIQUE,
    VOTACION_ID NUMBER(10) NOT NULL REFERENCES VOTACION(ID),
    LEMA VARCHAR(100) NOT NULL,
    VOTOS_DIRECTIVA NUMBER(4) DEFAULT 0 NOT NULL,
    VOTOS_FISCAL NUMBER(4) DEFAULT 0 NOT NULL,
    VOTOS_ELECTORAL NUMBER(4) DEFAULT 0 NOT NULL,
    PRIMARY KEY (NUMERO, VOTACION_ID)
);

-- TABLE : INTEGRANTE_COMISION --

CREATE TABLE INTEGRANTE_COMISION (
    VOTANTE_NRO_AFILIADO NUMBER(10) NOT NULL,
    VOTACION_ID NUMBER(10) NOT NULL REFERENCES VOTACION (ID),
    LISTA_NUMERO NUMBER(4) NOT NULL REFERENCES LISTA (NUMERO),
    COMISION_TIPO VARCHAR(9) NOT NULL,
    PENDIENTE CHAR(1) NOT NULL,
    CHECK (PENDIENTE IN ('V', 'F')),
    CHECK (COMISION_TIPO IN ('DIRECTIVA', 'FISCAL', 'ELECTORAL')),
    PRIMARY KEY (VOTANTE_NRO_AFILIADO, VOTACION_ID)
);

-- TABLE : MOCION --

CREATE TABLE MOCION (
    ID NUMBER(10) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL UNIQUE,
    VOTACION_ID NUMBER(10) NOT NULL REFERENCES VOTACION (ID),
    DESCRIPCION VARCHAR(150) DEFAULT 'NO HAY DESCRIPCION' NOT NULL,
    SELECCION_APROBADA NUMBER(4) DEFAULT 0 NOT NULL,
    SELECCION_RECHAZADA NUMBER(4) DEFAULT 0 NOT NULL,
    SELECCION_ENBLANCO NUMBER(4) DEFAULT 0 NOT NULL,
    APROBACION_APROBADA NUMBER(4) DEFAULT 0 NOT NULL,
    APROBACION_RECHAZADA NUMBER(4) DEFAULT 0 NOT NULL,
    APROBACION_ENBLANCO NUMBER(4) DEFAULT 0 NOT NULL,
    PRIMARY KEY (NOMBRE, VOTACION_ID)
);

-- TABLE : VOTO --

CREATE TABLE VOTO (
    ID NUMBER(8) NOT NULL,
    VOTACION_ID NUMBER(10) NOT NULL REFERENCES VOTACION (ID),
    TIPO_VOTACION VARCHAR(17) NOT NULL,
    COMISION_DIRECTIVA NUMBER(4) REFERENCES LISTA (NUMERO),
    COMISION_FISCAL NUMBER(4) REFERENCES LISTA (NUMERO),
    COMISION_ELECTORAL NUMBER(4) REFERENCES LISTA (NUMERO),
    MOCION_1 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_2 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_3 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_4 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_5 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_6 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_7 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_8 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_9 VARCHAR(9) DEFAULT 'EN BLANCO',
    MOCION_10 VARCHAR(9) DEFAULT 'EN BLANCO',
    CHECK (TIPO_VOTACION IN ('DIRECTIVA', 'APROBACION MOCION', 'SELECCION MOCION')),
    CHECK ((MOCION_1 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_1 IS NULL),
    CHECK ((MOCION_2 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_2 IS NULL),
    CHECK ((MOCION_3 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_3 IS NULL),
    CHECK ((MOCION_4 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_4 IS NULL),
    CHECK ((MOCION_5 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_5 IS NULL),
    CHECK ((MOCION_6 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_6 IS NULL),
    CHECK ((MOCION_7 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_7 IS NULL),
    CHECK ((MOCION_8 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_8 IS NULL),
    CHECK ((MOCION_9 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_9 IS NULL),
    CHECK ((MOCION_10 IN ('APROBADA', 'RECHAZADA', 'EN BLANCO')) OR MOCION_10 IS NULL),
    PRIMARY KEY (ID)
);

-- TABLE : CONTROL_VOTACION --

CREATE TABLE CONTROL_VOTACION (
    VOTANTE_NRO_AFILIADO NUMBER(10) NOT NULL REFERENCES VOTANTE (NRO_AFILIADO),
    VOTACION_ID NUMBER(10) NOT NULL REFERENCES VOTACION (ID),
    TIPO_VOTACION VARCHAR(17) NOT NULL,
    CHECK (TIPO_VOTACION IN ('DIRECTIVA', 'APROBACION MOCION', 'SELECCION MOCION')),
    PRIMARY KEY (VOTANTE_NRO_AFILIADO, VOTACION_ID, TIPO_VOTACION)
);

-- TABLE : HISTORIAL_PAGOS --

CREATE TABLE HISTORIAL_PAGOS (
    VOTANTE_NRO_AFILIADO NUMBER (10) NOT NULL REFERENCES VOTANTE (NRO_AFILIADO),
    FECHA DATE NOT NULL,
    PRIMARY KEY (FECHA, VOTANTE_NRO_AFILIADO)
);

-- TABLE : REGISTRO_DESAFILIACION --

CREATE TABLE REGISTRO_DESAFILIACION (
    NRO_AFILIADO NUMBER(10) NOT NULL,
    MOTIVO VARCHAR(255),
    FECHA DATE NOT NULL,
    PRIMARY KEY (NRO_AFILIADO, FECHA)
);

-- TABLE : REGISTRO_CAMBIOS_VOTANTE --
    
CREATE TABLE REGISTRO_CAMBIOS_VOTANTE(
    VOTANTE_NRO_AFILIADO NUMBER(10) NOT NULL REFERENCES VOTANTE (NRO_AFILIADO),
    ADMINISTRATIVO_NRO_ADMIN NUMBER(8) NOT NULL REFERENCES ADMINISTRATIVO (NRO_ADMIN),
    FECHA DATE DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY (VOTANTE_NRO_AFILIADO, ADMINISTRATIVO_NRO_ADMIN, FECHA)
);

-- TABLE : EVENTO --

CREATE TABLE EVENTO (
    VOTACION_ID NUMBER (10) NOT NULL REFERENCES VOTACION (ID),
    CIUDAD VARCHAR (45) NOT NULL,
    PRIMARY KEY (VOTACION_ID)
);

-- TABLE : COMPRAS_EVENTO --

CREATE TABLE COMPRAS_EVENTO (
    ID NUMBER(10) NOT NULL,
    EVENTO_ID NUMBER(10) NOT NULL REFERENCES EVENTO (VOTACION_ID),
    ADMINISTRATIVO_NRO_ADMIN NUMBER(8) NOT NULL REFERENCES ADMINISTRATIVO (NRO_ADMIN),
    FECHA DATE NOT NULL,
    MONEDA CHAR(1) NOT NULL,
    TIPO_CAMBIO NUMBER(4,2) DEFAULT (33.25) NOT NULL,
    MONTO NUMBER(10) NOT NULL,
    CHECK (MONEDA IN ('N', 'D')),
    CHECK (MONTO >= 0),
    CHECK (TIPO_CAMBIO > 0),
    PRIMARY KEY (ID)
);
    
-- TABLE : HOSPEDAJE --

CREATE TABLE HOSPEDAJE (
    VOTANTE_NRO_AFILIADO NUMBER(10) NOT NULL REFERENCES VOTANTE (NRO_AFILIADO),
    EVENTO_ID NUMBER(10) NOT NULL REFERENCES EVENTO (VOTACION_ID),
    ACOMPANANTE_NRO_AFILIADO NUMBER(10) REFERENCES VOTANTE (NRO_AFILIADO),
    TIPO_HABITACION VARCHAR(6) NOT NULL,
    CHECK (TIPO_HABITACION IN ('SIMPLE', 'DOBLE', 'TRIPLE', 'SUITE')),
    PRIMARY KEY (VOTANTE_NRO_AFILIADO, EVENTO_ID, ACOMPANANTE_NRO_AFILIADO)
);

CREATE TABLE MATERIALIZACION_RESUMEN (
    INICIO DATE NOT NULL,
    FIN DATE NOT NULL,
    RESUMEN VARCHAR(4000) NOT NULL,
    PRIMARY KEY (INICIO, FIN)
)