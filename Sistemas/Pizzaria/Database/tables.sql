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