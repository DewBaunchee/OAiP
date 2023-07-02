object ModalEdit: TModalEdit
  Left = 0
  Top = 0
  Caption = 'Edit record'
  ClientHeight = 154
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
    TabOrder = 0
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
    TabOrder = 1
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
    TabOrder = 2
    OnClick = CloseButtonClick
  end
  object DeleteButton: TButton
    Left = 354
    Top = 63
    Width = 107
    Height = 35
    Caption = 'Delete'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 3
    OnClick = DeleteButtonClick
  end
  object EditButton: TButton
    Left = 354
    Top = 22
    Width = 107
    Height = 35
    Caption = 'Edit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Harlow Solid Italic'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = EditButtonClick
  end
  object DayEdit: TComboBox
    Left = 117
    Top = 55
    Width = 52
    Height = 27
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
    Left = 117
    Top = 86
    Width = 52
    Height = 27
    Cursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = '1'
    OnKeyPress = OrderKeyPress
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
  end
end
