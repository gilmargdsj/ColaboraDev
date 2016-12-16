CREATE DATABASE "DaVinci"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

GRANT ALL ON DATABASE "DaVinci" TO postgres WITH GRANT OPTION;


-- SCHEMA: DaVinci

DROP SCHEMA "DaVinci" ;

CREATE SCHEMA "DaVinci"
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA "DaVinci" TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES IN SCHEMA "DaVinci"
GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES IN SCHEMA "DaVinci"
GRANT SELECT, USAGE ON SEQUENCES TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES IN SCHEMA "DaVinci"
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

ALTER DEFAULT PRIVILEGES IN SCHEMA "DaVinci"
GRANT USAGE ON TYPES TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".usuarios_id 
CREATE SEQUENCE "DaVinci".usuarios_id
    INCREMENT 1
    START 1
    MINVALUE;
--
ALTER SEQUENCE "DaVinci".usuario_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".usuario_id TO postgres WITH GRANT OPTION;
-- TABLE "DaVinci".usuarios
CREATE TABLE "DaVinci".usuarios
(
    ID bigint DEFAULT nextval('"DaVinci".usuario_id'::regclass) NOT NULL,
    login character varying(50) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(200) NOT NULL,
    nome character varying,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".usuarios OWNER to postgres;

-- SEQUENCE "DaVinci".cliente_id
CREATE SEQUENCE "DaVinci".cliente_id
    INCREMENT 1
    START 1
    MINVALUE;
--
ALTER SEQUENCE "DaVinci".cliente_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".cliente_id TO postgres WITH GRANT OPTION;
-- TABLE "DaVinci".clientes
CREATE TABLE "DaVinci".clientes
(
    ID bigint DEFAULT nextval('"DaVinci".cliente_id'::regclass) NOT NULL,
    login character varying(50) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(200) NOT NULL,
    nome character varying,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".clientes OWNER to postgres;

-- SEQUENCE "DaVinci".produto_id
CREATE SEQUENCE "DaVinci".produto_id
    INCREMENT 1
    START 1
    MINVALUE;
--
ALTER SEQUENCE "DaVinci".produto_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".produto_id TO postgres WITH GRANT OPTION;
-- TABLE "DaVinci".produtos
CREATE TABLE "DaVinci".produtos
(
    ID bigint DEFAULT nextval('"DaVinci".produto_id'::regclass) NOT NULL,
    login character varying(50) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(200) NOT NULL,
    nome character varying,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".produtos OWNER to postgres;

-- SEQUENCE "DaVinci".ingrediente_id
CREATE SEQUENCE "DaVinci".ingrediente_id
    INCREMENT 1
    START 1
    MINVALUE;
--
ALTER SEQUENCE "DaVinci".ingrediente_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".ingrediente_id TO postgres WITH GRANT OPTION;
-- TABLE "DaVinci".ingredientes
CREATE TABLE "DaVinci".ingredientes
(
    ID bigint DEFAULT nextval('"DaVinci".ingrediente_id'::regclass) NOT NULL,
    login character varying(50) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(200) NOT NULL,
    nome character varying,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".ingredientes OWNER to postgres;

-- SEQUENCE "DaVinci".produtoXingrediente_id
CREATE SEQUENCE "DaVinci".produtoXingredientes_id
    INCREMENT 1
    START 1
    MINVALUE;
--
ALTER SEQUENCE "DaVinci".produtoXingredientes_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".produtoXingredientes_id TO postgres WITH GRANT OPTION;
-- TABLE "DaVinci".ingredientes
CREATE TABLE "DaVinci".produtoXingredientes
(
    ID bigint DEFAULT nextval('"DaVinci".produtoXingredientes_id'::regclass) NOT NULL,
    login character varying(50) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(200) NOT NULL,
    nome character varying,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".produtoXingredientes OWNER to postgres;

-- SEQUENCE "DaVinci".produtoXingrediente_id
CREATE SEQUENCE "DaVinci".produtoXingredientes_id
    INCREMENT 1
    START 1
    MINVALUE;
--
ALTER SEQUENCE "DaVinci".produtoXingredientes_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".produtoXingredientes_id TO postgres WITH GRANT OPTION;
-- TABLE "DaVinci".ingredientes
CREATE TABLE "DaVinci".produtoXingredientes
(
    ID bigint DEFAULT nextval('"DaVinci".produtoXingredientes_id'::regclass) NOT NULL,
    login character varying(50) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(200) NOT NULL,
    nome character varying,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".produtoXingredientes OWNER to postgres;
