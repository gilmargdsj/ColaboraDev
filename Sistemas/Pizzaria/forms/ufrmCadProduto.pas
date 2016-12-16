unit ufrmCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Data.DB;

type
  TfrmCadProduto = class(TForm)
    dsProdutos: TDataSource;
    Panel1: TPanel;
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    SpeedButton2: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RadioGroup1: TRadioGroup;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses
  udmMain;


procedure TfrmCadProduto.SpeedButton1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadProduto.SpeedButton2Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:
    begin
      dmMain.qryProdutos_.Locate('descricao', Edit1.Text, [loCaseInsensitive, loPartialKey]);
    end;

    1:
    begin
      dmMain.FiltraProduto(Edit1.Text);
    end;
  end;
end;

procedure TfrmCadProduto.SpeedButton3Click(Sender: TObject);
begin
  dmMain.FiltraProduto('');
end;

procedure TfrmCadProduto.SpeedButton5Click(Sender: TObject);
begin
  dmMain.qryProdutos_.Insert;
end;

procedure TfrmCadProduto.SpeedButton6Click(Sender: TObject);
begin
  dmMain.qryProdutos_.Edit;
end;

procedure TfrmCadProduto.SpeedButton7Click(Sender: TObject);
begin
  dmMain.qryProdutos_.Post;
end;

procedure TfrmCadProduto.SpeedButton8Click(Sender: TObject);
begin
  dmMain.qryProdutos_.Delete;
end;

end.
