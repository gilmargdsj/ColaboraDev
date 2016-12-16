ALTER TABLE "DaVinci".clientes  ADD COLUMN telefone_padrao BIGINT REFERENCES "DaVinci".telefones(ID) null;
ALTER TABLE "DaVinci".enderecos ADD COLUMN descricao character varying(200);
ALTER TABLE "DaVinci".enderecos ADD COLUMN numero character varying(10);
ALTER TABLE "DaVinci".produtos ADD COLUMN cod_catalogo character varying(10);
ALTER TABLE "DaVinci".produtos ADD COLUMN conteudo character varying(500);