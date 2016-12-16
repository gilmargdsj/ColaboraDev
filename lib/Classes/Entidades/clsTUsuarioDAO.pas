unit clsTUsuarioDAO;

 {$M+}
 {$TYPEINFO ON}

interface

uses
  System.SysUtils,
  System.Classes,
  clsTDBUtils,
  clsTUsuarioDTO;

type
  TUsuarioDAO = class
  private
    FDBUtils: TDBUtils;
    function GetLastID: Integer;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property DBUtils: TDBUtils read FDBUtils;
    // function Get(const ID: Integer): TUsuarioDTO; overload;
    function Get(const EMail: String): TUsuarioDTO;
    function Post(const ID: Integer; const Usuario: TUsuarioDTO): Boolean;
    function Put(var Usuario: TUsuarioDTO): Boolean;
    function Delete(const ID: Integer): Boolean; overload;
  end;

implementation

{ TUsuarioDAO }

constructor TUsuarioDAO.Create;
begin
  Self.FDBUtils := TDBUtils.Create;
end;

destructor TUsuarioDAO.Destroy;
begin
  Self.FDBUtils.Free;
  inherited;
end;

function TUsuarioDAO.Delete(const ID: Integer): Boolean;
var
  q: TColDevQuery;
begin
  Result := False;
  try
    q:=Self.FDBUtils.QueryFactory('DELETE FROM USUARIOS.USUARIOS WHERE ID_USUARIO = '+IntToStr(ID));
    q.ExecSQL;
    FreeAndNil(q);
    Result := True;
  except
    on E:Exception do
    begin
      FreeAndNil(q);
      // raise Exception.Create('Impossível excluir o usuário - erro : '+E.Message);
    end;
  end;
end;
{
function TUsuarioDAO.Get(const ID: Integer): TUsuarioDTO;
var
  q: TColDevQuery;
begin
  try
    q:=Self.FDBUtils.QueryFactory('SELECT * FROM USUARIOS.USUARIOS WHERE ID_USUARIO ='+IntToStr(ID));
    q.Open;
    if not q.Eof then
    begin
      Result := TUsuarioDTO.Create;
      Result.ID := q.Fields.FieldByName('id_usuario').AsInteger;
      Result.Nome := q.Fields.FieldByName('nome').AsString;
      Result.Nasc := q.Fields.FieldByName('nasc').AsDateTime;
      Result.Email := q.Fields.FieldByName('email').AsString;
    end;
    FreeAndNil(q);
  except
    on E:Exception do
    begin
      FreeAndNil(q);
      raise Exception.Create('Impossível recuperar o usuário - erro : '+E.Message);
    end;
  end;
end;
}
function TUsuarioDAO.Get(const EMail: String): TUsuarioDTO;
var
  q: TColDevQuery;
begin
  Result := TUsuarioDTO.Create;
  try
    q:=Self.FDBUtils.QueryFactory('SELECT * FROM USUARIOS.USUARIOS WHERE EMAIL ='+QuotedStr(EMail), True);
    if not q.Eof then
    begin
      Result.ID := q.Fields.FieldByName('id_usuario').AsInteger;
      Result.Nome := q.Fields.FieldByName('nome').AsString;
      Result.Nasc := q.Fields.FieldByName('nasc').AsDateTime;
      Result.Email := q.Fields.FieldByName('email').AsString;
    end;
    FreeAndNil(q);
  except
    on E:Exception do
    begin
      FreeAndNil(q);
      raise Exception.Create('Impossível recuperar o usuário - erro : '+E.Message);
    end;
  end;
end;

function TUsuarioDAO.GetLastID: Integer;
var
  q: TColDevQuery;
begin
  try
    q:=Self.FDBUtils.QueryFactory('select nextval('+QuotedStr('usuarios.seq_id_usuario')+')');
    q.Open;
    Result := q.Fields.Fields[0].AsInteger;
    FreeAndNil(q);
  except
    on E:Exception do
    begin
      FreeAndNil(q);
      raise Exception.Create('Impossível recuperar novo ID para usuário - erro : '+E.Message);
    end;
  end;
end;

function TUsuarioDAO.Post(const ID: Integer; const Usuario: TUsuarioDTO): Boolean;
var
  q: TColDevQuery;
begin
  Result := False;
  try
    q:=Self.FDBUtils.QueryFactory('SELECT * FROM USUARIOS.USUARIOS WHERE ID_USUARIO ='+IntToStr(ID));
    q.Open;
    if not q.Eof then
    begin
      q.Edit;
      q.Fields.FieldByName('nome').AsString := Usuario.Nome;
      q.Fields.FieldByName('nasc').AsDateTime := Usuario.Nasc;
      q.Fields.FieldByName('email').AsString := Usuario.Email;
      q.Post;
    end;
    FreeAndNil(q);
    Result := True;
  except
    on E:Exception do
    begin
      FreeAndNil(q);
      //raise Exception.Create('Impossível atualizar o usuário - erro : '+E.Message);
    end;
  end;
end;

function TUsuarioDAO.Put(var Usuario: TUsuarioDTO): Boolean;
var
  q: TColDevQuery;
begin
  Result := False;
  try
    q:=Self.FDBUtils.QueryFactory('SELECT * FROM USUARIOS.USUARIOS LIMIT 1');
    q.Open;
    q.Insert;
    q.FieldByName('id_usuario').AsInteger := Self.GetLastID;
    Usuario.ID := q.FieldByName('id_usuario').AsInteger;
    q.FieldByName('nome').AsString := Usuario.Nome;
    q.FieldByName('email').AsString := Usuario.Email;
    q.FieldByName('nasc').AsDateTime := Usuario.Nasc;
    q.Post;
    FreeAndNil(q);
    Result := True;
  except
    on E:Exception do
    begin
      FreeAndNil(q);
      // raise Exception.Create('Impossível incluir o usuário - erro : '+E.Message);
    end;
  end;
end;

end.
