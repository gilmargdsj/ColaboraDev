unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  ufrmCadCliente,
  ufrmCadProduto,
  ufrmPedidos;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Self.Top := 1;
  Self.Width := Screen.Width - 1;
  Self.Left := 1;
end;

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
var
  frm: TfrmPedidos;
begin
  frm:=TfrmPedidos.Create(Application);
  frm.Position := poDesktopCenter;
  frm.ShowModal;
  FreeAndNil(frm);
end;

procedure TfrmMain.SpeedButton3Click(Sender: TObject);
var
  frm: TfrmCadProduto;
begin
  frm:=TfrmCadProduto.Create(Application);
  frm.Position := poDesktopCenter;
  frm.ShowModal;
  FreeAndNil(frm);
end;

procedure TfrmMain.SpeedButton4Click(Sender: TObject);
var
  frm: TfrmCadCliente;
begin
  frm:=TfrmCadCliente.Create(Application);
  frm.Position := poDesktopCenter;
  frm.ShowModal;
  FreeAndNil(frm);
end;

procedure TfrmMain.SpeedButton5Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
