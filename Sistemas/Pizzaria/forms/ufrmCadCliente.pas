unit ufrmCadCliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Json,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  CRGrid,
  Vcl.Buttons,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdIntercept,
  IdInterceptThrottler,
  IdIOHandlerStream,
  Vcl.Menus,
  IdSSL,
  IdSSLOpenSSL,
  Xml.xmldom,
  Xml.XMLIntf,
  Xml.XMLDoc,
  Soap.InvokeRegistry,
  IPPeerClient,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Soap.Rio,
  Soap.SOAPHTTPClient, ACBrBase, ACBrSocket, ACBrCEP;

type
  TfrmCadCliente = class(TForm)
    dsClientes: TDataSource;
    dsTelefones: TDataSource;
    Panel3: TPanel;
    dsEnderecos: TDataSource;
    gpbClientes: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeCliente_ID: TDBEdit;
    dbeCliente_Apelido: TDBEdit;
    dbeCliente_Nome: TDBEdit;
    gpbEnderecos: TGroupBox;
    dbeEndereco_ID: TDBEdit;
    dbeEndereco_Logradouro: TDBEdit;
    dbeEndereco_Bairro: TDBEdit;
    dbeEndereco_Cidade: TDBEdit;
    dbeEndereco_UF: TDBEdit;
    dbeEndereco_Compl: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbeEndereco_CEP: TDBEdit;
    Label11: TLabel;
    dbeEndereco_Descricao: TDBEdit;
    Label12: TLabel;
    gpbTelefones: TGroupBox;
    edBuscaNumero: TEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    dbeTelefone_Numero: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Panel2: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit2: TEdit;
    MainMenu1: TMainMenu;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label15: TLabel;
    ACBrCEP1: TACBrCEP;
    Memo1: TMemo;
    SpeedButton14: TSpeedButton;
    Label16: TLabel;
    SpeedButton15: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton9Click(Sender: TObject);
    procedure edBuscaNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses
  udmMain,
  clsTBuscaCep,
  libConstantes;

procedure TfrmCadCliente.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbFirst: ;
    nbPrior: ;
    nbNext: ;
    nbLast: ;
    nbInsert: ;
    nbDelete: ;
    nbEdit: ;
    nbPost: ;
    nbCancel: ;
    nbRefresh: dmMain.ResetCads;
    nbApplyUpdates: ;
    nbCancelUpdates: ;
  end;
end;

procedure TfrmCadCliente.edBuscaNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #$D then
  begin
    if dmMain.BuscarPorTelefone(edBuscaNumero.Text) then
    begin
      MessageDlg('Cliente encontrado !', mtInformation, [mbOK], 0)
    end
    else
    begin

    end;
  end;
end;

procedure TfrmCadCliente.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #$D then
  begin
    if Edit2.Text = EmptyStr then
      Exit;
    ACBrCEP1.BuscarPorCEP(Edit2.Text);
    if ACBrCEP1.Enderecos.Count > 0 then
    begin
      try
        if (MessageBox(0, PWideChar('Favor confirmar o endereço : '+_ENTER_+_ENTER_+_ENTER_+ACBrCEP1.Enderecos.Objects[0].Logradouro), 'Endereço', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
        begin
          dmMain.qryEnderecos_.Insert;
          dmMain.qryEnderecos_descricao.AsString := 'Residência';
          dmMain.qryEnderecos_logradouro.AsString := ACBrCEP1.Enderecos.Objects[0].Logradouro;
          dmMain.qryEnderecos_bairro.AsString := ACBrCEP1.Enderecos.Objects[0].Bairro;
          dmMain.qryEnderecos_cidade.AsString := ACBrCEP1.Enderecos.Objects[0].Municipio;
          dmMain.qryEnderecos_cep.AsString := ACBrCEP1.Enderecos.Objects[0].CEP;
          dmMain.qryEnderecos_uf.AsString := ACBrCEP1.Enderecos.Objects[0].UF;
          dbeEndereco_Descricao.SetFocus;
        end;

      finally
      end;
    end
    else
    begin
      ShowMessage('CEP não encontrado !');
    end;
  end;
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmCadCliente := nil;
end;

procedure TfrmCadCliente.SpeedButton10Click(Sender: TObject);
begin
  dmMain.qryTelefones_.Edit;
end;

procedure TfrmCadCliente.SpeedButton11Click(Sender: TObject);
begin
  try
    if (MessageBox(0, 'Deseja realmente salvar este telefone ?', 'Salvar Telefone', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
    begin
      if dmMain.SalvarTelefone(dmMain.qryClientes_id.AsInteger, dbeTelefone_Numero.Text) then
      begin
        ShowMessage('Telefone salvo !');
      end;
    end;
  except
  end;
end;

procedure TfrmCadCliente.SpeedButton12Click(Sender: TObject);
begin
  if (MessageBox(0, 'Deseja realmente excluir este telefone ?', 'Excluir Telefone', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
  begin
    if dmMain.ExcluirTelefone(dmMain.qryTelefones_id.AsInteger) then
    begin
      ShowMessage('Cliente excluído com sucesso !');
    end;
  end;
end;

procedure TfrmCadCliente.SpeedButton14Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadCliente.SpeedButton2Click(Sender: TObject);
begin
  dmMain.qryEnderecos_.Edit;
end;

procedure TfrmCadCliente.SpeedButton9Click(Sender: TObject);
begin
  dmMain.InserirTelefone;
  dbeTelefone_Numero.SetFocus;
end;

procedure TfrmCadCliente.SpeedButton3Click(Sender: TObject);
begin
  try
    if dmMain.qryEnderecos_descricao.AsString <> EmptyStr then
    begin
      if dmMain.qryEnderecos_.State = dsInsert then
      begin
        if dmMain.SalvarEndereco(dmMain.qryClientes_id.AsInteger) then
        begin
          ShowMessage('Endereço salvo !');
        end;
      end;
    end
    else
    begin

    end;
  except
  end;
end;

procedure TfrmCadCliente.SpeedButton4Click(Sender: TObject);
begin
  if (MessageBox(0, 'Deseja realmente excluir este endereço ?', 'Excluir Endereço', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
  begin
    if dmMain.ExcluirEndereco(dmMain.qryEnderecos_id.AsInteger) then
    begin
      ShowMessage('Cliente excluído com sucesso !');
    end;
  end;
end;

procedure TfrmCadCliente.SpeedButton5Click(Sender: TObject);
begin
  dmMain.InserirCliente;
  dbeCliente_Apelido.SetFocus;
end;

procedure TfrmCadCliente.SpeedButton6Click(Sender: TObject);
begin
  dmMain.qryClientes_.Edit;
end;

procedure TfrmCadCliente.SpeedButton7Click(Sender: TObject);
begin
  if (MessageBox(0, 'Deseja realmente salvar este cliente ?', 'Salvar Cliente', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
  begin
    if dmMain.SalvarCliente then
    begin
      ShowMessage('Cliente salvo !');
    end;
  end;
end;

procedure TfrmCadCliente.SpeedButton8Click(Sender: TObject);
begin
  if (MessageBox(0, 'Deseja realmente excluir este cliente ?', 'Excluir Cliente', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
  begin
    if dmMain.ExcluirCliente(dmMain.qryClientes_id.AsInteger) then
    begin
      ShowMessage('Cliente excluído com sucesso !');
    end;
  end;
end;

end.
