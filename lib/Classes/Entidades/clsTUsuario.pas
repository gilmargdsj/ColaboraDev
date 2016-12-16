unit clsTUsuario;

 {$M+}
 {$TYPEINFO ON}

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Rtti,
  REST.JSON,
  Data.DBXJSON,
  Data.DBXJSONReflect,
  clsTUsuarioDTO,
  clsTUsuarioDAO,
  libEnumTypes;

type
  TUsuario = class
  private
    FMarshal: TJSONMarshal;
    FUnMarshal: TJSONUnMarshal;
    FDTO: TUsuarioDTO;
    FDAO: TUsuarioDAO;
    procedure RegisterConverters;
    procedure RegisterReverters;
    procedure SetDTO(const Value: TUsuarioDTO);
    function GetDTO: TUsuarioDTO;
    function Init: Boolean;
  public
    constructor Create; overload;
    constructor Create(pNome, pEmail: String; pNasc: TDateTIme); overload;
    constructor Create(pID: Integer; pNome, pEmail: String; pNasc: TDateTIme); overload;
    constructor Create(JSON: String); overload;
    destructor Destroy; override;
  published
    property DTO: TUsuarioDTO read GetDTO write SetDTO;
    function ToJSON: String;
    function FromJSON(JSON: string): Boolean;
    function Persiste(Operacao: TOperacaoDAO): Boolean;
  end;

implementation

uses
  System.DateUtils;

{ TUsuario }

procedure TUsuario.RegisterConverters;
begin

  self.FMarshal.RegisterConverter(
      TUsuarioDTO, 'Fnasc',
        function(Data: TObject; Field: string): string
        var
          ctx: TRttiContext;
          date : TDateTime;
          teste: String;
        begin
          date := ctx.GetType(Data.ClassType).GetField(Field).GetValue(Data).AsType<TDateTime>;
          teste := ctx.GetType(Data.ClassType).GetField(Field).GetValue(Data).AsString;
          Result := FormatDateTime('DD/MM/YYYY HH:NN:SS', date);
        end);

end;

procedure TUsuario.RegisterReverters;
begin

  Self.FUnMarshal.RegisterReverter(
      TUsuarioDTO, 'Fnasc',
      procedure(Data: TObject; Field: string; Arg: string)
      var
        ctx: TRttiContext;
        datetime: TDateTime;
      begin
        datetime := EncodeDateTime(StrToInt(Copy(Arg, 7, 4)),
                                   StrToInt(Copy(Arg, 4, 2)),
                                   StrToInt(Copy(Arg, 1, 2)),
                                   StrToInt(Copy(Arg, 12, 2)),
                                   StrToInt(Copy(Arg, 15, 2)),
                                   StrToInt(Copy(Arg, 18, 2)), 0);
        ctx.GetType(Data.ClassType).GetField(Field).SetValue(Data, datetime);
      end);

end;

constructor TUsuario.Create(pNome, pEmail: String; pNasc: TDateTIme);
begin
  if Self.Init then
  begin
    Self.FDTO.Nome := pNome;
    Self.FDTO.Nasc := pNasc;
    Self.FDTO.Email := pEmail;
  end;
end;

constructor TUsuario.Create;
begin
  Self.Init;
end;

constructor TUsuario.Create(JSON: String);
begin
  if Self.Init then
  begin
    Self.FromJSON(JSON);
  end;
end;

destructor TUsuario.Destroy;
begin
  Self.FDTO.Destroy;
  Self.FDAO.Destroy;
  Self.FMarshal.Destroy;
  Self.FUnMarshal.Destroy;
  inherited;
end;

function TUsuario.FromJSON(JSON: string): Boolean;
begin
  Result := False;
  try
    Self.FDTO := Self.FUnMarshal.Unmarshal(TJSONObject.ParseJSONValue(JSON)) as TUsuarioDTO;
    Result := True;
  except
  end;
end;

procedure TUsuario.SetDTO(const Value: TUsuarioDTO);
begin
  Self.FDTO := Value;
end;

constructor TUsuario.Create(pID: Integer; pNome, pEmail: String; pNasc: TDateTIme);
begin
  if Self.Init then
  begin
    Self.FDTO.Nome := pNome;
    Self.FDTO.Nasc := pNasc;
    Self.FDTO.Email := pEmail;
    Self.FDTO.ID := pID;
  end;
end;

function TUsuario.GetDTO: TUsuarioDTO;
begin
  Result := Self.FDTO;
end;

function TUsuario.Init: Boolean;
begin
  Result := False;
  try
    Self.FDTO := TUsuarioDTO.Create;
    Self.FDAO := TUsuarioDAO.Create;
    Self.FMarshal := TJSONMarshal.Create;
    Self.FUnMarshal := TJSONUnMarshal.Create;
    Self.RegisterConverters;
    Self.RegisterReverters;
    Result := True;
  except

  end;
end;

function TUsuario.Persiste(Operacao: TOperacaoDAO): Boolean;
begin
  Result := False;
  case Operacao of
    todInsert:
      begin
        Result := Self.FDAO.Put(Self.FDTO);
      end;
    todUpdate:
      begin
        Result := Self.FDAO.Post(Self.FDTO.ID, Self.FDTO);
      end;
    todDelete:
      begin
        Result := Self.FDAO.Delete(Self.FDTO.ID);
      end;
    todSelect:
      begin
        Self.FDTO := Self.FDAO.Get(Self.FDTO.EMail);
        Result := Assigned(Self.FDTO);
      end;
  end;
end;

function TUsuario.ToJSON: String;
begin
  Result := Self.FMarshal.Marshal(Self.DTO).ToJSON;
end;

initialization

end.
