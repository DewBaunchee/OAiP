object ViewForm: TViewForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'View timetable'
  ClientHeight = 282
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
    Top = 81
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
    OnSelectCell = TimetableSelectCell
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 81
    Caption = 'Opened timetable'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clBackground
    Font.Height = -43
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentBackground = False
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 1
  end
  object OpenButton: TButton
    Left = 592
    Top = 87
    Width = 140
    Height = 40
    Cursor = crHandPoint
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
  object HelpButton: TButton
    Left = 592
    Top = 188
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
    TabOrder = 3
    OnClick = Help1Click
  end
  object CloseButton: TButton
    Left = 592
    Top = 234
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
    TabOrder = 4
    OnClick = Close1Click
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
        ShortCut = 32847
        OnClick = Open1Click
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
  object PopupMenu1: TPopupMenu
    Left = 80
    Top = 16
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text'
    Left = 144
    Top = 24
  end
end
