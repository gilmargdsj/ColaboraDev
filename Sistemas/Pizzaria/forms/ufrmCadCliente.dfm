object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 662
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 662
    Align = alClient
    TabOrder = 0
    DesignSize = (
      680
      662)
    object gpbClientes: TGroupBox
      Left = 15
      Top = 48
      Width = 649
      Height = 150
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Cliente'
      TabOrder = 0
      DesignSize = (
        649
        150)
      object Label1: TLabel
        Left = 16
        Top = 23
        Width = 55
        Height = 13
        Caption = 'C'#243'digo (ID)'
      end
      object Label2: TLabel
        Left = 16
        Top = 55
        Width = 35
        Height = 13
        Caption = 'Apelido'
      end
      object Label3: TLabel
        Left = 16
        Top = 87
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object dbeCliente_ID: TDBEdit
        Left = 80
        Top = 20
        Width = 65
        Height = 21
        DataField = 'id'
        DataSource = dsClientes
        Enabled = False
        TabOrder = 3
      end
      object dbeCliente_Apelido: TDBEdit
        Left = 80
        Top = 52
        Width = 273
        Height = 21
        DataField = 'apelido'
        DataSource = dsClientes
        TabOrder = 0
      end
      object dbeCliente_Nome: TDBEdit
        Left = 80
        Top = 84
        Width = 273
        Height = 21
        DataField = 'nome'
        DataSource = dsClientes
        TabOrder = 1
      end
      object Panel5: TPanel
        Left = 2
        Top = 114
        Width = 645
        Height = 34
        Align = alBottom
        TabOrder = 2
        object SpeedButton5: TSpeedButton
          Left = 4
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Novo'
          OnClick = SpeedButton5Click
        end
        object SpeedButton6: TSpeedButton
          Left = 64
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Alterar'
        end
        object SpeedButton7: TSpeedButton
          Left = 124
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Salvar'
          OnClick = SpeedButton7Click
        end
        object SpeedButton8: TSpeedButton
          Left = 184
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Excluir'
          OnClick = SpeedButton8Click
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 151
        Top = 17
        Width = 200
        Height = 25
        DataSource = dsClientes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Anchors = [akTop, akRight]
        TabOrder = 4
        OnClick = DBNavigator1Click
      end
      object Memo1: TMemo
        Left = 376
        Top = 16
        Width = 265
        Height = 89
        Lines.Strings = (
          'Memo1')
        TabOrder = 5
      end
    end
    object gpbEnderecos: TGroupBox
      Left = 15
      Top = 356
      Width = 649
      Height = 287
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Endere'#231'o'
      TabOrder = 1
      DesignSize = (
        649
        287)
      object Label5: TLabel
        Left = 13
        Top = 81
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object Label6: TLabel
        Left = 13
        Top = 20
        Width = 55
        Height = 13
        Caption = 'C'#243'digo (ID)'
      end
      object Label7: TLabel
        Left = 13
        Top = 142
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label8: TLabel
        Left = 13
        Top = 172
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label9: TLabel
        Left = 213
        Top = 227
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label10: TLabel
        Left = 13
        Top = 199
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label11: TLabel
        Left = 13
        Top = 227
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label12: TLabel
        Left = 13
        Top = 51
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object SpeedButton13: TSpeedButton
        Left = 365
        Top = 20
        Width = 23
        Height = 22
        OnClick = SpeedButton13Click
      end
      object Label15: TLabel
        Left = 13
        Top = 111
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object dbeEndereco_ID: TDBEdit
        Left = 88
        Top = 17
        Width = 71
        Height = 21
        DataField = 'id'
        DataSource = dsEnderecos
        Enabled = False
        TabOrder = 0
      end
      object dbeEndereco_Logradouro: TDBEdit
        Left = 88
        Top = 78
        Width = 300
        Height = 21
        DataField = 'logradouro'
        DataSource = dsEnderecos
        TabOrder = 1
      end
      object dbeEndereco_Bairro: TDBEdit
        Left = 88
        Top = 139
        Width = 300
        Height = 21
        DataField = 'bairro'
        DataSource = dsEnderecos
        TabOrder = 2
      end
      object dbeEndereco_Cidade: TDBEdit
        Left = 88
        Top = 169
        Width = 300
        Height = 21
        DataField = 'cidade'
        DataSource = dsEnderecos
        TabOrder = 3
      end
      object dbeEndereco_UF: TDBEdit
        Left = 240
        Top = 224
        Width = 49
        Height = 21
        DataField = 'uf'
        DataSource = dsEnderecos
        TabOrder = 4
      end
      object dbeEndereco_Compl: TDBEdit
        Left = 88
        Top = 196
        Width = 300
        Height = 21
        DataField = 'complemento'
        DataSource = dsEnderecos
        TabOrder = 5
      end
      object dbeEndereco_CEP: TDBEdit
        Left = 88
        Top = 224
        Width = 96
        Height = 21
        DataField = 'cep'
        DataSource = dsEnderecos
        TabOrder = 6
      end
      object dbeEndereco_Descricao: TDBEdit
        Left = 88
        Top = 48
        Width = 300
        Height = 21
        DataField = 'descricao'
        DataSource = dsEnderecos
        TabOrder = 7
      end
      object Panel1: TPanel
        Left = 2
        Top = 251
        Width = 645
        Height = 34
        Align = alBottom
        TabOrder = 8
        object SpeedButton1: TSpeedButton
          Left = 4
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Novo'
        end
        object SpeedButton2: TSpeedButton
          Left = 64
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Alterar'
        end
        object SpeedButton3: TSpeedButton
          Left = 124
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Salvar'
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 184
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Excluir'
          OnClick = SpeedButton4Click
        end
      end
      object DBGrid2: TDBGrid
        Left = 404
        Top = 17
        Width = 231
        Height = 225
        Anchors = [akLeft, akTop, akRight]
        DataSource = dsEnderecos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -1
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 180
            Visible = True
          end>
      end
      object Edit2: TEdit
        Left = 236
        Top = 17
        Width = 121
        Height = 21
        TabOrder = 10
        Text = '04212020'
      end
      object DBEdit1: TDBEdit
        Left = 88
        Top = 108
        Width = 121
        Height = 21
        DataField = 'numero'
        DataSource = dsEnderecos
        TabOrder = 11
      end
    end
    object gpbTelefones: TGroupBox
      Left = 15
      Top = 204
      Width = 649
      Height = 143
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Telefones'
      TabOrder = 2
      DesignSize = (
        649
        143)
      object Label4: TLabel
        Left = 16
        Top = 19
        Width = 96
        Height = 13
        Caption = '&Buscar por Telefone'
        FocusControl = edBuscaNumero
      end
      object Label13: TLabel
        Left = 16
        Top = 49
        Width = 63
        Height = 13
        Caption = 'Tipo telefone'
        Visible = False
      end
      object Label14: TLabel
        Left = 16
        Top = 79
        Width = 80
        Height = 13
        Caption = 'N'#250'mero telefone'
      end
      object edBuscaNumero: TEdit
        Left = 121
        Top = 16
        Width = 145
        Height = 21
        TabOrder = 0
        OnKeyPress = edBuscaNumeroKeyPress
      end
      object ComboBox1: TComboBox
        Left = 121
        Top = 46
        Width = 145
        Height = 21
        TabOrder = 1
        Text = 'ComboBox1'
        Visible = False
      end
      object dbeTelefone_Numero: TDBEdit
        Left = 121
        Top = 76
        Width = 145
        Height = 21
        DataField = 'numero'
        DataSource = dsTelefones
        TabOrder = 2
      end
      object Panel2: TPanel
        Left = 2
        Top = 107
        Width = 645
        Height = 34
        Align = alBottom
        TabOrder = 3
        object SpeedButton9: TSpeedButton
          Left = 4
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Novo'
          OnClick = SpeedButton9Click
        end
        object SpeedButton10: TSpeedButton
          Left = 64
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Alterar'
        end
        object SpeedButton11: TSpeedButton
          Left = 124
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Salvar'
          OnClick = SpeedButton11Click
        end
        object SpeedButton12: TSpeedButton
          Left = 184
          Top = 1
          Width = 58
          Height = 30
          Caption = 'Excluir'
          OnClick = SpeedButton12Click
        end
      end
      object DBGrid1: TDBGrid
        Left = 280
        Top = 16
        Width = 353
        Height = 81
        Anchors = [akLeft, akTop, akRight]
        DataSource = dsTelefones
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -1
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'numero'
            Width = 180
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 678
      Height = 41
      Align = alTop
      TabOrder = 3
    end
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = dmMain.qryClientes_
    Left = 482
    Top = 235
  end
  object dsTelefones: TDataSource
    AutoEdit = False
    DataSet = dmMain.qryTelefones_
    Left = 457
    Top = 89
  end
  object dsEnderecos: TDataSource
    AutoEdit = False
    DataSet = dmMain.qryEnderecos_
    Left = 472
    Top = 430
  end
  object MainMenu1: TMainMenu
    Left = 560
    Top = 88
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ParseText = True
    WebService = wsViaCep
    PesquisarIBGE = True
    Left = 583
    Top = 452
  end
end
