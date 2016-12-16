unit FormUnit1;

interface

uses
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.AppEvnts,
  Vcl.StdCtrls,
  IdHTTPWebBrokerBridge,
  Web.HTTPApp,
  IPPeerClient,
  REST.Client,
  REST.Types,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    ButtonOpenBrowser: TButton;
    Edit1: TEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  WinApi.Windows,
  Winapi.ShellApi,
  Datasnap.DSSession,
  clsTusuario,
  System.DateUtils;

procedure TForm1.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TForm1.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TForm1.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TForm1.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  u: TUsuario;
begin
  RESTClient1.BaseURL := Edit1.Text;
  RESTRequest1.Method := rmGET;
  RESTRequest1.Resource := Trim(Memo1.Lines.Text);
  RESTRequest1.Execute;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '\', '', [rfReplaceAll]);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '{"result":["', '', [rfReplaceAll]);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '"]}', '', [rfReplaceAll]);
  u:=TUsuario.Create;
  u.FromJSON(Memo1.Lines.Text);
  Edit2.Text := IntToStr(u.DTO.ID);
  edit3.Text := u.DTO.Nome;
  edit4.Text := FormatDateTime('DD/MM/YYYY HH:NN:SS', u.DTO.Nasc);
  edit5.Text := u.DTO.Email;
  FreeAndNil(u);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  RESTClient1.BaseURL := Edit1.Text;
  RESTRequest1.Method := rmPOST;
  RESTRequest1.Resource := Memo1.Lines.Text;
  RESTRequest1.Params.Clear;
  RESTRequest1.Execute;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '\', '', [rfReplaceAll]);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '{"result":["', '', [rfReplaceAll]);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '"]}', '', [rfReplaceAll]);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  u: TUsuario;
begin
  u:=TUsuario.Create;
  u.DTO.ID := StrToInt(Edit2.Text);
  u.DTO.Nome := Edit3.Text;
  u.DTO.Nasc := EncodeDateTime(StrToInt(Copy(Edit4.Text, 7, 4)),
                               StrToInt(Copy(Edit4.Text, 4, 2)),
                               StrToInt(Copy(Edit4.Text, 1, 2)),
                               StrToInt(Copy(Edit4.Text, 12, 2)),
                               StrToInt(Copy(Edit4.Text, 15, 2)),
                               StrToInt(Copy(Edit4.Text, 18, 2)), 0);

  u.DTO.Email := Edit5.Text;
  Memo1.Lines.Text := u.ToJSON;
  FreeAndNil(u);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
var
  u: TUsuario;
begin
  u:=TUsuario.Create;
  u.FromJSON(Memo1.Lines.Text);
  Edit2.Text := IntToStr(u.DTO.ID);
  Edit3.Text := u.DTO.Nome;
  Edit4.Text := FormatDateTime('DD/MM/YYYY HH:NN:SS', u.DTO.Nasc);
  Edit5.Text := u.DTO.Email;
  FreeAndNil(u);
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  RESTClient1.BaseURL := Edit1.Text;
  RESTRequest1.Method := rmPUT;
  RESTRequest1.Resource := Memo1.Lines.Text;
  RESTRequest1.Params.Clear;
  RESTRequest1.Execute;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '\', '', [rfReplaceAll]);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '{"result":["', '', [rfReplaceAll]);
  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, '"]}', '', [rfReplaceAll]);
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  RESTClient1.BaseURL := Edit1.Text;
  RESTRequest1.Method := rmDELETE;
  RESTRequest1.Resource := Memo1.Lines.Text;
  RESTRequest1.Params.Clear;
  RESTRequest1.Execute;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
end;

procedure TForm1.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

end.
