unit ufrmSelCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, Uni;

type
  TClienteSelecao = record
    IDCliente: Integer;
    IDEndereco: Integer;
    NomeCliente: String;
    Rua: String;
    Numero: String;
    Telefone: String;
  end;

  TfrmSelCliente = class(TForm)
    udsClientes: TUniDataSource;
    udsEnderecos: TUniDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    ClienteSelecao: TClienteSelecao;
  end;

var
  frmSelCliente: TfrmSelCliente;

implementation

{$R *.dfm}

uses
  udmMain;

end.
