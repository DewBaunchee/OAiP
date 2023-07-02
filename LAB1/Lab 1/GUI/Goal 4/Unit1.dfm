object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1074#1077#1081' '#1042#1086#1088#1080#1074#1086#1076#1072', 951007, '#1051#1072#1073'. 1.4'
  ClientHeight = 316
  ClientWidth = 605
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
    Left = 8
    Top = 8
    Width = 65
    Height = 23
    Caption = 'GCD of '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 175
    Top = 8
    Width = 32
    Height = 23
    Caption = 'and'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 309
    Top = 8
    Width = 25
    Height = 23
    Caption = 'is: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Result: TLabel
    Left = 340
    Top = 8
    Width = 6
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ErrorLabel: TLabel
    Left = 24
    Top = 113
    Width = 5
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Ebrima'
    Font.Style = []
    ParentFont = False
  end
  object MEdit: TEdit
    Left = 79
    Top = 8
    Width = 90
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = KeyPress
  end
  object NEdit: TEdit
    Left = 213
    Top = 8
    Width = 90
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = KeyPress
  end
  object Calculate: TButton
    Left = 24
    Top = 49
    Width = 133
    Height = 49
    Caption = 'Calculate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = CalculateClick
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 248
    object FIle1: TMenuItem
      Caption = 'FIle'
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
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 120
    Top = 248
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 232
    Top = 248
  end
end
