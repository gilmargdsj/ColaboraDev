ALTER TABLE "DaVinci".clientes  ADD COLUMN telefone_padrao BIGINT REFERENCES "DaVinci".telefones(ID) null;
ALTER TABLE "DaVinci".enderecos ADD COLUMN descricao character varying(200);