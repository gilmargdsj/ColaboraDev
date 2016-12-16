unit ufrmPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBAccess, Uni, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    edTelefone: TEdit;
    Label4: TLabel;
    UniDataSource1: TUniDataSource;
    procedure SpeedButton2Click(Sender: TObject);
    procedure edTelefoneKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses
  udmMain,
  ufrmSelCliente;

procedure TfrmPedidos.edTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #$D then
  begin
    SpeedButton2.Click;
  end;
end;

procedure TfrmPedidos.SpeedButton2Click(Sender: TObject);
var
  frm: TfrmSelCliente;
begin
  if dmMain.BuscarPorTelefone(edTelefone.Text) then
  begin
    frm := TfrmSelCliente.Create(Application);
    frm.Position := poDesktopCenter;
    frm.ShowModal;
    FreeAndNil(frm);
  end
  else
  begin
    ShowMessage('Cliente não encontrado !');
  end;
end;

end.
