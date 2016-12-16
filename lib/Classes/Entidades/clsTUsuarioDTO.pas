unit clsTUsuarioDTO;

 {$M+}
 {$TYPEINFO ON}

interface

type
  TUsuarioDTO = class
  private
    FNasc: TDateTime;
    FNome: String;
    FID: Integer;
    FEmail: String;
    FAlterado: Boolean;
    procedure SetNasc(const Value: TDateTime);
    procedure SetNome(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetEmail(const Value: String);
    function GetAlterado: Boolean;
    procedure SetAlterado(const Value: Boolean);
  public
    constructor Create;
  published
    property ID: Integer read FID write SetID;
    property Nome: String read FNome write SetNome;
    property Nasc: TDateTime read FNasc write SetNasc;
    property Email: String read FEmail write SetEmail;
    property Alterado: Boolean read GetAlterado write SetAlterado;
  end;


implementation

{ TUsuarioDTO }

constructor TUsuarioDTO.Create;
begin
  Self.FAlterado := False;
end;

function TUsuarioDTO.GetAlterado: Boolean;
begin
  Result := Self.FAlterado;
end;

procedure TUsuarioDTO.SetAlterado(const Value: Boolean);
begin
  Self.FAlterado := Value;
end;

procedure TUsuarioDTO.SetEmail(const Value: String);
begin
  if Self.FEmail <> Value then
    Self.FAlterado := True;
  Self.FEmail := Value;
end;

procedure TUsuarioDTO.SetID(const Value: Integer);
begin
  if Self.FID <> Value then
    Self.FAlterado := True;
  Self.FID := Value;
end;

procedure TUsuarioDTO.SetNasc(const Value: TDateTime);
begin
  if Self.FNasc <> Value then
    Self.FAlterado := True;
  Self.FNasc := Value;
end;

procedure TUsuarioDTO.SetNome(const Value: String);
begin
  if Self.FNome <> Value then
    Self.FAlterado := True;
  Self.FNome := Value;
end;


end.
