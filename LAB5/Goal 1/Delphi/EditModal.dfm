object EditModalForm: TEditModalForm
  Left = 549
  Top = 439
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Edit element'
  ClientHeight = 48
  ClientWidth = 499
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
  object ElementEdit: TEdit
    Left = 8
    Top = 8
    Width = 273
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnChange = EditChange
    OnKeyDown = KeyDown
    OnKeyPress = ElemEditKeyPress
  end
  object ClearButton: TButton
    Left = 287
    Top = 8
    Width = 98
    Height = 31
    Caption = 'Clear'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'GOST Common'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnClick = ClearButtonClick
  end
  object EditButton: TButton
    Left = 391
    Top = 8
    Width = 98
    Height = 31
    Caption = 'Edit'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'GOST Common'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnClick = EditButtonClick
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 8
  end
end
