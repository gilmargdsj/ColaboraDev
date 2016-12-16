object frmSelCliente: TfrmSelCliente
  Left = 0
  Top = 0
  Caption = 'frmSelCliente'
  ClientHeight = 611
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object udsClientes: TUniDataSource
    DataSet = dmMain.qryClientes_
    Left = 360
    Top = 176
  end
  object udsEnderecos: TUniDataSource
    DataSet = dmMain.qryEnderecos_
    Left = 360
    Top = 232
  end
end
