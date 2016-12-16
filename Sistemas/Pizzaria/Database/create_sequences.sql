-- SEQUENCE "DaVinci".usuario_id 
CREATE SEQUENCE "DaVinci".usuario_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".usuario_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".usuario_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".clientes_id
CREATE SEQUENCE "DaVinci".cliente_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".cliente_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".cliente_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".endereco_id 
CREATE SEQUENCE "DaVinci".endereco_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".endereco_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".endereco_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".telefone_id 
CREATE SEQUENCE "DaVinci".telefone_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".telefone_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".telefone_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".usuarioXenderecos_id
CREATE SEQUENCE "DaVinci".usuarioXenderecos_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".usuarioXenderecos_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".usuarioXenderecos_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".usuarioXtelefones_id
CREATE SEQUENCE "DaVinci".usuarioXtelefones_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".usuarioXtelefones_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".usuarioXtelefones_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".clienteXenderecos_id
CREATE SEQUENCE "DaVinci".clienteXenderecos_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".clienteXenderecos_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".clienteXenderecos_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".clienteXtelefones_id
CREATE SEQUENCE "DaVinci".clienteXtelefones_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".clienteXtelefones_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".clienteXtelefones_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".produto_id
CREATE SEQUENCE "DaVinci".produto_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".produto_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".produto_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".ingrediente_id
CREATE SEQUENCE "DaVinci".ingrediente_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".ingrediente_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".ingrediente_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".produtoXingredientes_id
CREATE SEQUENCE "DaVinci".produtoXingredientes_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".produtoXingredientes_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".produtoXingredientes_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".pedido_id
CREATE SEQUENCE "DaVinci".pedido_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".pedido_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".pedido_id TO postgres WITH GRANT OPTION;

-- SEQUENCE "DaVinci".pedidoXitems_id
CREATE SEQUENCE "DaVinci".pedidoXitems_id INCREMENT 1 START 1 MINVALUE 1;
--
ALTER SEQUENCE "DaVinci".pedidoXitems_id OWNER TO postgres;
--
GRANT ALL ON SEQUENCE "DaVinci".pedidoXitems_id TO postgres WITH GRANT OPTION;

