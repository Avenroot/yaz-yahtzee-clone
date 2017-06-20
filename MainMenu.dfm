object frmMainMenu: TfrmMainMenu
  Left = 0
  Top = 0
  Caption = 'Main Menu'
  ClientHeight = 207
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnPlayYaz: TButton
    Left = 120
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Play Yaz'
    TabOrder = 0
    OnClick = btnPlayYazClick
  end
  object btnExit: TButton
    Left = 120
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 1
    OnClick = btnExitClick
  end
end
