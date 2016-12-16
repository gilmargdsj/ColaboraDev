unit ServerMethodsUnit1;

interface

uses System.SysUtils,
     System.Classes,
     Datasnap.DSServer,
     Datasnap.DSAuth;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    {
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    }
    function Usuario(Value: String): String;
    function acceptUsuario(Value: String): String;
    function cancelUsuario(Value: String): String;
    function updateUsuario(Value: String): String;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils,
     clsTUsuario,
     libEnumTypes;

function TServerMethods1.updateUsuario(Value: String): String;
var
  usu: TUsuario;
begin
  usu := TUsuario.Create(Value);
  //usu.FromJSON(Value);
  usu.Persiste(todUpdate);
  Result := usu.ToJSON;
  FreeAndNil(usu);
end;

function TServerMethods1.Usuario(Value: String): String;
var
  usu: TUsuario;
begin
  usu := TUsuario.Create;
  usu.DTO.Email := Value;
  usu.Persiste(todSelect);
  Result := usu.ToJSON;
  FreeAndNil(usu);
end;
{
function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;
}
function TServerMethods1.acceptUsuario(Value: String): String;
var
  usu: TUsuario;
begin
  usu := TUsuario.Create(Value);
  //usu.FromJSON(Value);
  usu.Persiste(todInsert);
  Result := usu.ToJSON;
  FreeAndNil(usu);
end;

function TServerMethods1.cancelUsuario(Value: String): String;
var
  usu: TUsuario;
begin
  usu := TUsuario.Create(Value);
  //usu.FromJSON(Value);
  usu.Persiste(todDelete);
  Result := 'Usuario "'+usu.DTO.Nome+'" excluído';
  FreeAndNil(usu);
end;
{
function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;
}
end.

