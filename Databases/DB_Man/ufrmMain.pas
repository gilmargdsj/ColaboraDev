unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.Client, Data.DB, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  UniProvider, PostgreSQLUniProvider, DBAccess, Uni, DAScript, UniScript,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, MemDS;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    Panel3: TPanel;
    Splitter1: TSplitter;
    FDCommand1: TFDCommand;
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    UniConnection1: TUniConnection;
    UniScript1: TUniScript;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    SpeedButton6: TSpeedButton;
    Memo1: TMemo;
    Panel4: TPanel;
    Label2: TLabel;
    Memo2: TMemo;
    Splitter2: TSplitter;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ListBox1: TListBox;
    Edit1: TEdit;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Memo3: TMemo;
    Panel5: TPanel;
    SpeedButton7: TSpeedButton;
    UniQuery1: TUniQuery;
    UniDataSource1: TUniDataSource;
    SpeedButton8: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure UniScript1Error(Sender: TObject; E: Exception; SQL: string;
      var Action: TErrorAction);
    procedure UniScript1AfterExecute(Sender: TObject; SQL: string);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
    ArquivoValido: Boolean;
    function ConectarComBanco: Boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function TForm2.ConectarComBanco: Boolean;
var
  strl: TStringList;
begin
  Result := False;
  if FileExists(ExtractFilePath(Application.ExeName)+'connectionstring.cfg') then
  begin
    if UniConnection1.Connected then
      UniConnection1.Disconnect;
    strl:=TStringList.Create;
    strl.LoadFromFile(ExtractFilePath(Application.ExeName)+'connectionstring.cfg');
    UniConnection1.ConnectString := strl.Text;
    UniConnection1.Connected := True;
    FreeAndNil(strl);
    Result := UniConnection1.Connected;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  if ArquivoValido then
  begin

  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  strl: TStringList;
  i: Integer;
begin
  for I := 0 to ListBox1.Items.Count - 1 do
  begin
    if ConectarComBanco then
    begin
      strl:=TStringList.Create;
      strl.LoadFromFile(ListBox1.Items[i]);
      UniScript1.SQL.LoadFromFile(ListBox1.Items[i]);
      UniScript1.Execute;
    end;
  end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
var
  strl: TStringList;
  i, j: Integer;
begin
  try
    ArquivoValido := False;
    if ListBox1.Count > 0 then
    begin
      for j := 0 to ListBox1.Count - 1 do
      begin
        if FileExists(ListBox1.Items[j]) then
        begin
          strl:=TStringList.Create;
          strl.LoadFromFile(ListBox1.Items[j]);
          for i := 0 to strl.Count - 1 do
          begin
            if trim(copy(strl[i], 1, 2)) < trim(strl[i]) then
            begin
              if trim(copy(strl[i], 1, 2)) = '--' then
                Memo1.Lines.Add(copy(strl[i],4, length(strl[i])));
            end;
          end;
          FreeAndNil(strl);
          ArquivoValido := True;
        end;
      end;
    end
    else
    begin
      if FileExists(Edit1.Text) then
      begin
        strl:=TStringList.Create;
        strl.LoadFromFile(Edit1.Text);
        Memo1.Lines.Clear;
        for i := 0 to strl.Count - 1 do
        begin
          if trim(copy(strl[i], 1, 2)) < trim(strl[i]) then
          begin
            if trim(copy(strl[i], 1, 2)) = '--' then
              Memo1.Lines.Add(copy(strl[i],4, length(strl[i])));
          end;
        end;
        FreeAndNil(strl);
        ArquivoValido := True;
      end;
    end;
  except
  end;
  PageControl2.ActivePage := TabSheet2;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := '.sql';
  if OpenDialog1.Execute then
  begin
    Edit1.Text := OpenDialog1.FileName;
    ListBox1.Items.Add(OpenDialog1.FileName);
  end;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := '.lst';
  if OpenDialog1.Execute then
    ListBox1.Items.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
var
  i: Integer;
begin
  if ConectarComBanco then
  begin
    UniScript1.SQL.Clear;
    UniScript1.SQL.AddStrings(Memo2.Lines);
    UniScript1.Execute;
  end;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
var
  strl: TStringList;
  i: Integer;
begin
  if ConectarComBanco then
  begin
    if UniQuery1.Active then
      UniQuery1.Close;
    UniQuery1.SQL.Clear;
    UniQuery1.SQL.AddStrings(Memo3.Lines);
    UniQuery1.Open;
  end;
  for I := 0 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns.Items[i].Width := 100;
  end;
  PageControl2.ActivePage := TabSheet4;
end;

procedure TForm2.SpeedButton8Click(Sender: TObject);
begin
  Memo3.Lines.Clear;
end;

procedure TForm2.UniScript1AfterExecute(Sender: TObject; SQL: string);
begin
  // UniScript1.Statements.
end;

procedure TForm2.UniScript1Error(Sender: TObject; E: Exception; SQL: string; var Action: TErrorAction);
begin
  Memo2.Lines.Add('-- ['+E.Message+']');
end;

end.
