unit udmMain;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MemDS,
  DBAccess,
  Uni,
  UniProvider,
  PostgreSQLUniProvider,
  clsTDBUtils;

type
  TdmMain = class(TDataModule)
    UniConnection1: TUniConnection;
    qryClientes_: TUniQuery;
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    qryEnderecos_: TUniQuery;
    qryTelefones_: TUniQuery;
    qryClientes_id: TLargeintField;
    qryClientes_nome: TStringField;
    qryClientes_apelido: TStringField;
    qryClientes_telefone_padrao: TLargeintField;
    qryEnderecos_id: TLargeintField;
    qryEnderecos_cep: TStringField;
    qryEnderecos_logradouro: TStringField;
    qryEnderecos_complemento: TStringField;
    qryEnderecos_bairro: TStringField;
    qryEnderecos_cidade: TStringField;
    qryEnderecos_uf: TStringField;
    qryEnderecos_ibge: TStringField;
    qryEnderecos_gia: TStringField;
    qryEnderecos_descricao: TStringField;
    qryTelefones_id: TLargeintField;
    qryTelefones_numero: TStringField;
    qryTelefones_tipo_telefone: TStringField;
    qryProdutos_: TUniQuery;
    qryProdutos_id: TLargeintField;
    qryProdutos_descricao: TStringField;
    qryProdutos_preço_unitario: TFloatField;
    qryPedidos_: TUniQuery;
    qryPedidoXitems_: TUniQuery;
    qryPedidoXitems_id: TLargeintField;
    qryPedidoXitems_pedido_id: TLargeintField;
    qryPedidoXitems_produto_id: TLargeintField;
    qryPedidoXitems_qtde: TFloatField;
    qryPedidoXitems_valor_unitario: TFloatField;
    qryPedidoXitems_valor_total: TFloatField;
    qryEnderecos_numero: TStringField;
    qryClienteXEnderecos_: TUniQuery;
    qryClienteXEnderecos_id: TLargeintField;
    qryClienteXEnderecos_cliente_id: TLargeintField;
    qryClienteXEnderecos_endereco_id: TLargeintField;
    qryClienteXTelefones_: TUniQuery;
    qryClienteXTelefones_id: TLargeintField;
    qryClienteXTelefones_cliente_id: TLargeintField;
    qryClienteXTelefones_telefone_id: TLargeintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryEnderecos_BeforePost(DataSet: TDataSet);
    procedure qryTelefones_BeforePost(DataSet: TDataSet);
    procedure qryEnderecos_AfterPost(DataSet: TDataSet);
    procedure qryTelefones_AfterPost(DataSet: TDataSet);
    procedure qryClientes_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    Utils: TDBUtils;
    function NextVal(SequenceName: String): Integer;
    function ConectarComBanco: Boolean;
    procedure VinculaClienteXTelefone(ClienteID, TelefoneID: Integer);
    procedure VinculaClienteXEndereco(ClienteID, EnderecoID: Integer);
  public
    { Public declarations }
    function InserirCliente: Boolean;
    function InserirTelefone: Boolean;
    function InserirEndereco: Boolean;

    function SalvarCliente: Boolean;
    function SalvarEndereco(ClienteID: Integer): Boolean;
    function SalvarTelefone(ClienteID: Integer; NumeroTelefone: String): Boolean;

    function ExcluirCliente(ClienteID: Integer): Boolean;
    function ExcluirTelefone(TelefoneID: Integer): Boolean;
    function ExcluirEndereco(EnderecoID: Integer): Boolean;

    procedure FiltraCliente(ClienteID: Integer);
    procedure FiltraEnderecos(ClienteID: Integer);
    procedure FiltraTelefones(ClienteID: Integer);

    procedure ResetCads;
    function BuscarPorTelefone(Telefone: String): Boolean;
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses
  Forms;

function TdmMain.BuscarPorTelefone(Telefone: String): Boolean;
var
  qry: TUniQuery;
  cliente_id: Integer;
  telefone_id: Integer;
begin
  qry:=TUniQuery.Create(nil);
  qry.Connection := UniConnection1;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select id from "DaVinci".telefones where numero  = '+QuotedStr(Telefone));
  qry.Open;
  Result := qry.RecordCount > 0;
  if Result then
  begin
    telefone_id := qry.Fields.Fields[0].AsInteger;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select cliente_id from "DaVinci".ClienteXTelefones where telefone_id  = '+IntToStr(telefone_id));
    qry.Open;
    cliente_id := qry.Fields.Fields[0].AsInteger;
    FiltraCliente(cliente_id);
  end;
  qry.Close;
  qry.SQL.Clear;
  FreeAndNil(qry);
end;

function TdmMain.ConectarComBanco: Boolean;
var
  strl: TStringList;
begin
  Result := False;
  if FileExists(ExtractFilePath(Application.ExeName)+'connectionstring.cfg') then
  begin
    if UniConnection1.Connected then
      UniConnection1.Disconnect;
    strl:=TStringList.Create;
    strl.LoadFromFile(ExtractFilePath(Application.ExeName)+'connectionstring.cfg');
    UniConnection1.ConnectString := strl.Text;
    UniConnection1.Connected := True;
    FreeAndNil(strl);
    Result := UniConnection1.Connected;
  end;
  if not (Assigned(Self.Utils)) then
  begin
    Self.Utils := TDBUtils.Create(TColDevConnection(UniConnection1));
  end;
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
var
  strl: TStringList;
  i: Integer;
begin
  try
    if Self.ConectarComBanco then
    begin
      for I := 0 to Self.ComponentCount - 1 do
      begin
        if Self.Components[i].ClassType = TUniQuery then
        begin
          TUniQuery(Self.Components[i]).Close;
          TUniQuery(Self.Components[i]).Open;
        end;
      end;
    end;
  finally
  end;
end;

function TdmMain.ExcluirCliente(ClienteID: Integer): Boolean;
var
  q: TColDevQuery;
begin
  Result := False;
  q:=Self.Utils.QueryFactory('DELETE FROM "DaVinci".clientes where id = '+IntToStr(ClienteID));
  try
    q.ExecSQL;
    Result := True;
  except

  end;
end;

function TdmMain.ExcluirEndereco(EnderecoID: Integer): Boolean;
var
  q: TColDevQuery;
begin
  Result := False;
  q:=Self.Utils.QueryFactory('DELETE FROM "DaVinci".enderecos where id = '+IntToStr(EnderecoID));
  try
    q.ExecSQL;
    Result := True;
  except

  end;
end;

function TdmMain.ExcluirTelefone(TelefoneID: Integer): Boolean;
var
  q: TColDevQuery;
begin
  Result := False;
  q:=Self.Utils.QueryFactory('DELETE FROM "DaVinci".telefones where id = '+IntToStr(TelefoneID));
  try
    q.ExecSQL;
    Result := True;
  except

  end;
end;

procedure TdmMain.FiltraCliente(ClienteID: Integer);
begin
  qryClientes_.Close;
  qryClientes_.ParamByName('cliente_id').AsInteger := ClienteID;
  qryClientes_.Open;
end;

procedure TdmMain.FiltraEnderecos(ClienteID: Integer);
begin
  qryEnderecos_.Close;
  qryEnderecos_.ParamByName('cliente_id').AsInteger := qryClientes_id.AsInteger;
  qryEnderecos_.Open;
end;

procedure TdmMain.FiltraTelefones(ClienteID: Integer);
begin
  qryTelefones_.Close;
  qryTelefones_.ParamByName('cliente_id').AsInteger := qryClientes_id.AsInteger;
  qryTelefones_.Open;
end;

function TdmMain.InserirCliente;
begin
  Result := False;
  try
    qryClientes_.Insert;
    Result := True;
  except

  end;
end;

function TdmMain.InserirEndereco: Boolean;
begin
  Result := False;
  try
    qryEnderecos_.Insert;
    Result := True;
  except

  end;
end;

function TdmMain.InserirTelefone: Boolean;
begin
  Result := False;
  try
    qryTelefones_.Insert;
    Result := True;
  except

  end;
end;

function TdmMain.NextVal(SequenceName: String): Integer;
var
  qry: TUniQuery;
begin
  qry:=TUniQuery.Create(Application);
  qry.Connection := UniConnection1;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT NEXTVAL('+QuotedStr('"DaVinci".'+SequenceName)+')');
  qry.Open;
  Result := qry.Fields.Fields[0].AsInteger;
  qry.Close;
  qry.SQL.Clear;
  FreeAndNil(qry);
end;

procedure TdmMain.qryClientes_AfterScroll(DataSet: TDataSet);
begin
  FiltraTelefones(qryClientes_id.AsInteger);
  FiltraEnderecos(qryClientes_id.AsInteger);
end;

procedure TdmMain.qryEnderecos_AfterPost(DataSet: TDataSet);
begin
  qryClienteXEnderecos_.Post;
end;

procedure TdmMain.qryEnderecos_BeforePost(DataSet: TDataSet);
var
  endereco_id: Integer;
begin
  if qryClientes_id.AsInteger > 0 then
  begin
    qryClienteXEnderecos_.Insert;
    endereco_id := NextVal('endereco_id');
    qryClienteXEnderecos_cliente_id.AsInteger := qryClientes_id.AsInteger;
    qryClienteXEnderecos_endereco_id.AsInteger := endereco_id;
    qryEnderecos_id.AsInteger := endereco_id;
  end;
end;

procedure TdmMain.qryTelefones_AfterPost(DataSet: TDataSet);
begin
  qryClienteXTelefones_.Post;
end;

procedure TdmMain.qryTelefones_BeforePost(DataSet: TDataSet);
var
  telefone_id: Integer;
begin
  if qryClientes_id.AsInteger > 0 then
  begin
    qryClienteXTelefones_.Insert;
    telefone_id := NextVal('telefone_id');
    qryClienteXTelefones_cliente_id.AsInteger := qryClientes_id.AsInteger;
    qryClienteXTelefones_telefone_id.AsInteger := telefone_id;
    qryTelefones_id.AsInteger := telefone_id;
//    qryClienteXTelefones_.Post;
  end;
end;

procedure TdmMain.ResetCads;
begin
  qryClientes_.Close;
  qryClientes_.ParamByName('cliente_id').Clear;
  qryClientes_.Open;
end;

function TdmMain.SalvarCliente;
var
  id: Integer;
begin
  Result := False;
  try
    id := NextVal('cliente_id');
    qryClientes_id.AsInteger := id;
    qryClientes_.Post;
    qryClientes_.Refresh;
    qryClientes_.Locate('ID', id, []);
    Result := True;
  except

  end;
end;

function TdmMain.SalvarEndereco(ClienteID: Integer): Boolean;
var
  end_id: Integer;
begin
  Result := False;
  case qryEnderecos_.State of
    dsEdit:
      begin

      end;

    dsInsert:
      begin
        if qryEnderecos_descricao.AsString <> EmptyStr then
        begin
          end_id := NextVal('endereco_id');
          qryEnderecos_id.AsInteger := end_id;
          qryEnderecos_.Post;
          VinculaClienteXEndereco(ClienteID, end_id);
          FiltraEnderecos(ClienteID);
          Result := True;
        end;
      end;
  end;
end;

function TdmMain.SalvarTelefone(ClienteID: Integer; NumeroTelefone: String): Boolean;
var
  tel_id: Integer;
begin
  Result := False;
  case qryTelefones_.State of
    dsEdit:
      begin

      end;

    dsInsert:
      begin
        qryTelefones_numero.AsString := NumeroTelefone;
        if qryTelefones_numero.AsString <> EmptyStr then
        begin
          tel_id := NextVal('telefone_id');
          qryTelefones_id.AsInteger := tel_id;
          qryTelefones_.Post;
          VinculaClienteXTelefone(qryClientes_id.AsInteger, tel_id);
          FiltraTelefones(qryClientes_id.AsInteger);
          Result := False;
        end;
      end;
  end;
end;

procedure TdmMain.VinculaClienteXEndereco(ClienteID, EnderecoID: Integer);
var
  q: TColDevQuery;
begin
  q:=Self.Utils.QueryFactory('INSERT INTO "DaVinci".ClienteXEnderecos(cliente_id, endereco_id) VALUES('+IntToStr(ClienteID)+', '+IntToStr(EnderecoID)+')');
  q.Execute;
  FreeAndNil(q);
end;

procedure TdmMain.VinculaClienteXTelefone(ClienteID, TelefoneID: Integer);
var
  q: TColDevQuery;
begin
  q:=Self.Utils.QueryFactory('INSERT INTO "DaVinci".ClienteXTelefones(cliente_id, telefone_id) VALUES('+IntToStr(ClienteID)+', '+IntToStr(TelefoneID)+')');
  q.Execute;
  FreeAndNil(q);
end;

end.
