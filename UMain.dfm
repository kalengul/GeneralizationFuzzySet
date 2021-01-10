object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 49
    Align = alTop
    TabOrder = 0
    object LaN1: TLabeledEdit
      Left = 0
      Top = 22
      Width = 33
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'LaN1'
      TabOrder = 0
      Text = '4'
      OnChange = LaN1Change
    end
    object LaN2: TLabeledEdit
      Left = 39
      Top = 23
      Width = 34
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'LaN2'
      TabOrder = 1
      Text = '4'
      OnChange = LaN2Change
    end
    object Button1: TButton
      Left = 151
      Top = 19
      Width = 75
      Height = 25
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1096#1072#1075
      TabOrder = 2
      OnClick = Button1Click
    end
    object LaShag: TLabeledEdit
      Left = 79
      Top = 23
      Width = 66
      Height = 21
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = 'LaShag'
      TabOrder = 3
      Text = '0,01'
    end
    object Button2: TButton
      Left = 373
      Top = 19
      Width = 129
      Height = 25
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1087#1086#1075#1088#1077#1096#1085#1086#1089#1090#1100
      TabOrder = 4
      OnClick = Button2Click
    end
    object LaShN: TLabeledEdit
      Left = 232
      Top = 23
      Width = 48
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'LaShN'
      TabOrder = 5
      Text = '0,0001'
    end
    object LaShDelt: TLabeledEdit
      Left = 286
      Top = 22
      Width = 42
      Height = 21
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = 'LaShDelt'
      TabOrder = 6
      Text = '0,0001'
    end
    object LaShK: TLabeledEdit
      Left = 334
      Top = 22
      Width = 33
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'LaShK'
      TabOrder = 7
      Text = '0,01'
    end
    object BtLoad: TButton
      Left = 508
      Top = 19
      Width = 75
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      TabOrder = 8
      OnClick = BtLoadClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 185
    Height = 250
    Align = alLeft
    TabOrder = 1
    object Sg1: TStringGrid
      Left = 1
      Top = 1
      Width = 183
      Height = 248
      Align = alClient
      ColCount = 2
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 185
    Top = 49
    Width = 412
    Height = 250
    Align = alClient
    TabOrder = 2
    object Sg2: TStringGrid
      Left = 1
      Top = 1
      Width = 410
      Height = 248
      Align = alClient
      ColCount = 2
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
  end
end
