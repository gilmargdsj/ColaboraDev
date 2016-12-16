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
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  ufrmCadCliente;

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

procedure TfrmMain.SpeedButton4Click(Sender: TObject);
var
  frm: TfrmCadCliente;
begin
  frm:=TfrmCadCliente.Create(Application);
  frm.Position := poDesktopCenter;
  frm.ShowModal;
  FreeAndNil(frm);
end;

end.
