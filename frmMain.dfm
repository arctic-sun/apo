object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Arctic Profile Optimizer'
  ClientHeight = 603
  ClientWidth = 1150
  Color = 14120960
  CustomTitleBar.CaptionAlignment = taCenter
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 45
  CustomTitleBar.ShowCaption = False
  CustomTitleBar.SystemColors = False
  CustomTitleBar.BackgroundColor = 14120960
  CustomTitleBar.ForegroundColor = clGray
  CustomTitleBar.InactiveBackgroundColor = 14120960
  CustomTitleBar.InactiveForegroundColor = 65793
  CustomTitleBar.ButtonForegroundColor = clGray
  CustomTitleBar.ButtonBackgroundColor = 14120960
  CustomTitleBar.ButtonHoverForegroundColor = clGray
  CustomTitleBar.ButtonHoverBackgroundColor = 11362304
  CustomTitleBar.ButtonPressedForegroundColor = clGray
  CustomTitleBar.ButtonPressedBackgroundColor = 7159040
  CustomTitleBar.ButtonInactiveForegroundColor = 65793
  CustomTitleBar.ButtonInactiveBackgroundColor = 14120960
  Constraints.MinHeight = 300
  Constraints.MinWidth = 1125
  DefaultMonitor = dmDesktop
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 45
  Position = poScreenCenter
  PrintScale = poPrintToFit
  ShowHint = True
  StyleElements = [seFont, seClient]
  OnAfterMonitorDpiChanged = FormAfterMonitorDpiChanged
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 25
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 569
    Width = 1150
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    SimpleFrameStyle = fsNone
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    Color = 2829099
    TabOrder = 0
    object RzStatusPane_AppVer: TRzStatusPane
      Left = 0
      Top = 0
      Width = 222
      Height = 34
      Hint = 'This application version'
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      FrameStyle = fsBump
      Align = alLeft
      Alignment = taCenter
      Caption = 'version 0.0.0'
      ExplicitLeft = 5
      ExplicitTop = 5
    end
    object RzStatusPane_SQLiteVer: TRzStatusPane
      Left = 236
      Top = 0
      Width = 222
      Height = 34
      Hint = 'Current sqlite3.dll version'
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      Caption = 'SQL v:'
      ExplicitLeft = 241
      ExplicitTop = 5
    end
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 227
      Top = 5
      Width = 4
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Shape = bsLeftLine
      ExplicitHeight = 25
    end
    object RzStatusPane3: TRzStatusPane
      Left = 483
      Top = 0
      Width = 667
      Height = 34
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Caption = ''
      ExplicitLeft = 488
      ExplicitTop = 5
    end
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 463
      Top = 5
      Width = 15
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 462
      ExplicitHeight = 25
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 1150
    Height = 44
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    OnPaint = TitleBarPanel1Paint
    CustomButtons = <>
    ExplicitTop = 3
    object MenuButton: TRzToolButton
      AlignWithMargins = True
      Left = 51
      Top = 5
      Width = 71
      Height = 34
      Margins.Left = 51
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      DropDownMenu = PopupMenu1
      Flat = False
      ImageIndex = 0
      Images = DataModule1.SVGIconVirtualImageList1
      ToolStyle = tsDropDown
      Align = alLeft
      OnMouseMove = MenuButtonMouseMove
      ExplicitHeight = 36
    end
    object SVGIconImage2: TSVGIconImage
      Left = 395
      Top = 23
      Width = 304
      Height = 11
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      AutoSize = False
      Center = False
      SVGText = 
        '<?xml version="1.0" encoding="UTF-8" standalone="no"?>'#13#10#13#10'<svg'#13#10 +
        '   width="64.881073mm"'#13#10'   height="2.4120102mm"'#13#10'   viewBox="0 0' +
        ' 64.881073 2.4120102"'#13#10'   version="1.1"'#13#10'   id="svg5"'#13#10'   xml:sp' +
        'ace="preserve"'#13#10'   xmlns="http://www.w3.org/2000/svg"'#13#10'   xmlns:' +
        'svg="http://www.w3.org/2000/svg"><defs'#13#10'     id="defs2" /><g'#13#10'  ' +
        '   id="layer1"'#13#10'     transform="translate(-19.028298,-100.37533)' +
        '"><g'#13#10'       aria-label="ARCTIC PROFILE OPTIMIZER"'#13#10'       id="t' +
        'ext236"'#13#10'       style="font-size:4.19646px;line-height:1.25;font' +
        '-family:Oxta;-inkscape-font-specification:'#39'Oxta, Normal'#39';fill:#f' +
        'fffff;stroke-width:0.104912"'#13#10'       transform="matrix(0.8061369' +
        '6,0,0,0.80613696,-16.565639,6.6507359)"><path'#13#10'         d="m 47.' +
        '09123,116.26385 h -2.350018 l -0.587504,0.5875 v 2.35002 h 0.587' +
        '504 v -2.05627 l 0.293752,-0.29375 h 1.762514 l 0.293752,0.29375' +
        ' v 0.29376 h -1.762513 v 0.5875 h 1.762513 v 1.17501 h 0.587504 ' +
        'v -2.35002 z"'#13#10'         id="path423"'#13#10'         style="fill:#ffff' +
        'ff" /><path'#13#10'         d="m 51.845819,116.85135 -0.587504,-0.5875' +
        ' h -2.937522 v 2.93752 h 0.587504 v -2.35002 h 2.056265 l 0.2937' +
        '53,0.29375 v 0.58751 l -0.650452,0.65045 0.822506,0.81831 h 0.41' +
        '545 v -0.41125 l -0.381878,-0.38188 0.381878,-0.38188 z"'#13#10'      ' +
        '   id="path425"'#13#10'         style="fill:#ffffff" /><path'#13#10'        ' +
        ' d="m 55.954153,116.85135 v -0.5875 h -3.525026 v 2.35002 l 0.58' +
        '7504,0.5875 h 2.937522 v -0.5875 h -2.643769 l -0.293753,-0.2937' +
        '6 v -1.46876 z"'#13#10'         id="path427"'#13#10'         style="fill:#ff' +
        'ffff" /><path'#13#10'         d="m 56.235317,116.26385 v 0.5875 h 1.46' +
        '8761 v 2.35002 h 0.587504 v -2.05627 l 0.293752,-0.29375 h 1.175' +
        '009 v -0.5875 z"'#13#10'         id="path429"'#13#10'         style="fill:#f' +
        'fffff" /><path'#13#10'         d="m 60.482138,116.26385 h -0.293752 v ' +
        '2.93752 h 0.587504 v -2.64377 z"'#13#10'         id="path431"'#13#10'       ' +
        '  style="fill:#ffffff" /><path'#13#10'         d="m 64.934582,116.8513' +
        '5 v -0.5875 h -3.525026 v 2.35002 l 0.587504,0.5875 h 2.937522 v' +
        ' -0.5875 h -2.64377 l -0.293752,-0.29376 v -1.46876 z"'#13#10'        ' +
        ' id="path433"'#13#10'         style="fill:#ffffff" /><path'#13#10'         d' +
        '="m 70.314449,116.26385 h -2.937522 v 2.93752 h 0.587504 v -2.35' +
        '002 h 2.056266 l 0.293752,0.29375 v 0.58751 l -0.293752,0.29375 ' +
        'h -1.468761 v 0.58751 h 1.762513 l 0.587504,-0.58751 v -1.17501 ' +
        'z"'#13#10'         id="path435"'#13#10'         style="fill:#ffffff" /><path' +
        #13#10'         d="m 74.972516,116.85135 -0.587505,-0.5875 h -2.93752' +
        '2 v 2.93752 h 0.587505 v -2.35002 h 2.056265 l 0.293752,0.29375 ' +
        'v 0.58751 l -0.650451,0.65045 0.822506,0.81831 h 0.41545 v -0.41' +
        '125 l -0.381878,-0.38188 0.381878,-0.38188 z"'#13#10'         id="path' +
        '437"'#13#10'         style="fill:#ffffff" /><path'#13#10'         d="m 78.49' +
        '3347,116.26385 h -2.937522 v 2.35002 l 0.587504,0.5875 h 2.93752' +
        '2 v -2.35002 z m 0,2.35002 h -2.056266 l -0.293752,-0.29376 v -1' +
        '.46876 h 2.056265 l 0.293753,0.29375 z"'#13#10'         id="path439"'#13#10 +
        '         style="fill:#ffffff" /><path'#13#10'         d="m 83.180791,1' +
        '16.85135 v -0.5875 h -3.525026 v 0.5875 z m -3.525026,2.35002 h ' +
        '0.587505 v -1.17501 h 2.350017 v -0.5875 h -2.937522 z"'#13#10'       ' +
        '  id="path441"'#13#10'         style="fill:#ffffff" /><path'#13#10'         ' +
        'd="m 83.873209,116.26385 h -0.293752 v 2.93752 h 0.587504 v -2.6' +
        '4377 z"'#13#10'         id="path443"'#13#10'         style="fill:#ffffff" />' +
        '<path'#13#10'         d="m 85.681888,118.61387 -0.293753,-0.29376 v -2' +
        '.05626 h -0.587504 v 2.35002 l 0.587504,0.5875 h 2.937522 v -0.5' +
        '875 z"'#13#10'         id="path445"'#13#10'         style="fill:#ffffff" /><' +
        'path'#13#10'         d="m 92.211576,116.85135 v -0.5875 H 88.68655 v 0' +
        '.5875 z m -2.937522,1.17501 h 2.350018 v -0.5875 H 88.68655 v 1.' +
        '76251 h 3.525026 v -0.5875 h -2.937522 z"'#13#10'         id="path447"' +
        #13#10'         style="fill:#ffffff" /><path'#13#10'         d="m 97.536889' +
        ',116.26385 h -2.937521 v 2.35002 l 0.587504,0.5875 h 2.937522 v ' +
        '-2.35002 z m 0,2.35002 h -2.056265 l -0.293752,-0.29376 v -1.468' +
        '76 h 2.056265 l 0.293752,0.29375 z"'#13#10'         id="path449"'#13#10'    ' +
        '     style="fill:#ffffff" /><path'#13#10'         d="m 101.70398,116.2' +
        '6385 h -2.937527 v 2.93752 h 0.587505 v -2.35002 h 2.056262 l 0.' +
        '29376,0.29375 v 0.58751 l -0.29376,0.29375 h -1.468758 v 0.58751' +
        ' h 1.762518 l 0.5875,-0.58751 v -1.17501 z"'#13#10'         id="path45' +
        '1"'#13#10'         style="fill:#ffffff" /><path'#13#10'         d="m 102.593' +
        '62,116.26385 v 0.5875 h 1.46876 v 2.35002 h 0.5875 v -2.05627 l ' +
        '0.29376,-0.29375 h 1.17501 v -0.5875 z"'#13#10'         id="path453"'#13#10 +
        '         style="fill:#ffffff" /><path'#13#10'         d="m 106.84044,1' +
        '16.26385 h -0.29375 v 2.93752 h 0.5875 v -2.64377 z"'#13#10'         i' +
        'd="path455"'#13#10'         style="fill:#ffffff" /><path'#13#10'         d="' +
        'm 107.78884,116.3184 v 2.93752 h 0.58751 v -2.35001 h 0.29375 l ' +
        '0.88125,0.88125 0.44063,-0.44062 -1.02813,-1.02814 z m 2.35002,0' +
        ' -0.14688,0.14688 0.44063,0.44063 h 0.29375 v 2.35001 h 0.58751 ' +
        'v -2.93752 z"'#13#10'         id="path457"'#13#10'         style="fill:#ffff' +
        'ff" /><path'#13#10'         d="m 112.27067,116.26385 h -0.29376 v 2.93' +
        '752 h 0.58751 v -2.64377 z"'#13#10'         id="path459"'#13#10'         sty' +
        'le="fill:#ffffff" /><path'#13#10'         d="m 115.98453,117.1451 -0.2' +
        '9375,0.29376 h -2.05627 l -0.29375,0.29375 0.44063,0.44063 0.146' +
        '87,-0.14688 h 2.05627 l 0.5875,-0.5875 v -1.17501 h -3.52502 v 0' +
        '.5875 h 2.93752 z m -2.93752,1.46877 0.58331,0.5875 h 2.94171 v ' +
        '-0.5875 z"'#13#10'         id="path461"'#13#10'         style="fill:#ffffff"' +
        ' /><path'#13#10'         d="m 120.61323,116.85135 v -0.5875 h -3.52502' +
        ' v 0.5875 z m -2.93752,1.17501 h 2.35002 v -0.5875 h -2.93752 v ' +
        '1.76251 h 3.52502 v -0.5875 h -2.93752 z"'#13#10'         id="path463"' +
        #13#10'         style="fill:#ffffff" /><path'#13#10'         d="m 124.63764' +
        ',116.85135 -0.58751,-0.5875 h -2.93752 v 2.93752 h 0.5875 v -2.3' +
        '5002 h 2.05627 l 0.29375,0.29375 v 0.58751 l -0.65045,0.65045 0.' +
        '82251,0.81831 h 0.41545 v -0.41125 l -0.38188,-0.38188 0.38188,-' +
        '0.38188 z"'#13#10'         id="path465"'#13#10'         style="fill:#ffffff"' +
        ' /></g></g></svg>'#13#10
      Stretch = False
      Visible = False
    end
    object RzPanel1: TRzPanel
      AlignWithMargins = True
      Left = 132
      Top = 5
      Width = 215
      Height = 34
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BorderOuter = fsNone
      BorderSides = []
      Color = 2829099
      TabOrder = 0
      Transparent = True
      VisualStyle = vsClassic
      object OptimizeBtn: TRzToolButton
        Left = 0
        Top = 0
        Width = 215
        Height = 34
        Hint = 'Start optimization for all checked profile(s)'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Flat = False
        ImageIndex = 4
        Images = DataModule1.SVGIconVirtualImageList1
        ShowCaption = True
        UseToolbarShowCaption = False
        Align = alClient
        Caption = 'Optimize profiles'
        Color = 2829099
        OnClick = OptimizeBtnClick
        ExplicitTop = -5
      end
    end
  end
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 44
    Width = 1150
    Height = 38
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    AutoStyle = False
    Images = DataModule1.SVGIconVirtualImageList1
    RowHeight = 42
    ButtonWidth = 38
    ButtonHeight = 38
    ShowButtonCaptions = True
    TextOptions = ttoCustom
    WrapControls = False
    AutoSize = True
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdRight]
    BorderWidth = 0
    Color = 2829099
    TabOrder = 3
    Transparent = True
    ToolbarControls = (
      MenuButton2
      RzLabel1
      OptimizeBtn2
      RzLabel2
      RzToolButton11
      RzLabel3
      RzToolButton4
      RzToolButton_OpenProfileDir2
      Copyprofiledirectorypath2
      RzLabel5
      Checkallprofiles2
      UnCheckallprofiles2
      RzLabel6
      RzToolButton10
      RzToolButton3
      RzToolButton5)
    object MenuButton2: TRzToolButton
      Left = 4
      Top = 0
      Width = 59
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      DropDownMenu = PopupMenu1
      ImageIndex = 0
      ToolStyle = tsDropDown
    end
    object OptimizeBtn2: TRzToolButton
      Left = 80
      Top = 0
      Width = 188
      Height = 38
      Hint = 'Start optimization for all checked profile(s)'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      GradientColorStyle = gcsSystem
      ImageIndex = 4
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarVisualStyle = False
      VisualStyle = vsWinXP
      Caption = 'Optimize profiles'
      Enabled = False
      OnClick = OptimizeBtnClick
    end
    object RzToolButton4: TRzToolButton
      Tag = 2
      Left = 340
      Top = 0
      Hint = 'Add new profile path...'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ImageIndex = 1
      OnClick = ActionsClickClick
    end
    object Checkallprofiles2: TRzToolButton
      Tag = 4
      Left = 471
      Top = 0
      Hint = 'Set check On for all profiles'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ImageIndex = 9
      OnClick = ActionsClickClick
    end
    object UnCheckallprofiles2: TRzToolButton
      Tag = 5
      Left = 509
      Top = 0
      Hint = 'Set check Off for all profiles'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ImageIndex = 10
      OnClick = ActionsClickClick
    end
    object RzToolButton_OpenProfileDir2: TRzToolButton
      Tag = 6
      Left = 378
      Top = 0
      Hint = 'Open profile directory in explorer'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ImageIndex = 13
      OnClick = ActionsClickClick
    end
    object Copyprofiledirectorypath2: TRzToolButton
      Tag = 7
      Left = 416
      Top = 0
      Hint = 'Copy profile path to clipboard'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ImageIndex = 14
      OnClick = ActionsClickClick
    end
    object RzToolButton10: TRzToolButton
      Tag = 8
      Left = 564
      Top = 0
      Hint = 'Settings'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ImageIndex = 3
      OnClick = ActionsClickClick
    end
    object RzToolButton11: TRzToolButton
      Tag = 1
      Left = 285
      Top = 0
      Hint = 'Search for existing profiles'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ImageIndex = 15
      OnClick = ActionsClickClick
    end
    object RzLabel1: TRzLabel
      AlignWithMargins = True
      Left = 65
      Top = 8
      Width = 13
      Height = 22
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      Alignment = taCenter
      Caption = #9474
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6052956
      Font.Height = -18
      Font.Name = 'Verdana'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object RzLabel2: TRzLabel
      AlignWithMargins = True
      Left = 270
      Top = 8
      Width = 13
      Height = 22
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      Alignment = taCenter
      Caption = #9474
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6052956
      Font.Height = -18
      Font.Name = 'Verdana'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object RzLabel5: TRzLabel
      AlignWithMargins = True
      Left = 456
      Top = 8
      Width = 13
      Height = 22
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      Alignment = taCenter
      Caption = #9474
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6052956
      Font.Height = -18
      Font.Name = 'Verdana'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object RzLabel6: TRzLabel
      AlignWithMargins = True
      Left = 549
      Top = 8
      Width = 13
      Height = 22
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      Alignment = taCenter
      Caption = #9474
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6052956
      Font.Height = -18
      Font.Name = 'Verdana'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object RzLabel3: TRzLabel
      AlignWithMargins = True
      Left = 325
      Top = 8
      Width = 13
      Height = 22
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      Alignment = taCenter
      Caption = #9474
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6052956
      Font.Height = -18
      Font.Name = 'Verdana'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object RzToolButton3: TRzToolButton
      Left = 602
      Top = 0
      Width = 59
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      DropDownMenu = PopupMenu3
      ImageIndex = 11
      ToolStyle = tsDropDown
      Visible = False
    end
    object RzToolButton5: TRzToolButton
      Left = 661
      Top = 0
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ImageIndex = 11
      Visible = False
    end
  end
  object RzSplitter1: TRzSplitter
    Left = 0
    Top = 82
    Width = 1150
    Height = 487
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Orientation = orVertical
    Position = 251
    Percent = 52
    UsePercent = True
    RealTimeDrag = True
    UpperLeft.Color = 2829099
    LowerRight.Color = 2829099
    SplitterStyle = ssGroupBar
    SplitterWidth = 9
    Align = alClient
    Color = 2829099
    TabOrder = 4
    BarSize = (
      0
      251
      1150
      260)
    UpperLeftControls = (
      VirtualStringTree1)
    LowerRightControls = (
      RzPanel2
      VirtualStringTree2)
    object VirtualStringTree1: TVirtualStringTree
      Left = 0
      Top = 0
      Width = 1150
      Height = 251
      Margins.Left = 2
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Colors.BorderColor = 2829099
      Colors.DisabledColor = clGray
      Colors.DropMarkColor = 13661955
      Colors.DropTargetColor = 13661955
      Colors.DropTargetBorderColor = 13661955
      Colors.FocusedSelectionColor = 13661955
      Colors.FocusedSelectionBorderColor = 13661955
      Colors.GridLineColor = 2829099
      Colors.HeaderHotColor = clWhite
      Colors.HotColor = 16628320
      Colors.SelectionRectangleBlendColor = 13661955
      Colors.SelectionRectangleBorderColor = 13661955
      Colors.SelectionTextColor = clWhite
      Colors.TreeLineColor = 9471874
      Colors.UnfocusedColor = clSilver
      Colors.UnfocusedSelectionColor = 2829099
      Colors.UnfocusedSelectionBorderColor = 2829099
      DefaultNodeHeight = 27
      Header.AutoSizeIndex = 0
      Header.Height = 29
      Header.MaxHeight = 15000
      Header.MinHeight = 15
      Header.Options = [hoColumnResize, hoDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoAutoSpring, hoFullRepaintOnResize]
      Header.PopupMenu = PopupMenu1
      Header.SplitterHitTolerance = 16
      HintMode = hmHintAndDefault
      Indent = 27
      LineStyle = lsSolid
      Margin = 6
      PopupMenu = PopupMenu1
      TabOrder = 0
      TextMargin = 6
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoHideButtons, toAutoChangeScale]
      TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
      TreeOptions.PaintOptions = [toHideFocusRect, toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseBlendedSelection]
      TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toRightClickSelect, toAlwaysSelectNode, toRestoreSelection]
      OnBeforeCellPaint = VirtualStringTree1BeforeCellPaint
      OnChecked = VirtualStringTree1Checked
      OnDrawText = VirtualStringTree1DrawText
      OnFreeNode = VirtualStringTree1FreeNode
      OnGetText = VirtualStringTree1GetText
      OnGetImageIndexEx = VirtualStringTree1GetImageIndexEx
      OnNodeClick = VirtualStringTree1NodeClick
      Touch.InteractiveGestures = [igPan, igPressAndTap]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
      Columns = <
        item
          Hint = 'Profile App\Path and settings for its optimization'
          MaxWidth = 15000
          MinWidth = 450
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coSmartResize, coAllowFocus, coEditable, coStyleColor]
          Position = 0
          Spacing = 5
          Text = 'Profile'
          Width = 500
        end
        item
          Alignment = taRightJustify
          CaptionAlignment = taRightJustify
          Hint = 'Number of files that have been optimized'
          MaxWidth = 15000
          MinWidth = 15
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
          Position = 1
          Spacing = 5
          Text = 'Files'
          Width = 105
        end
        item
          Alignment = taRightJustify
          CaptionAlignment = taRightJustify
          Hint = 'Size of all files before optimization'
          MaxWidth = 15000
          MinWidth = 15
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
          Position = 2
          Spacing = 5
          Text = 'Size before'
          Width = 210
        end
        item
          Alignment = taRightJustify
          CaptionAlignment = taRightJustify
          Hint = 'Size of all files after optimization'
          MaxWidth = 15000
          MinWidth = 15
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
          Position = 3
          Spacing = 5
          Text = 'Size after'
          Width = 210
        end
        item
          Alignment = taCenter
          CaptionAlignment = taCenter
          Hint = 'Rate of optimization efficiency'
          MaxWidth = 15000
          MinWidth = 15
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
          Position = 4
          Spacing = 5
          Text = 'Rate'
          Width = 120
        end>
    end
    object RzPanel2: TRzPanel
      Left = 0
      Top = 0
      Width = 1150
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Alignment = taLeftJustify
      BorderOuter = fsNone
      Caption = 'LOG'
      Color = 2829099
      TextMargin = 6
      Padding.Right = 9
      TabOrder = 0
      Transparent = True
      object RzToolButton1: TRzToolButton
        AlignWithMargins = True
        Left = 1044
        Top = 5
        Width = 92
        Height = 19
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ShowCaption = True
        UseToolbarShowCaption = False
        Align = alRight
        Caption = 'hide'
        OnClick = RzToolButton1Click
        ExplicitLeft = 1326
        ExplicitHeight = 28
      end
      object RzToolButton2: TRzToolButton
        AlignWithMargins = True
        Left = 959
        Top = 5
        Width = 75
        Height = 19
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ShowCaption = True
        UseToolbarShowCaption = False
        Align = alRight
        Caption = 'clear'
        OnClick = RzToolButton2Click
        ExplicitLeft = 1242
        ExplicitHeight = 28
      end
    end
    object VirtualStringTree2: TVirtualStringTree
      Left = 0
      Top = 29
      Width = 1150
      Height = 198
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Colors.BorderColor = 2829099
      Colors.DisabledColor = clGray
      Colors.DropMarkColor = 13661955
      Colors.DropTargetColor = 13661955
      Colors.DropTargetBorderColor = 13661955
      Colors.FocusedSelectionColor = 13661955
      Colors.FocusedSelectionBorderColor = 13661955
      Colors.GridLineColor = 2829099
      Colors.HeaderHotColor = clWhite
      Colors.HotColor = 16628320
      Colors.SelectionRectangleBlendColor = 13661955
      Colors.SelectionRectangleBorderColor = 13661955
      Colors.SelectionTextColor = clWhite
      Colors.TreeLineColor = 9471874
      Colors.UnfocusedColor = clSilver
      Colors.UnfocusedSelectionColor = 2829099
      Colors.UnfocusedSelectionBorderColor = 2829099
      DefaultNodeHeight = 27
      Header.AutoSizeIndex = 2
      Header.Height = 29
      Header.MaxHeight = 15000
      Header.MinHeight = 15
      Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
      Header.SplitterHitTolerance = 16
      Indent = 27
      LineStyle = lsSolid
      Margin = 6
      PopupMenu = PopupMenu2
      TabOrder = 1
      TextMargin = 6
      TreeOptions.PaintOptions = [toHideFocusRect, toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseBlendedSelection]
      TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toRightClickSelect, toAlwaysSelectNode, toRestoreSelection]
      OnFreeNode = VirtualStringTree2FreeNode
      OnGetText = VirtualStringTree2GetText
      Touch.InteractiveGestures = [igPan, igPressAndTap]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
      Columns = <
        item
          MaxWidth = 15000
          MinWidth = 300
          Position = 0
          Spacing = 5
          Text = 'process name'
          Width = 300
        end
        item
          MaxWidth = 15000
          MinWidth = 15
          Position = 1
          Spacing = 5
          Text = 'value'
          Width = 300
        end
        item
          MaxWidth = 15000
          MinWidth = 15
          Position = 2
          Spacing = 5
          Text = 'result'
          Width = 894
        end>
    end
  end
  object RzPanelProgress: TRzPanel
    Left = 398
    Top = 242
    Width = 538
    Height = 203
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Color = 2829099
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 2
    Transparent = True
    Visible = False
    object Label2: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 514
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Profile'
      ExplicitWidth = 50
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 83
      Width = 514
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Overall'
      ExplicitWidth = 55
    end
    object RzProgressBar1: TRzProgressBar
      Left = 7
      Top = 42
      Width = 524
      Height = 36
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BorderWidth = 0
      InteriorOffset = 0
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
      ExplicitLeft = 8
      ExplicitTop = 38
      ExplicitWidth = 523
    end
    object RzProgressBar2: TRzProgressBar
      Left = 7
      Top = 113
      Width = 524
      Height = 36
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BarColorStop = clHighlight
      BorderWidth = 0
      InteriorOffset = 0
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
      ExplicitTop = 103
    end
    object RzPanel3: TRzPanel
      AlignWithMargins = True
      Left = 7
      Top = 156
      Width = 523
      Height = 42
      Margins.Left = 0
      Margins.Top = 7
      Margins.Right = 1
      Margins.Bottom = 5
      Align = alTop
      BorderOuter = fsNone
      Color = 2829099
      TabOrder = 0
      Transparent = True
      object RzButton1: TRzButton
        Left = 410
        Top = 0
        Width = 113
        Height = 42
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 1
        Margins.Bottom = 5
        Align = alRight
        Caption = 'Cancel'
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.SVGIconVirtualImageList1
    OnPopup = PopupMenu1Popup
    Left = 136
    Top = 132
    object Optimizeselectedprofile1: TMenuItem
      Caption = 'Optimize this profile'
      ImageIndex = 4
      ImageName = 'icons8_flash_on'
      OnClick = Optimizeselectedprofile1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object ScannProfiles: TMenuItem
      Tag = 1
      Caption = 'Search for existing profiles'
      ImageIndex = 15
      ImageName = 'icons8_browse_folder'
      ShortCut = 116
      OnClick = ActionsClickClick
    end
    object CreateBATfile1: TMenuItem
      Tag = 10
      Caption = 'Generate .BAT script for checked profile(s)...'
      ImageIndex = 8
      ImageName = 'icons8_console_2'
      OnClick = ActionsClickClick
    end
    object aa1: TMenuItem
      Caption = '-'
    end
    object AddCustomProfileBtn: TMenuItem
      Tag = 2
      Caption = 'Add profile path...'
      ImageIndex = 1
      ImageName = 'icons8_add_folder'
      ShortCut = 16449
      OnClick = ActionsClickClick
    end
    object Edit1: TMenuItem
      Caption = 'Edit...'
      Visible = False
    end
    object DelCustomProfileBtn: TMenuItem
      Tag = 3
      Caption = 'Remove selected profile'
      ImageIndex = 2
      ImageName = 'icons8_delete_folder'
      ShortCut = 46
      OnClick = ActionsClickClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Checkallprofiles1: TMenuItem
      Tag = 4
      Caption = 'Check all profiles'
      ImageIndex = 9
      ImageName = 'icons8_Checked_Checkbox'
      ShortCut = 16471
      OnClick = ActionsClickClick
    end
    object UnCheckallprofiles1: TMenuItem
      Tag = 5
      Caption = 'UnCheck all profiles'
      ImageIndex = 10
      ImageName = 'icons8_Unchecked_Checkbox'
      ShortCut = 16453
      OnClick = ActionsClickClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Openprofiledirectory1: TMenuItem
      Tag = 6
      Caption = 'Open profile directory in Explorer'
      ImageIndex = 13
      ImageName = 'icons8_file_explorer'
      ShortCut = 16452
      OnClick = ActionsClickClick
    end
    object Copyprofiledirectorypath1: TMenuItem
      Tag = 7
      Caption = 'Copy profile path'
      ImageIndex = 14
      ImageName = 'icons8_symlink_directory_1'
      ShortCut = 16451
      OnClick = ActionsClickClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object SettingsBtn: TMenuItem
      Tag = 8
      Caption = 'Settings ...'
      ImageIndex = 3
      ImageName = 'icons8_settings_1'
      OnClick = ActionsClickClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object info1: TMenuItem
      Tag = 9
      Caption = 'Info...'
      ImageIndex = 12
      ImageName = 'icons8_fish_skeleton'
      OnClick = ActionsClickClick
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 136
    Top = 188
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 280
    Top = 449
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
    object Gotofile1: TMenuItem
      Caption = 'Goto file'
      OnClick = Gotofile1Click
    end
  end
  object FileSaveDialog1: TFileSaveDialog
    FavoriteLinks = <>
    FileName = 'D:\Projects\ArcticLIB\Compression'
    FileTypes = <
      item
        DisplayName = 'Bat file (*.bat)'
        FileMask = '*.bat'
      end
      item
        DisplayName = 'All files (*.*)'
        FileMask = '*.*'
      end>
    Options = []
    Left = 128
    Top = 265
  end
  object PopupMenu3: TPopupMenu
    Left = 572
    Top = 123
    object VST1: TMenuItem
      Caption = 'VST'
      OnClick = Act1Click
    end
    object Form1: TMenuItem
      Tag = 1
      Caption = 'Form'
      OnClick = Act1Click
    end
    object WhiteSkin1: TMenuItem
      Tag = 2
      Caption = 'WhiteSkin'
      OnClick = Act1Click
    end
    object BlackSkin1: TMenuItem
      Tag = 3
      Caption = 'BlackSkin'
      OnClick = Act1Click
    end
  end
  object DirtyHackDPiTimer1: TTimer
    Enabled = False
    OnTimer = DirtyHackDPiTimer1Timer
    Left = 748
    Top = 143
  end
  object Timer1: TTimer
    Left = 340
    Top = 147
  end
end
