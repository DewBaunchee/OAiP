object ModalView: TModalView
  Left = 280
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Record view'
  ClientHeight = 163
  ClientWidth = 487
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
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
  end
  object Label2: TLabel
    Left = 68
    Top = 56
    Width = 43
    Height = 26
    Caption = 'Day:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 88
    Width = 55
    Height = 26
    Caption = 'Order:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 45
    Top = 120
    Width = 66
    Height = 26
    Caption = 'Subject:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object ProfessorEdit: TEdit
    Left = 117
    Top = 23
    Width = 200
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object DayEdit: TEdit
    Left = 117
    Top = 55
    Width = 44
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object SubjectEdit: TEdit
    Left = 117
    Top = 119
    Width = 200
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object OrderEdit: TEdit
    Left = 117
    Top = 87
    Width = 20
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object CloseButton: TButton
    Left = 352
    Top = 111
    Width = 107
    Height = 35
    Caption = 'Close'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = CloseButtonClick
  end
end
