object AddProfileDlgForm: TAddProfileDlgForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = ' Add profile path'
  ClientHeight = 171
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 144
  TextHeight = 25
  object ComboBoxEx1: TComboBoxEx
    Left = 12
    Top = 60
    Width = 496
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ItemsEx = <>
    Style = csExDropDownList
    ItemHeight = 28
    TabOrder = 0
    Images = DataModule1.SVGIconImageList2
  end
  object Panel1: TPanel
    Left = 10
    Top = 9
    Width = 505
    Height = 41
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    BevelOuter = bvNone
    Caption = 'Panel1'
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    ShowCaption = False
    TabOrder = 1
    object RzToolButton1: TRzToolButton
      AlignWithMargins = True
      Left = 457
      Top = 2
      Width = 41
      Height = 37
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      ImageIndex = 11
      Images = DataModule1.SVGIconImageList1
      Align = alRight
      ExplicitLeft = 456
      ExplicitTop = 3
      ExplicitHeight = 35
    end
    object RzToolButton2: TRzToolButton
      AlignWithMargins = True
      Left = 414
      Top = 2
      Width = 38
      Height = 37
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ImageIndex = 12
      Images = DataModule1.SVGIconImageList1
      Align = alRight
      ExplicitLeft = 408
      ExplicitTop = 3
      ExplicitHeight = 35
    end
    object Edit1: TEdit
      Left = 2
      Top = 2
      Width = 407
      Height = 37
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      TabOrder = 0
      Text = 'Edit1'
      ExplicitHeight = 33
    end
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 114
    Width = 531
    Height = 57
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    WidthOk = 113
    WidthCancel = 113
    WidthHelp = 113
    Color = 2829099
    TabOrder = 2
    ExplicitTop = 238
    ExplicitWidth = 928
  end
end
