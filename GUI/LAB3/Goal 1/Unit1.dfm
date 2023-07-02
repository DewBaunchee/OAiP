object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1074#1077#1081' '#1042#1086#1088#1080#1074#1086#1076#1072', 951007, '#1051#1072#1073'. 3.1'
  ClientHeight = 387
  ClientWidth = 710
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
    Left = 151
    Top = 8
    Width = 408
    Height = 25
    Caption = 'K-th occurrence of substring in a string'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 41
    Top = 51
    Width = 57
    Height = 23
    Caption = 'String:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 11
    Top = 96
    Width = 87
    Height = 23
    Caption = 'Substring:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 80
    Top = 141
    Width = 18
    Height = 23
    Caption = 'K:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 211
    Top = 192
    Width = 64
    Height = 23
    Caption = 'Result: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Result: TLabel
    Left = 281
    Top = 192
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
    Left = 151
    Top = 141
    Width = 6
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Check: TButton
    Left = 104
    Top = 184
    Width = 97
    Height = 41
    Caption = 'Check'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = CheckClick
  end
  object SubstrEdit: TEdit
    Left = 104
    Top = 96
    Width = 297
    Height = 27
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = SubStrChange
    OnKeyPress = SubStrKeyPress
  end
  object StrEdit: TEdit
    Left = 104
    Top = 51
    Width = 297
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = StrChange
    OnKeyPress = StrKeyPress
  end
  object KEdit: TEdit
    Left = 104
    Top = 141
    Width = 33
    Height = 27
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnExit = KEditExit
    OnKeyPress = IntKeyPress
  end
  object CaseSens: TCheckBox
    Left = 430
    Top = 80
    Width = 129
    Height = 17
    Caption = 'Case Sensitive'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 104
    Top = 240
    Width = 97
    Height = 41
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = ClearButtonClick
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 328
    object File1: TMenuItem
      Caption = 'File'
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
    Left = 112
    Top = 328
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 224
    Top = 328
  end
end
