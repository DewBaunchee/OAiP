object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1042#1086#1088#1080#1074#1086#1076#1072' '#1052#1072#1090#1074#1077#1081', 951007, '#1051#1072#1073'.4.2'
  ClientHeight = 408
  ClientWidth = 631
  Color = clSkyBlue
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
  object Label2: TLabel
    Left = 37
    Top = 8
    Width = 81
    Height = 24
    Caption = 'RowCoint:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
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
    Width = 216
    Height = 40
    Caption = 'Searching of way'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 184
    Width = 50
    Height = 24
    Caption = 'From:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 31
    Top = 209
    Width = 27
    Height = 24
    Caption = 'To:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 97
    Top = 159
    Width = 11
    Height = 22
    Caption = 'j'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 72
    Top = 162
    Width = 11
    Height = 22
    Caption = 'i'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 45
    Top = 38
    Width = 73
    Height = 24
    Caption = 'ColCount:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 27
    Top = 302
    Width = 145
    Height = 24
    Caption = 'Best way by points:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    Visible = False
  end
  object Button1: TButton
    Left = 8
    Top = 68
    Width = 153
    Height = 40
    Caption = 'Set length'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 0
    OnClick = SetLenClick
  end
  object MEdit: TComboBox
    Left = 124
    Top = 6
    Width = 37
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 8
    ParentFont = False
    TabOrder = 1
    Text = '9'
    OnChange = MEditChange
    OnExit = MEditExit
    OnKeyPress = MEditKeyPress
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9')
  end
  object BackGround: TStringGrid
    Left = 178
    Top = 54
    Width = 445
    Height = 227
    ColCount = 9
    DefaultColWidth = 48
    Enabled = False
    FixedCols = 0
    RowCount = 9
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 2
  end
  object MatrixGrid: TStringGrid
    Left = 178
    Top = 54
    Width = 445
    Height = 227
    ColCount = 9
    DefaultColWidth = 48
    FixedCols = 0
    RowCount = 9
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 3
    OnExit = MatrixGridExit
    OnKeyPress = MatrixGridKeyPress
    OnSelectCell = MatrixGridSelectCell
  end
  object FocusStopper: TEdit
    Left = 45
    Top = 512
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'FocusStopper'
  end
  object I1Edit: TEdit
    Left = 72
    Top = 186
    Width = 19
    Height = 21
    TabOrder = 5
    OnChange = CoordsChange
    OnKeyPress = IKeyPress
  end
  object I2Edit: TEdit
    Left = 72
    Top = 213
    Width = 19
    Height = 21
    TabOrder = 6
    OnChange = CoordsChange
    OnKeyPress = IKeyPress
  end
  object J2Edit: TEdit
    Left = 97
    Top = 213
    Width = 19
    Height = 21
    TabOrder = 7
    OnChange = CoordsChange
    OnKeyPress = JKeyPress
  end
  object J1Edit: TEdit
    Left = 97
    Top = 186
    Width = 19
    Height = 21
    TabOrder = 8
    OnChange = CoordsChange
    OnKeyPress = JKeyPress
  end
  object FindButton: TButton
    Left = 8
    Top = 240
    Width = 153
    Height = 40
    Caption = 'Find the way'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 9
    OnClick = FindButtonClick
  end
  object NEdit: TComboBox
    Left = 124
    Top = 35
    Width = 37
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 8
    ParentFont = False
    TabOrder = 10
    Text = '9'
    OnChange = MEditChange
    OnExit = MEditExit
    OnKeyPress = MEditKeyPress
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9')
  end
  object PointsGrid: TStringGrid
    Left = 178
    Top = 302
    Width = 445
    Height = 99
    ColCount = 10
    RowCount = 3
    TabOrder = 11
    Visible = False
  end
  object ClearButton: TButton
    Left = 8
    Top = 116
    Width = 153
    Height = 40
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 12
    OnClick = ClearButtonClick
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 360
    Top = 167
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 296
    Top = 167
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 163
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open...'
        ShortCut = 32847
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save...'
        ShortCut = 32851
        OnClick = Save1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        ShortCut = 27
        OnClick = Exit1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object Program1: TMenuItem
        Caption = 'Program'
        ShortCut = 32848
        OnClick = Program1Click
      end
      object Hotkeys1: TMenuItem
        Caption = 'Hot keys'
        ShortCut = 32840
        OnClick = Hotkeys1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Author1: TMenuItem
        Caption = 'Author'
        ShortCut = 32833
        OnClick = Author1Click
      end
    end
  end
end
