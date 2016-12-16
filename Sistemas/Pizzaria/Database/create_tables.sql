/*
pedidos

SELECT *
FROM "DaVinci".pedidos
order by 

*/

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
    nome  character varying(200) not null,
    apelido  character varying(200),
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".clientes OWNER to postgres;

-- TABLE "DaVinci".enderecos
CREATE TABLE "DaVinci".enderecos
(
    ID bigint DEFAULT nextval('"DaVinci".endereco_id'::regclass) NOT NULL,
    cep character varying(200),
    logradouro character varying(200),
    complemento character varying(200),
    bairro character varying(200),
    cidade character varying(200),
    uf character varying(200),
    ibge character varying(200),
    gia character varying(200),
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".enderecos OWNER to postgres;

-- TABLE "DaVinci".telefones
CREATE TABLE "DaVinci".telefones
(
    ID bigint DEFAULT nextval('"DaVinci".telefone_id'::regclass) NOT NULL,
    numero character varying(200) not null,
    tipo_telefone character varying(30),
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".telefones OWNER to postgres;

-- TABLE "DaVinci".produtos
CREATE TABLE "DaVinci".produtos
(
    ID bigint DEFAULT nextval('"DaVinci".produto_id'::regclass) NOT NULL,
    descricao character varying(200) not null,
    preço_unitario numeric(13,4) not null,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".produtos OWNER to postgres;

-- TABLE "DaVinci".ingredientes
CREATE TABLE "DaVinci".ingredientes
(
    ID bigint DEFAULT nextval('"DaVinci".ingrediente_id'::regclass) NOT NULL,

    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".ingredientes OWNER to postgres;

-- TABLE "DaVinci".produtoXingredientes
CREATE TABLE "DaVinci".produtoXingredientes
(
    ID bigint DEFAULT nextval('"DaVinci".produtoXingredientes_id'::regclass) NOT NULL,
    
    produto_id BIGINT REFERENCES "DaVinci".produtos,
    ingrediente_id BIGINT REFERENCES "DaVinci".ingredientes, 
    
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".produtoXingredientes OWNER to postgres;

-- TABLE "DaVinci".usuarioXenderecos
CREATE TABLE "DaVinci".usuarioXenderecos
(
    ID bigint DEFAULT nextval('"DaVinci".usuarioXenderecos_id'::regclass) NOT NULL,

    usuario_id BIGINT REFERENCES "DaVinci".usuarios,
    endereco_id bigint REFERENCES "DaVinci".enderecos,
    
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".usuarioXenderecos OWNER to postgres;

-- TABLE "DaVinci".usuarioXtelefones
CREATE TABLE "DaVinci".usuarioXtelefones
(
    ID bigint DEFAULT nextval('"DaVinci".usuarioXtelefones_id'::regclass) NOT NULL,

    usuario_id BIGINT REFERENCES "DaVinci".usuarios,
    telefone_id BIGINT REFERENCES "DaVinci".telefones,
    
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".usuarioXtelefones OWNER to postgres;

-- TABLE "DaVinci".clienteXenderecos
CREATE TABLE "DaVinci".clienteXenderecos
(
    ID bigint DEFAULT nextval('"DaVinci".clienteXenderecos_id'::regclass) NOT NULL,
    cliente_id BIGINT REFERENCES "DaVinci".clientes on delete cascade,
    endereco_id BIGINT REFERENCES "DaVinci".enderecos on delete cascade,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".clienteXenderecos OWNER to postgres;

-- TABLE "DaVinci".clienteXtelefones
CREATE TABLE "DaVinci".clienteXtelefones
(
    ID bigint DEFAULT nextval('"DaVinci".clienteXtelefones_id'::regclass) NOT NULL,
    cliente_id BIGINT REFERENCES "DaVinci".clientes on delete cascade,
    telefone_id BIGINT REFERENCES "DaVinci".telefones on delete cascade,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".clienteXtelefones OWNER to postgres;

-- TABLE "DaVinci".pedidos
CREATE TABLE "DaVinci".pedidos
(
    ID bigint DEFAULT nextval('"DaVinci".pedido_id'::regclass) NOT NULL,
    cliente_id BIGINT REFERENCES "DaVinci".clientes,
    endereco_entrega BIGINT REFERENCES "DaVinci".enderecos(ID),
    taxa_entrega numeric(13,4) not null,
    valor_total numeric(13,4) not null,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".pedidos OWNER to postgres;

-- TABLE "DaVinci".pedidoXitems
CREATE TABLE "DaVinci".pedidoXitems
(
    ID bigint DEFAULT nextval('"DaVinci".pedidoXitems_id'::regclass) NOT NULL,

    pedido_id BIGINT REFERENCES "DaVinci".pedidos,
    produto_id BIGINT REFERENCES "DaVinci".produtos,
    qtde numeric(4,4) default 1,
    valor_unitario numeric(13,4) not null,
    valor_total numeric(13,4) not null,
    PRIMARY KEY (ID)
) WITH ( OIDS = FALSE ) TABLESPACE pg_default;
--
ALTER TABLE "DaVinci".pedidoXitems OWNER to postgres;
