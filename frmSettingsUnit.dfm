object frmSettings: TfrmSettings
  Left = 0
  Top = 27
  Margins.Top = 4
  HorzScrollBar.Visible = False
  VertScrollBar.Smooth = True
  VertScrollBar.Tracking = True
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 483
  ClientWidth = 379
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 25
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 434
    Width = 379
    Height = 49
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel2'
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 432
    ExplicitWidth = 369
    object Button1: TButton
      AlignWithMargins = True
      Left = 211
      Top = 3
      Width = 160
      Height = 43
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      ExplicitLeft = 201
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 46
      Top = 3
      Width = 160
      Height = 43
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alRight
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      ExplicitLeft = 36
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 10
    Width = 363
    Height = 411
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Panel8'
    Padding.Left = 12
    Padding.Top = 12
    Padding.Right = 12
    ShowCaption = False
    TabOrder = 1
    object RzGroupBox6: TRzGroupBox
      Left = 13
      Top = 91
      Width = 337
      Height = 78
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Theme style'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -18
      CaptionFont.Name = 'Verdana'
      CaptionFont.Style = [fsBold]
      Color = 2829099
      GroupStyle = gsUnderline
      TabOrder = 0
      Transparent = True
      object ComboBox_ui_theme: TComboBox
        Left = 0
        Top = 29
        Width = 337
        Height = 33
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Windows11 Modern Dark'
        Items.Strings = (
          'Windows11 Modern Dark'
          'Windows11 Modern Light')
      end
    end
    object RzGroupBox5: TRzGroupBox
      Left = 13
      Top = 169
      Width = 337
      Height = 78
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'UI Font'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -18
      CaptionFont.Name = 'Verdana'
      CaptionFont.Style = [fsBold]
      Color = 2829099
      GroupStyle = gsUnderline
      TabOrder = 1
      Transparent = True
      object FontComboBox_ui_font_name: TRzFontComboBox
        AlignWithMargins = True
        Left = 5
        Top = 34
        Width = 248
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 1
        Margins.Bottom = 5
        FontSize = 9
        ShowSymbolFonts = False
        ShowStyle = ssFontSample
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 32
        ParentFont = False
        TabOrder = 0
      end
      object SpinEdit_ui_font_size: TSpinEdit
        AlignWithMargins = True
        Left = 259
        Top = 34
        Width = 73
        Height = 38
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 6
        Align = alRight
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object RzGroupBox10: TRzGroupBox
      Left = 13
      Top = 247
      Width = 337
      Height = 78
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Check for running browser'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -18
      CaptionFont.Name = 'Verdana'
      CaptionFont.Style = [fsBold]
      Color = 2829099
      GroupStyle = gsUnderline
      TabOrder = 2
      Transparent = True
      Visible = False
      object ToggleSwitch9: TToggleSwitch
        AlignWithMargins = True
        Left = 5
        Top = 34
        Width = 107
        Height = 39
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Segoe UI'
        Font.Style = [fsUnderline]
        ParentFont = False
        SwitchHeight = 30
        SwitchWidth = 75
        TabOrder = 0
        ThumbWidth = 30
        ExplicitHeight = 30
      end
      object Button4: TButton
        AlignWithMargins = True
        Left = 194
        Top = 34
        Width = 138
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Caption = 'configure...'
        TabOrder = 1
      end
    end
    object RzGroupBox7: TRzGroupBox
      Left = 13
      Top = 13
      Width = 337
      Height = 78
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Language'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -18
      CaptionFont.Name = 'Verdana'
      CaptionFont.Style = [fsBold]
      Color = 2829099
      Enabled = False
      GroupStyle = gsUnderline
      TabOrder = 3
      Transparent = True
      Visible = False
      ExplicitTop = 3
      object ComboBox_ui_language: TComboBox
        Left = 0
        Top = 29
        Width = 337
        Height = 33
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        Style = csDropDownList
        Enabled = False
        ItemIndex = 0
        TabOrder = 0
        Text = 'English'
        Items.Strings = (
          'English'
          'Russian')
      end
    end
    object RzGroupBox4: TRzGroupBox
      Left = 13
      Top = 325
      Width = 337
      Height = 78
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Caching'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -18
      CaptionFont.Name = 'Verdana'
      CaptionFont.Style = [fsBold]
      Color = 2829099
      GroupStyle = gsUnderline
      TabOrder = 4
      Transparent = True
      object Button3: TButton
        AlignWithMargins = True
        Left = 194
        Top = 34
        Width = 138
        Height = 39
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Caption = 'clear cache'
        TabOrder = 0
        OnClick = Button3Click
      end
    end
  end
end
