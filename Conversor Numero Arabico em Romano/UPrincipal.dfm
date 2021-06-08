object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Conversor N'#250'meros Ar'#225'bicos em Romanos'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 66
    Top = 67
    Width = 40
    Height = 13
    Caption = 'Ar'#225'bico:'
  end
  object Label2: TLabel
    Left = 63
    Top = 115
    Width = 43
    Height = 13
    Caption = 'Romano:'
  end
  object edNumero: TEdit
    Left = 112
    Top = 64
    Width = 192
    Height = 21
    TabOrder = 0
    OnKeyPress = edNumeroKeyPress
  end
  object edRomano: TEdit
    Left = 112
    Top = 112
    Width = 192
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object btnApagar: TButton
    Left = 112
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Apagar'
    TabOrder = 2
    OnClick = btnApagarClick
  end
  object btnConverter: TButton
    Left = 229
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Converter'
    TabOrder = 3
    OnClick = btnConverterClick
  end
end
