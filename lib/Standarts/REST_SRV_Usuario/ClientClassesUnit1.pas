//
// Created by the DataSnap proxy generator.
// 20/11/2016 06:38:13
//

unit ClientClassesUnit1;

interface

uses System.JSON,
     Datasnap.DSProxyRest,
     Datasnap.DSClientRest,
     Data.DBXCommon,
     Data.DBXClient,
     Data.DBXDataSnap,
     Data.DBXJSON,
     Datasnap.DSProxy,
     System.Classes,
     System.SysUtils,
     Data.DB,
     Data.SqlExpr,
     Data.DBXDBReaders,
     Data.DBXCDSReaders,
     Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminRestClient)
  private
    {
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    }
    FNovoUsuarioCommand: TDSRestCommand;
    FRemoveUsuarioCommand: TDSRestCommand;
    FAtualizaUsuarioCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
{
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
}
    function NovoUsuario(Value: string; const ARequestFilter: string = ''): string;
    function RemoveUsuario(Value: string; const ARequestFilter: string = ''): string;
    function AtualizaUsuario(Value: string; const ARequestFilter: string = ''): string;
  end;

const
{
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );
}
  TServerMethods1_NovoUsuario: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_RemoveUsuario: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_AtualizaUsuario: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation
{
function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;
}
function TServerMethods1Client.NovoUsuario(Value: string; const ARequestFilter: string): string;
begin
  if FNovoUsuarioCommand = nil then
  begin
    FNovoUsuarioCommand := FConnection.CreateCommand;
    FNovoUsuarioCommand.RequestType := 'GET';
    FNovoUsuarioCommand.Text := 'TServerMethods1.NovoUsuario';
    FNovoUsuarioCommand.Prepare(TServerMethods1_NovoUsuario);
  end;
  FNovoUsuarioCommand.Parameters[0].Value.SetWideString(Value);
  FNovoUsuarioCommand.Execute(ARequestFilter);
  Result := FNovoUsuarioCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.RemoveUsuario(Value: string; const ARequestFilter: string): string;
begin
  if FRemoveUsuarioCommand = nil then
  begin
    FRemoveUsuarioCommand := FConnection.CreateCommand;
    FRemoveUsuarioCommand.RequestType := 'GET';
    FRemoveUsuarioCommand.Text := 'TServerMethods1.RemoveUsuario';
    FRemoveUsuarioCommand.Prepare(TServerMethods1_RemoveUsuario);
  end;
  FRemoveUsuarioCommand.Parameters[0].Value.SetWideString(Value);
  FRemoveUsuarioCommand.Execute(ARequestFilter);
  Result := FRemoveUsuarioCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.AtualizaUsuario(Value: string; const ARequestFilter: string): string;
begin
  if FAtualizaUsuarioCommand = nil then
  begin
    FAtualizaUsuarioCommand := FConnection.CreateCommand;
    FAtualizaUsuarioCommand.RequestType := 'GET';
    FAtualizaUsuarioCommand.Text := 'TServerMethods1.AtualizaUsuario';
    FAtualizaUsuarioCommand.Prepare(TServerMethods1_AtualizaUsuario);
  end;
  FAtualizaUsuarioCommand.Parameters[0].Value.SetWideString(Value);
  FAtualizaUsuarioCommand.Execute(ARequestFilter);
  Result := FAtualizaUsuarioCommand.Parameters[1].Value.GetWideString;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
{
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
}
  FNovoUsuarioCommand.DisposeOf;
  FRemoveUsuarioCommand.DisposeOf;
  FAtualizaUsuarioCommand.DisposeOf;
  inherited;
end;

end.

