object MainForm: TMainForm
  Left = 439
  Top = 247
  BorderStyle = bsSingle
  Caption = #1042#1086#1088#1080#1074#1086#1076#1072' '#1052#1072#1090#1074#1077#1081', 951007, '#1051#1072#1073'.5.1'
  ClientHeight = 338
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 390
    Height = 338
    Align = alLeft
    Color = clSkyBlue
    ParentBackground = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    object PrevLabel: TLabel
      Left = 0
      Top = 114
      Width = 385
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'PrevLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object CurrentLabel: TLabel
      Left = 0
      Top = 168
      Width = 385
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'CurrentLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object Label4: TLabel
      Left = 80
      Top = 8
      Width = 220
      Height = 36
      Caption = 'Double-linked list'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Harlow Solid Italic'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object NextLabel: TLabel
      Left = 0
      Top = 232
      Width = 385
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'NextLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object PrevIndexLabel: TLabel
      Left = 3
      Top = 113
      Width = 40
      Height = 19
      Caption = 'Index'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object CurrentIndexLabel: TLabel
      Left = 3
      Top = 168
      Width = 53
      Height = 25
      Alignment = taCenter
      Caption = 'Index'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
    end
    object NextIndexLabel: TLabel
      Left = 3
      Top = 232
      Width = 40
      Height = 19
      Caption = 'Index'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object PrevButton: TButton
      Left = 16
      Top = 44
      Width = 360
      Height = 48
      Caption = 'Previous'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnClick = PrevButtonClick
    end
    object NextButton: TButton
      Left = 16
      Top = 273
      Width = 360
      Height = 48
      Caption = 'Next'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnClick = NextButtonClick
    end
  end
  object Panel2: TPanel
    Left = 390
    Top = 0
    Width = 217
    Height = 338
    Align = alLeft
    Color = clSkyBlue
    ParentBackground = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    object ExitButton: TButton
      Left = 1
      Top = 289
      Width = 215
      Height = 48
      Align = alTop
      Caption = 'Exit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnClick = Exit1Click
    end
    object EditButton: TButton
      Left = 1
      Top = 145
      Width = 215
      Height = 48
      Align = alTop
      Caption = 'Edit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnClick = EditButtonClick
    end
    object SaveButton: TButton
      Left = 1
      Top = 241
      Width = 215
      Height = 48
      Align = alTop
      Caption = 'Save'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 2
      OnClick = SaveButtonClick
    end
    object OpenButton: TButton
      Left = 1
      Top = 193
      Width = 215
      Height = 48
      Align = alTop
      Caption = 'Open'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 3
      OnClick = OpenButtonClick
    end
    object DeleteButton: TButton
      Left = 1
      Top = 97
      Width = 215
      Height = 48
      Align = alTop
      Caption = 'Delete'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 4
      OnClick = DeleteButtonClick
    end
    object AddButton: TButton
      Left = 1
      Top = 49
      Width = 215
      Height = 48
      Align = alTop
      Caption = 'Add'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 5
      OnClick = AddButtonClick
    end
    object CreateButton: TButton
      Left = 1
      Top = 1
      Width = 215
      Height = 48
      Align = alTop
      Caption = 'Create empty'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'GOST Common'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 6
      OnClick = CreateButtonClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 288
    Top = 144
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open...'
        ShortCut = 16463
        OnClick = OpenButtonClick
      end
      object Save1: TMenuItem
        Caption = 'Save...'
        ShortCut = 16467
        OnClick = SaveButtonClick
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
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Edit2: TMenuItem
        Caption = 'Edit'
        ShortCut = 16453
        OnClick = EditButtonClick
      end
      object Add1: TMenuItem
        Caption = 'Add'
        ShortCut = 16449
        OnClick = AddButtonClick
      end
      object Delete1: TMenuItem
        Caption = 'Delete'
        ShortCut = 16452
        OnClick = DeleteButtonClick
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      object Hotkeys1: TMenuItem
        Caption = 'Hot keys'
        ShortCut = 16459
        OnClick = Hotkeys1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Aboutprogram1: TMenuItem
        Caption = 'About program'
        ShortCut = 16464
        OnClick = Aboutprogram1Click
      end
      object Aboutauthor1: TMenuItem
        Caption = 'About author'
        ShortCut = 16469
        OnClick = Aboutauthor1Click
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = 'extensions|*.txt;*.doc;*.text;'
    Left = 288
    Top = 240
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = '.txt'
    Filter = 'extensions|*.txt;*.doc;*.text;'
    Left = 288
    Top = 192
  end
  object PopupMenu1: TPopupMenu
    Left = 288
    Top = 104
  end
end
