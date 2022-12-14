object frmSettings: TfrmSettings
  Left = 0
  Top = 27
  BorderStyle = bsDialog
  Caption = ' Settings'
  ClientHeight = 595
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 25
  object RzGroupBox1: TRzGroupBox
    Left = 12
    Top = 12
    Width = 302
    Height = 326
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Optimization'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -18
    CaptionFont.Name = 'Verdana'
    CaptionFont.Style = [fsBold]
    Color = 15987699
    GroupStyle = gsUnderline
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 186
      Width = 178
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Delete *.sqlite-wal files'
    end
    object Label2: TLabel
      Left = 12
      Top = 255
      Width = 186
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Delete *.sqlite-shm files'
    end
    object Label3: TLabel
      Left = 12
      Top = 36
      Width = 203
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Ignore file if size less than'
    end
    object Label4: TLabel
      Left = 12
      Top = 111
      Width = 228
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Sub folder search max depth'
    end
    object Label5: TLabel
      Left = 120
      Top = 149
      Width = 102
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = '0 - unlimited'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 192
      Top = 68
      Width = 93
      Height = 33
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Bytes'
        'KB'
        'MB'
        'GB')
    end
    object Edit1: TEdit
      Left = 12
      Top = 68
      Width = 171
      Height = 33
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      NumbersOnly = True
      TabOrder = 1
      Text = '1'
    end
    object Edit2: TEdit
      Left = 12
      Top = 143
      Width = 99
      Height = 33
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      NumbersOnly = True
      TabOrder = 2
      Text = '0'
    end
    object ToggleSwitch1: TToggleSwitch
      Left = 12
      Top = 218
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      SwitchHeight = 30
      SwitchWidth = 75
      TabOrder = 3
      ThumbWidth = 30
    end
    object ToggleSwitch2: TToggleSwitch
      Left = 12
      Top = 287
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      SwitchHeight = 30
      SwitchWidth = 75
      TabOrder = 4
      ThumbWidth = 30
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 10
    Top = 348
    Width = 314
    Height = 176
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Extra search profiles'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -18
    CaptionFont.Name = 'Verdana'
    CaptionFont.Style = [fsBold]
    Color = 15987699
    GroupStyle = gsUnderline
    TabOrder = 1
    object Label8: TLabel
      Left = 12
      Top = 36
      Width = 163
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'In desktop shortcuts'
    end
    object Label9: TLabel
      Left = 12
      Top = 108
      Width = 178
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'In startmenu shortcuts'
    end
    object ToggleSwitch5: TToggleSwitch
      Left = 12
      Top = 68
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      SwitchHeight = 30
      SwitchWidth = 75
      TabOrder = 0
      ThumbWidth = 30
    end
    object ToggleSwitch6: TToggleSwitch
      Left = 12
      Top = 140
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      SwitchHeight = 30
      SwitchWidth = 75
      TabOrder = 1
      ThumbWidth = 30
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 330
    Top = 12
    Width = 327
    Height = 327
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Misc'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -18
    CaptionFont.Name = 'Verdana'
    CaptionFont.Style = [fsBold]
    Color = 15987699
    GroupStyle = gsUnderline
    TabOrder = 2
    object Label6: TLabel
      Left = 12
      Top = 36
      Width = 126
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Show help hints'
    end
    object Label7: TLabel
      Left = 12
      Top = 111
      Width = 216
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Show LOG (slow procesing)'
    end
    object Label10: TLabel
      Left = 12
      Top = 186
      Width = 108
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Titlebar menu'
    end
    object Label11: TLabel
      Left = 12
      Top = 261
      Width = 94
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Theme style'
    end
    object ToggleSwitch3: TToggleSwitch
      Left = 12
      Top = 68
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      SwitchHeight = 30
      SwitchWidth = 75
      TabOrder = 0
      ThumbWidth = 30
    end
    object ToggleSwitch4: TToggleSwitch
      Left = 12
      Top = 141
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      SwitchHeight = 30
      SwitchWidth = 75
      TabOrder = 1
      ThumbWidth = 30
    end
    object ToggleSwitch7: TToggleSwitch
      Left = 12
      Top = 216
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      SwitchHeight = 30
      SwitchWidth = 75
      TabOrder = 2
      ThumbWidth = 30
    end
    object ComboBox2: TComboBox
      Left = 12
      Top = 289
      Width = 301
      Height = 33
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'Windows11 Modern Dark'
      Items.Strings = (
        'Windows11 Modern Dark'
        'Windows11 Modern Light')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 547
    Width = 674
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
    TabOrder = 3
    ExplicitTop = 463
    ExplicitWidth = 724
    object Button1: TButton
      AlignWithMargins = True
      Left = 506
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
      ExplicitLeft = 556
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 341
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
      ExplicitLeft = 391
    end
  end
end
