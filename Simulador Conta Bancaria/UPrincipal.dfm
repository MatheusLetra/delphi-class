object Frm_Principal: TFrm_Principal
  Left = 0
  Top = 0
  Caption = 'Conta Corrente'
  ClientHeight = 191
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 52
    Top = 18
    Width = 25
    Height = 15
    Caption = 'CPF: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 61
    Width = 68
    Height = 15
    Caption = 'Nome Cliente: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 102
    Width = 54
    Height = 15
    Caption = ' Valor (R$): '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCriarConta: TButton
    Left = 265
    Top = 99
    Width = 94
    Height = 21
    Caption = 'Criar Conta'
    TabOrder = 2
    OnClick = btnCriarContaClick
  end
  object btnSacar: TButton
    Left = 52
    Top = 151
    Width = 94
    Height = 25
    Caption = 'Sacar'
    Enabled = False
    TabOrder = 4
    OnClick = btnSacarClick
  end
  object btnDepositar: TButton
    Left = 156
    Top = 151
    Width = 94
    Height = 25
    Caption = 'Depositar'
    Enabled = False
    TabOrder = 5
    OnClick = btnDepositarClick
  end
  object btnConsultarSaldo: TButton
    Left = 265
    Top = 151
    Width = 94
    Height = 25
    Caption = 'Consultar Saldo'
    Enabled = False
    TabOrder = 6
    OnClick = btnConsultarSaldoClick
  end
  object edCPF: TEdit
    Left = 81
    Top = 17
    Width = 278
    Height = 21
    TabOrder = 0
    OnKeyPress = edCPFKeyPress
  end
  object edNomeCliente: TEdit
    Left = 81
    Top = 58
    Width = 278
    Height = 21
    TabOrder = 1
  end
  object edValor: TEdit
    Left = 81
    Top = 99
    Width = 169
    Height = 21
    Enabled = False
    TabOrder = 3
    OnKeyPress = edValorKeyPress
  end
end
