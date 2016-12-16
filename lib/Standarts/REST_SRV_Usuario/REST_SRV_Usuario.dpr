program REST_SRV_Usuario;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormUnit1 in 'FormUnit1.pas' {Form1},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas',
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  clsTDBUtils in '..\..\classes\Utils\clsTDBUtils.pas',
  clsTUsuario in '..\..\classes\Entidades\clsTUsuario.pas',
  clsTUsuarioDAO in '..\..\classes\Entidades\clsTUsuarioDAO.pas',
  clsTUsuarioDTO in '..\..\classes\Entidades\clsTUsuarioDTO.pas',
  libRecordTypes in '..\..\libRecordTypes.pas',
  libEnumTypes in '..\..\libEnumTypes.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
