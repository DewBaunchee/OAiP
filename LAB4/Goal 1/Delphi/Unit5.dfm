object EditForm: TEditForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Edit timetable'
  ClientHeight = 294
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
    Top = 88
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
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnSelectCell = TimetableSelectCell
  end
  object Button5: TButton
    Left = 586
    Top = 256
    Width = 146
    Height = 33
    Caption = 'Close'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = Close1Click
  end
  object Button3: TButton
    Left = 586
    Top = 217
    Width = 146
    Height = 33
    Caption = 'Help'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 2
    OnClick = Help1Click
  end
  object Button2: TButton
    Left = 586
    Top = 134
    Width = 146
    Height = 33
    Caption = 'Save'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 3
    OnClick = Saveas1Click
  end
  object Button1: TButton
    Left = 586
    Top = 95
    Width = 146
    Height = 33
    Caption = 'Open'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = Open1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 89
    Caption = 'Timetable editing'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -43
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 200
  end
  object MainMenu1: TMainMenu
    Left = 240
    Top = 200
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
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 152
    Top = 200
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 48
    Top = 200
  end
end
