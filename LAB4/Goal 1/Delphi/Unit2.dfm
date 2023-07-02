object CreateForm: TCreateForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Creating timetable'
  ClientHeight = 314
  ClientWidth = 740
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 114
    Color = clSkyBlue
    Enabled = False
    ParentBackground = False
    PopupMenu = PopupMenu1
    TabOrder = 10
    object Label1: TLabel
      Left = 72
      Top = 24
      Width = 87
      Height = 26
      Caption = 'Professor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Harlow Solid Italic'
      Font.Style = [fsItalic]
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object Label2: TLabel
      Left = 93
      Top = 72
      Width = 66
      Height = 26
      Caption = 'Subject:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Harlow Solid Italic'
      Font.Style = [fsItalic]
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object Label3: TLabel
      Left = 393
      Top = 24
      Width = 43
      Height = 26
      Caption = 'Day:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Harlow Solid Italic'
      Font.Style = [fsItalic]
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object Label4: TLabel
      Left = 381
      Top = 72
      Width = 55
      Height = 26
      Caption = 'Order:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Harlow Solid Italic'
      Font.Style = [fsItalic]
      ParentFont = False
      PopupMenu = PopupMenu1
    end
  end
  object ProfessorEdit: TEdit
    Left = 165
    Top = 23
    Width = 194
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnKeyPress = ProfessorKeyPress
  end
  object SubjectEdit: TEdit
    Left = 165
    Top = 71
    Width = 194
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnKeyPress = SubjectKeyPress
  end
  object DayEdit: TComboBox
    Left = 442
    Top = 23
    Width = 52
    Height = 27
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 2
    Text = 'Mon'
    OnKeyPress = DayKeyPress
    Items.Strings = (
      'Mon'
      'Tue'
      'Wed'
      'Tue'
      'Fri'
      'Sat')
  end
  object OrderEdit: TComboBox
    Left = 442
    Top = 71
    Width = 52
    Height = 27
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 3
    Text = '1'
    OnExit = OrderExit
    OnKeyPress = OrderKeyPress
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
  end
  object AddRecordButton: TButton
    Left = 533
    Top = 32
    Width = 153
    Height = 57
    Cursor = crHandPoint
    Caption = 'Add record'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 4
    OnClick = AddRecordButtonClick
  end
  object Timetable: TStringGrid
    Left = 0
    Top = 113
    Width = 580
    Height = 201
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object SaveButton: TButton
    Left = 592
    Top = 120
    Width = 140
    Height = 40
    Cursor = crHandPoint
    Caption = 'Save'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 6
    OnClick = Save1Click
  end
  object ClearButton: TButton
    Left = 592
    Top = 159
    Width = 140
    Height = 40
    Cursor = crHandPoint
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 7
    OnClick = ClearButtonClick
  end
  object HelpButton: TButton
    Left = 592
    Top = 199
    Width = 140
    Height = 40
    Cursor = crHandPoint
    Caption = 'Help'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 8
    OnClick = HelpButtonClick
  end
  object CloseButton: TButton
    Left = 592
    Top = 266
    Width = 140
    Height = 40
    Cursor = crHandPoint
    Caption = 'Close'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 9
    OnClick = CloseButtonClick
  end
  object PopupMenu1: TPopupMenu
    Left = 21
    Top = 48
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 16
    object File1: TMenuItem
      Caption = 'File'
      object Save1: TMenuItem
        Caption = 'Save'
        ShortCut = 32851
        OnClick = Save1Click
      end
      object Clear1: TMenuItem
        Caption = 'Clear'
        ShortCut = 32835
        OnClick = ClearButtonClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Caption = 'Close'
        ShortCut = 27
        OnClick = CloseButtonClick
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object Help1: TMenuItem
        Caption = 'Help'
        ShortCut = 32837
        OnClick = HelpButtonClick
      end
      object Hotkeys1: TMenuItem
        Caption = 'Hot keys'
        ShortCut = 32840
        OnClick = Hotkeys1Click
      end
    end
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 80
    Top = 16
  end
end
