object FindForm: TFindForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Find in timetable'
  ClientHeight = 258
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Timetable: TStringGrid
    Left = 0
    Top = 56
    Width = 580
    Height = 201
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 57
    Color = clSkyBlue
    ParentBackground = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 72
      Height = 26
      Caption = 'Find by:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Harlow Solid Italic'
      Font.Style = [fsItalic]
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object Label2: TLabel
      Left = 224
      Top = 15
      Width = 49
      Height = 26
      Caption = 'Find:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Harlow Solid Italic'
      Font.Style = [fsItalic]
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object CritEdit: TComboBox
      Left = 94
      Top = 14
      Width = 91
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      Text = 'Professor'
      OnKeyPress = CritEditKeyPress
      Items.Strings = (
        'Professor'
        'Day'
        'Order'
        'Subject')
    end
    object FindEdit: TEdit
      Left = 279
      Top = 14
      Width = 301
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnKeyPress = FindEditKeyPress
    end
    object SearchButton: TButton
      Left = 586
      Top = 8
      Width = 146
      Height = 42
      Caption = 'Search'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Harlow Solid Italic'
      Font.Style = [fsItalic]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 2
      OnClick = SearchButtonClick
    end
  end
  object Button1: TButton
    Left = 586
    Top = 63
    Width = 146
    Height = 33
    Caption = 'Open'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnClick = Open1Click
  end
  object Button2: TButton
    Left = 586
    Top = 102
    Width = 146
    Height = 33
    Caption = 'Save'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnClick = Saveas1Click
  end
  object Button3: TButton
    Left = 586
    Top = 178
    Width = 146
    Height = 33
    Caption = 'Help'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 4
    OnClick = Help1Click
  end
  object Button5: TButton
    Left = 586
    Top = 217
    Width = 146
    Height = 33
    Caption = 'Close'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 5
    OnClick = Close1Click
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 40
    Top = 168
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 144
    Top = 168
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 168
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 168
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
        ShortCut = 32847
        OnClick = Open1Click
      end
      object Saveas1: TMenuItem
        Caption = 'Save as...'
        ShortCut = 32851
        OnClick = Saveas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Caption = 'Close'
        ShortCut = 27
        OnClick = Close1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object Help1: TMenuItem
        Caption = 'Help'
        ShortCut = 32837
        OnClick = Help1Click
      end
      object Hotkeys1: TMenuItem
        Caption = 'Hot keys'
        ShortCut = 32840
        OnClick = Hotkeys1Click
      end
    end
  end
end
