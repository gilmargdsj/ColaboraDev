object Form1: TForm1
  Left = 271
  Top = 114
  Caption = 'Form1'
  ClientHeight = 600
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object SpeedButton1: TSpeedButton
    Left = 32
    Top = 528
    Width = 57
    Height = 25
    Caption = 'GET'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 96
    Top = 528
    Width = 57
    Height = 25
    Caption = 'POST'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 608
    Top = 248
    Width = 89
    Height = 17
    Caption = '<-------'
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 608
    Top = 272
    Width = 89
    Height = 17
    Caption = '------->'
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 159
    Top = 528
    Width = 57
    Height = 25
    Caption = 'PUT'
    OnClick = SpeedButton5Click
  end
  object SpeedButton6: TSpeedButton
    Left = 224
    Top = 528
    Width = 57
    Height = 25
    Caption = 'DEL'
    OnClick = SpeedButton6Click
  end
  object ButtonStart: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 105
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 24
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 24
    Top = 112
    Width = 107
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object Edit1: TEdit
    Left = 24
    Top = 160
    Width = 545
    Height = 21
    TabOrder = 4
    Text = 'http://localhost.:8080/datasnap/rest/TServerMethods1/Usuario'
  end
  object Memo1: TMemo
    Left = 32
    Top = 224
    Width = 537
    Height = 289
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 712
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '2'
  end
  object Edit3: TEdit
    Left = 712
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Regiane'
  end
  object Edit4: TEdit
    Left = 712
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '14/05/1988 02:10:15'
  end
  object Edit5: TEdit
    Left = 712
    Top = 264
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'regi.rocknroll@gmail.com'
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 288
    Top = 24
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'http://localhost.:8080/datasnap/rest/TServerMethods1/Usuario'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 424
    Top = 8
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 424
    Top = 56
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 424
    Top = 104
  end
end
