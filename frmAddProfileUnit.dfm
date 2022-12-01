object AddProfileDlgForm: TAddProfileDlgForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = ' Add profile path'
  ClientHeight = 159
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 25
  object ComboBoxEx1: TComboBoxEx
    Left = 13
    Top = 58
    Width = 494
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
    object SpeedButton1: TSpeedButton
      Left = 469
      Top = 2
      Width = 34
      Height = 37
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      ImageIndex = 12
      ImageName = 'icons8_opened_folder'
      Images = DataModule1.SVGIconImageList1
      OnClick = SpeedButton1Click
      ExplicitLeft = 336
    end
    object SpeedButton2: TSpeedButton
      Left = 435
      Top = 2
      Width = 34
      Height = 37
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      ImageIndex = 11
      ImageName = 'icons8_paste'
      Images = DataModule1.SVGIconImageList1
      OnClick = SpeedButton2Click
      ExplicitLeft = 445
    end
    object Edit1: TEdit
      Left = 2
      Top = 2
      Width = 433
      Height = 37
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      TabOrder = 0
      TextHint = 'Profile path...'
      ExplicitHeight = 33
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 111
    Width = 517
    Height = 48
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel2'
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 109
    ExplicitWidth = 507
    object Button1: TButton
      AlignWithMargins = True
      Left = 349
      Top = 3
      Width = 160
      Height = 42
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      ExplicitLeft = 339
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 184
      Top = 3
      Width = 160
      Height = 42
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alRight
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      ExplicitLeft = 174
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 268
    Top = 21
  end
end
