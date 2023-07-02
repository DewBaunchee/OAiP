object Form1: TForm1
  Left = 100
  Top = 100
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1086#1088#1080#1074#1086#1076#1072' '#1052#1072#1090#1074#1077#1081', 951007, '#1051#1072#1073'.4.1'
  ClientHeight = 63
  ClientWidth = 742
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 137
    Top = 0
    Width = 20
    Height = 63
    Align = alLeft
    Caption = 'fffff'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    PopupMenu = PopupMenu1
    Transparent = False
    ExplicitHeight = 13
  end
  object Label2: TLabel
    Left = 607
    Top = 0
    Width = 20
    Height = 63
    Align = alLeft
    Caption = 'fffff'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    PopupMenu = PopupMenu1
    Transparent = False
    ExplicitHeight = 13
  end
  object Timetable: TButton
    Left = 0
    Top = 0
    Width = 137
    Height = 63
    Cursor = crHandPoint
    Align = alLeft
    Caption = 'Timetable'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnClick = Aboutprogram1Click
    ExplicitHeight = 98
  end
  object Exit: TButton
    Left = 627
    Top = 0
    Width = 114
    Height = 63
    Cursor = crHandPoint
    Align = alLeft
    Caption = 'Exit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnClick = ExitClick
    ExplicitHeight = 98
  end
  object Help: TButton
    Left = 517
    Top = 0
    Width = 90
    Height = 63
    Cursor = crHandPoint
    Align = alLeft
    Caption = 'Help'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnClick = HelpClick
    ExplicitHeight = 98
  end
  object Edit: TButton
    Left = 427
    Top = 0
    Width = 90
    Height = 63
    Cursor = crHandPoint
    Align = alLeft
    Caption = 'Edit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnClick = EditClick
    ExplicitHeight = 98
  end
  object Find: TButton
    Left = 337
    Top = 0
    Width = 90
    Height = 63
    Cursor = crHandPoint
    Align = alLeft
    Caption = 'Find'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 4
    OnClick = FindClick
    ExplicitHeight = 98
  end
  object View: TButton
    Left = 247
    Top = 0
    Width = 90
    Height = 63
    Cursor = crHandPoint
    Align = alLeft
    Caption = 'View'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 5
    OnClick = ViewClick
    ExplicitHeight = 98
  end
  object Create: TButton
    Left = 157
    Top = 0
    Width = 90
    Height = 63
    Cursor = crHandPoint
    Align = alLeft
    Caption = 'Create'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 6
    OnClick = CreateClick
    ExplicitHeight = 98
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Create1: TMenuItem
        Caption = 'Create'
        ShortCut = 32835
        OnClick = CreateClick
      end
      object View1: TMenuItem
        Caption = 'View'
        ShortCut = 32854
        OnClick = ViewClick
      end
      object Find1: TMenuItem
        Caption = 'Find'
        ShortCut = 32838
        OnClick = FindClick
      end
      object Edit1: TMenuItem
        Caption = 'Edit'
        ShortCut = 32837
        OnClick = EditClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        ShortCut = 27
        OnClick = ExitClick
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Hotkeys1: TMenuItem
        Caption = 'Hot keys'
        ShortCut = 32840
        OnClick = Hotkeys1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Aboutprogram1: TMenuItem
        Caption = 'About program'
        ShortCut = 32848
        OnClick = Aboutprogram1Click
      end
      object Aboutauthor1: TMenuItem
        Caption = 'About author'
        ShortCut = 32833
        OnClick = Aboutauthor1Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 56
    Top = 8
  end
end
