object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 274
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 238
    Width = 459
    Color = 2829099
    TabOrder = 0
    ExplicitTop = 237
    ExplicitWidth = 455
  end
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 201
    Height = 217
    Caption = 'Optimization'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -12
    CaptionFont.Name = 'Verdana'
    CaptionFont.Style = [fsBold]
    Color = 2829099
    GroupStyle = gsUnderline
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 124
      Width = 119
      Height = 15
      Caption = 'Delete *.sqlite-wal files'
    end
    object Label2: TLabel
      Left = 8
      Top = 170
      Width = 124
      Height = 15
      Caption = 'Delete *.sqlite-shm files'
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 134
      Height = 15
      Caption = 'Ignore file if size less than'
    end
    object Label4: TLabel
      Left = 8
      Top = 74
      Width = 151
      Height = 15
      Caption = 'Sub folder search max depth'
    end
    object Label5: TLabel
      Left = 80
      Top = 99
      Width = 67
      Height = 15
      Caption = '0 - unlimited'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 128
      Top = 45
      Width = 62
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Bytes'
        'KB'
        'MB'
        'GB')
    end
    object Edit1: TEdit
      Left = 8
      Top = 45
      Width = 114
      Height = 23
      NumbersOnly = True
      TabOrder = 1
      Text = '1'
    end
    object Edit2: TEdit
      Left = 8
      Top = 95
      Width = 66
      Height = 23
      NumbersOnly = True
      TabOrder = 2
      Text = '0'
    end
    object ToggleSwitch1: TToggleSwitch
      Left = 8
      Top = 145
      Width = 73
      Height = 20
      TabOrder = 3
      ThumbWidth = 20
    end
    object ToggleSwitch2: TToggleSwitch
      Left = 8
      Top = 191
      Width = 73
      Height = 20
      TabOrder = 4
      ThumbWidth = 20
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 221
    Top = 132
    Width = 233
    Height = 72
    Caption = 'Search profiles'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -12
    CaptionFont.Name = 'Verdana'
    CaptionFont.Style = [fsBold]
    Color = 2829099
    GroupStyle = gsUnderline
    TabOrder = 2
    object Label8: TLabel
      Left = 8
      Top = 24
      Width = 220
      Height = 15
      Caption = 'Search profiles through desktop shortcuts'
    end
    object ToggleSwitch5: TToggleSwitch
      Left = 8
      Top = 45
      Width = 73
      Height = 20
      TabOrder = 0
      ThumbWidth = 20
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 221
    Top = 8
    Width = 233
    Height = 118
    Caption = 'Misc'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -12
    CaptionFont.Name = 'Verdana'
    CaptionFont.Style = [fsBold]
    Color = 2829099
    GroupStyle = gsUnderline
    TabOrder = 3
    object Label6: TLabel
      Left = 8
      Top = 24
      Width = 84
      Height = 15
      Caption = 'Show help hints'
    end
    object Label7: TLabel
      Left = 8
      Top = 74
      Width = 145
      Height = 15
      Caption = 'Show LOG (slow procesing)'
    end
    object ToggleSwitch3: TToggleSwitch
      Left = 8
      Top = 45
      Width = 73
      Height = 20
      TabOrder = 0
      ThumbWidth = 20
    end
    object ToggleSwitch4: TToggleSwitch
      Left = 8
      Top = 94
      Width = 73
      Height = 20
      TabOrder = 1
      ThumbWidth = 20
    end
  end
end
