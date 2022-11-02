object frmSettings: TfrmSettings
  Left = 0
  Top = 27
  BorderStyle = bsDialog
  Caption = ' Settings'
  ClientHeight = 451
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  PixelsPerInch = 144
  TextHeight = 25
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 396
    Width = 734
    Height = 55
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    WidthOk = 113
    WidthCancel = 113
    WidthHelp = 113
    Color = 2829099
    TabOrder = 0
  end
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
    Color = 2829099
    GroupStyle = gsUnderline
    TabOrder = 1
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
    Left = 332
    Top = 198
    Width = 390
    Height = 176
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Search profiles'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -18
    CaptionFont.Name = 'Verdana'
    CaptionFont.Style = [fsBold]
    Color = 2829099
    GroupStyle = gsUnderline
    TabOrder = 2
    object Label8: TLabel
      Left = 12
      Top = 36
      Width = 333
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Search profiles through desktop shortcuts'
    end
    object Label9: TLabel
      Left = 12
      Top = 108
      Width = 348
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Search profiles through startmenu shortcuts'
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
    Left = 332
    Top = 12
    Width = 390
    Height = 177
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
    Color = 2829099
    GroupStyle = gsUnderline
    TabOrder = 3
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
  end
end
