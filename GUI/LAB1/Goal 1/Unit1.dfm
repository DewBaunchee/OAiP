object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1042#1086#1088#1080#1074#1086#1076#1072' '#1052#1072#1090#1074#1077#1081', '#1075#1088#1091#1087#1087#1072' 951007, '#1051#1072#1073'. 1.1'
  ClientHeight = 419
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 375
    Height = 23
    Caption = 'Do points lie on the same circle? Answer is : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Result: TLabel
    Left = 397
    Top = 11
    Width = 5
    Height = 19
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object X1Label: TLabel
    Left = 16
    Top = 48
    Width = 29
    Height = 19
    Caption = 'X1: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Y1Label: TLabel
    Left = 176
    Top = 48
    Width = 30
    Height = 19
    Caption = 'Y1: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object X2Label: TLabel
    Left = 16
    Top = 96
    Width = 29
    Height = 19
    Caption = 'X2: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Y2Label: TLabel
    Left = 176
    Top = 96
    Width = 30
    Height = 19
    Caption = 'Y2: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ErrorLabel: TLabel
    Left = 16
    Top = 216
    Width = 5
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object X1Edit: TEdit
    Left = 49
    Top = 46
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = KeyPress
  end
  object Y1Edit: TEdit
    Left = 203
    Top = 46
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = KeyPress
  end
  object X2Edit: TEdit
    Left = 49
    Top = 101
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = KeyPress
  end
  object Y2Edit: TEdit
    Left = 203
    Top = 98
    Width = 121
    Height = 21
    TabOrder = 3
    OnKeyPress = KeyPress
  end
  object Check: TButton
    Left = 88
    Top = 128
    Width = 161
    Height = 65
    Caption = 'Check'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = CheckClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 400
    Width = 735
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 704
    Top = 288
    object File1: TMenuItem
      Caption = '&File'
      object Open1: TMenuItem
        Caption = 'Open...'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save...'
        OnClick = Save1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object Program1: TMenuItem
        Caption = 'Program'
        OnClick = Program1Click
      end
      object Author1: TMenuItem
        Caption = 'Author'
        OnClick = Author1Click
      end
    end
  end
  object OpenTextFileDialog: TOpenTextFileDialog
    FileName = 'C:\Users\vmega\OneDrive\'#1056#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083'\'#1092#1086#1088#1084#1099'\'#1092#1086#1088#1084#1072' 1.1\fileee.txt'
    Filter = 'extensions|*.txt;*.doc;*.text'
    FilterIndex = 0
    Left = 704
    Top = 328
  end
  object SaveTextFileDialog: TSaveTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 704
    Top = 368
  end
end
