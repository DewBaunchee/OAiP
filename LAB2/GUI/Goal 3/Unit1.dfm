object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1074#1077#1081' '#1042#1086#1088#1080#1074#1086#1076#1072', 951007, '#1051#1072#1073'. 2.3'
  ClientHeight = 375
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 225
    Top = 8
    Width = 51
    Height = 23
    Caption = 'Matrix'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 98
    Height = 19
    Caption = 'Matrix length:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ErrorLabel: TLabel
    Left = 178
    Top = 175
    Width = 5
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Result: TLabel
    Left = 282
    Top = 8
    Width = 39
    Height = 23
    Caption = 'isn`t'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 327
    Top = 8
    Width = 61
    Height = 23
    Caption = 'identity'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BackGround: TStringGrid
    Left = 178
    Top = 37
    Width = 248
    Height = 128
    ColCount = 8
    DefaultColWidth = 48
    Enabled = False
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 3
  end
  object MatrixLength: TComboBox
    Left = 112
    Top = 37
    Width = 37
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 4
    ParentFont = False
    TabOrder = 0
    Text = '5'
    OnChange = MatrixLengthChange
    OnExit = MatrixLengthExit
    OnKeyPress = MatrixLengthKeyPress
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
  end
  object Check: TButton
    Left = 8
    Top = 124
    Width = 141
    Height = 41
    Caption = 'Check'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = CheckClick
  end
  object MatrixGrid: TStringGrid
    Left = 178
    Top = 37
    Width = 248
    Height = 128
    DefaultColWidth = 48
    FixedCols = 0
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 2
    OnExit = MatrixGridExit
    OnKeyPress = MatrixGridKeyPress
    OnSelectCell = MatrixGridSelectCell
  end
  object FocusStopper: TEdit
    Left = 40
    Top = 408
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'FocusStopper'
  end
  object Button1: TButton
    Left = 8
    Top = 65
    Width = 141
    Height = 40
    Caption = 'Set length'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = SetLenClick
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 320
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
    Left = 120
    Top = 320
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 232
    Top = 320
  end
end
