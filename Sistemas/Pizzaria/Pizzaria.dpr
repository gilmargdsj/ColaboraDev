program Pizzaria;

uses
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  udmMain in 'udmMain.pas' {dmMain: TDataModule},
  ufrmCadCliente in 'forms\ufrmCadCliente.pas' {frmCadCliente},
  ufrmCadIngrediente in 'forms\ufrmCadIngrediente.pas' {frmCadIngrediente},
  ufrmCadProduto in 'forms\ufrmCadProduto.pas' {frmCadProduto},
  ufrmCadUsuario in 'forms\ufrmCadUsuario.pas' {frmCadUsuario},
  clsTClienteDTO in 'Classes\clsTClienteDTO.pas',
  clsTClienteDAO in 'Classes\clsTClienteDAO.pas',
  clsTDBUtils in '..\..\lib\Classes\Utils\clsTDBUtils.pas',
  clsTBuscaCep in '..\..\lib\Classes\Utils\clsTBuscaCep.pas',
  libConstantes in '..\..\lib\libConstantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
