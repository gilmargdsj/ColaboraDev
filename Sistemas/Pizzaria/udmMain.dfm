﻿object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 398
  Width = 672
  object UniConnection1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'DaVinci'
    Username = 'postgres'
    Server = '192.168.56.101'
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 24
    EncryptedPassword = '9DFF96FF8BFF91FF9EFF92FF96FF'
  end
  object qryClientes_: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT c.*'
      'FROM "DaVinci".clientes c'
      'where (id = :cliente_id) or (:cliente_id is null)')
    Active = True
    AfterScroll = qryClientes_AfterScroll
    Left = 240
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        Value = nil
      end>
    object qryClientes_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qryClientes_nome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 200
    end
    object qryClientes_apelido: TStringField
      FieldName = 'apelido'
      Size = 200
    end
    object qryClientes_telefone_padrao: TLargeintField
      FieldName = 'telefone_padrao'
    end
  end
  object PostgreSQLUniProvider1: TPostgreSQLUniProvider
    Left = 160
    Top = 24
  end
  object qryEnderecos_: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT e.*'
      'FROM "DaVinci".enderecos e'
      
        '  inner join "DaVinci".ClienteXEnderecos ce on (ce.endereco_id =' +
        ' e.ID)'
      '  inner join "DaVinci".Clientes c on (c.ID = ce.cliente_id)'
      'WHERE (c.ID = :cliente_id) or (:cliente_id is null)')
    DetailFields = 'id'
    Active = True
    BeforePost = qryEnderecos_BeforePost
    AfterPost = qryEnderecos_AfterPost
    Left = 136
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        Value = nil
      end>
    object qryEnderecos_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qryEnderecos_cep: TStringField
      FieldName = 'cep'
      Size = 200
    end
    object qryEnderecos_logradouro: TStringField
      FieldName = 'logradouro'
      Size = 200
    end
    object qryEnderecos_complemento: TStringField
      FieldName = 'complemento'
      Size = 200
    end
    object qryEnderecos_bairro: TStringField
      FieldName = 'bairro'
      Size = 200
    end
    object qryEnderecos_cidade: TStringField
      FieldName = 'cidade'
      Size = 200
    end
    object qryEnderecos_uf: TStringField
      FieldName = 'uf'
      Size = 200
    end
    object qryEnderecos_ibge: TStringField
      FieldName = 'ibge'
      Size = 200
    end
    object qryEnderecos_gia: TStringField
      FieldName = 'gia'
      Size = 200
    end
    object qryEnderecos_descricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
  end
  object qryTelefones_: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT t.*'
      'FROM "DaVinci".Telefones t'
      
        '  inner join "DaVinci".ClienteXTelefones ct on (ct.telefone_id =' +
        ' t.ID)'
      '  inner join "DaVinci".Clientes c on (c.ID = ct.cliente_id)'
      'WHERE (c.ID = :cliente_id) or (:cliente_id is null)')
    DetailFields = 'id'
    Active = True
    BeforePost = qryTelefones_BeforePost
    AfterPost = qryTelefones_AfterPost
    Left = 56
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        Value = nil
      end>
    object qryTelefones_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qryTelefones_numero: TStringField
      FieldName = 'numero'
      Required = True
      Size = 200
    end
    object qryTelefones_tipo_telefone: TStringField
      FieldName = 'tipo_telefone'
      Size = 30
    end
  end
  object qryClienteXEnderecos_: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO "DaVinci".clientexenderecos'
      '  (cliente_id, endereco_id)'
      'VALUES'
      '  (:cliente_id, :endereco_id)')
    SQLDelete.Strings = (
      'DELETE FROM "DaVinci".clientexenderecos'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE "DaVinci".clientexenderecos'
      'SET'
      '  cliente_id = :cliente_id, endereco_id = :endereco_id'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM "DaVinci".clientexenderecos'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT cliente_id, endereco_id FROM "DaVinci".clientexenderecos'
      'WHERE'
      '  id = :P_1_id')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM "DaVinci".clientexenderecos'
      ''
      ') t')
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM "DaVinci".clienteXenderecos'
      'order by cliente_id')
    DetailFields = 'cliente_id'
    Active = True
    Left = 248
    Top = 240
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id'
        ParamType = ptInput
        Value = nil
      end>
    object qryClienteXEnderecos_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qryClienteXEnderecos_cliente_id: TLargeintField
      FieldName = 'cliente_id'
    end
    object qryClienteXEnderecos_endereco_id: TLargeintField
      FieldName = 'endereco_id'
    end
  end
  object qryProdutos_: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM "DaVinci".produtos'
      'order by descricao')
    Active = True
    Left = 480
    Top = 56
    object qryProdutos_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qryProdutos_descricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 200
    end
    object qryProdutos_preço_unitario: TFloatField
      FieldName = 'pre'#231'o_unitario'
      Required = True
    end
  end
  object qryPedidos_: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM "DaVinci".pedidos'
      'order by id')
    Active = True
    Left = 560
    Top = 56
  end
  object qryPedidoXitems_: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM "DaVinci".pedidoXitems'
      'order by pedido_id')
    Active = True
    Left = 560
    Top = 120
    object qryPedidoXitems_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qryPedidoXitems_pedido_id: TLargeintField
      FieldName = 'pedido_id'
    end
    object qryPedidoXitems_produto_id: TLargeintField
      FieldName = 'produto_id'
    end
    object qryPedidoXitems_qtde: TFloatField
      FieldName = 'qtde'
    end
    object qryPedidoXitems_valor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Required = True
    end
    object qryPedidoXitems_valor_total: TFloatField
      FieldName = 'valor_total'
      Required = True
    end
  end
  object qryClienteXTelefones_: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM "DaVinci".clienteXtelefones'
      'order by cliente_id')
    DetailFields = 'cliente_id'
    Active = True
    Left = 248
    Top = 304
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'id'
        ParamType = ptInput
        Value = nil
      end>
    object qryClienteXTelefones_id: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object qryClienteXTelefones_cliente_id: TLargeintField
      FieldName = 'cliente_id'
    end
    object qryClienteXTelefones_telefone_id: TLargeintField
      FieldName = 'telefone_id'
    end
  end
end