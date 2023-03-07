object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Arctic Profile Optimizer'
  ClientHeight = 737
  ClientWidth = 1473
  Color = 14120960
  CustomTitleBar.CaptionAlignment = taCenter
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
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  ShowHint = True
  OnAfterMonitorDpiChanged = FormAfterMonitorDpiChanged
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 25
  object RzSplitter1: TRzSplitter
    Left = 0
    Top = 111
    Width = 1473
    Height = 591
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Orientation = orVertical
    Position = 305
    Percent = 52
    UsePercent = True
    RealTimeDrag = True
    UpperLeft.Color = 2829099
    LowerRight.Color = 2829099
    SplitterStyle = ssGroupBar
    SplitterWidth = 9
    Align = alClient
    Color = 2829099
    TabOrder = 1
    ExplicitWidth = 1463
    ExplicitHeight = 589
    BarSize = (
      0
      305
      1473
      314)
    UpperLeftControls = (
      VirtualStringTree1)
    LowerRightControls = (
      RzPanel2
      VirtualStringTree2)
    object VirtualStringTree1: TVirtualStringTree
      Left = 0
      Top = 0
      Width = 1473
      Height = 305
      Hint = '?'
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
      Colors.GridLineColor = 13684944
      Colors.HeaderHotColor = clWhite
      Colors.HotColor = 16628320
      Colors.SelectionRectangleBlendColor = 13661955
      Colors.SelectionRectangleBorderColor = 13661955
      Colors.SelectionTextColor = clWhite
      Colors.TreeLineColor = 9471874
      Colors.UnfocusedColor = 14606046
      Colors.UnfocusedSelectionColor = 11963734
      Colors.UnfocusedSelectionBorderColor = 11579568
      DefaultNodeHeight = 27
      DragOperations = []
      Header.AutoSizeIndex = 0
      Header.Height = 34
      Header.MaxHeight = 100
      Header.MinHeight = 19
      Header.Options = [hoColumnResize, hoDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoAutoSpring, hoFullRepaintOnResize]
      Header.SplitterHitTolerance = 16
      HintMode = hmTooltip
      Indent = 27
      LineStyle = lsSolid
      Margin = 6
      PopupMenu = PopupActionBar1
      TabOrder = 0
      TextMargin = 6
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoHideButtons, toAutoChangeScale]
      TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
      TreeOptions.PaintOptions = [toHideFocusRect, toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseBlendedSelection]
      TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toRightClickSelect, toAlwaysSelectNode, toRestoreSelection]
      OnBeforeCellPaint = VirtualStringTree1BeforeCellPaint
      OnChecked = VirtualStringTree1Checked
      OnDragOver = VirtualStringTree1DragOver
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
          Width = 538
        end
        item
          Alignment = taRightJustify
          CaptionAlignment = taRightJustify
          Hint = 'Total SQLite files found \ Total SQLite files optimized'
          MaxWidth = 15000
          MinWidth = 105
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coSmartResize, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
          Position = 1
          Spacing = 5
          Text = 'Files f\o'
          Width = 188
        end
        item
          Alignment = taRightJustify
          CaptionAlignment = taRightJustify
          Hint = 'SQLite files size before optimization'
          MaxWidth = 15000
          MinWidth = 210
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coSmartResize, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
          Position = 2
          Spacing = 5
          Text = 'Size before'
          Width = 210
        end
        item
          Alignment = taRightJustify
          CaptionAlignment = taRightJustify
          Hint = 'SQLite files size after optimization'
          MaxWidth = 15000
          MinWidth = 210
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coSmartResize, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
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
          MinWidth = 120
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coSmartResize, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
          Position = 4
          Spacing = 5
          Text = 'Rate'
          Width = 120
        end
        item
          Hint = 'Last optimization date'
          MinWidth = 150
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coSmartResize, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
          Position = 5
          Text = 'Optimized'
          Width = 150
        end>
    end
    object RzPanel2: TRzPanel
      Left = 0
      Top = 0
      Width = 1473
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
      ExplicitWidth = 1463
      object RzToolButton1: TRzToolButton
        AlignWithMargins = True
        Left = 1367
        Top = 2
        Width = 92
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        ShowCaption = True
        UseToolbarShowCaption = False
        Align = alRight
        Caption = 'hide'
        OnClick = RzToolButton1Click
        ExplicitTop = -2
      end
      object RzToolButton2: TRzToolButton
        AlignWithMargins = True
        Left = 1282
        Top = 2
        Width = 75
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 2
        ShowCaption = True
        UseToolbarShowCaption = False
        Align = alRight
        Caption = 'clear'
        OnClick = RzToolButton2Click
        ExplicitLeft = 1242
        ExplicitTop = 5
        ExplicitHeight = 28
      end
    end
    object VirtualStringTree2: TVirtualStringTree
      Left = 0
      Top = 29
      Width = 1473
      Height = 248
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
      Header.Height = 34
      Header.MaxHeight = 15000
      Header.MinHeight = 15
      Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
      Header.SplitterHitTolerance = 16
      Indent = 27
      LineStyle = lsSolid
      Margin = 6
      PopupMenu = PopupActionBar2
      TabOrder = 1
      TextMargin = 6
      TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
      TreeOptions.PaintOptions = [toHideFocusRect, toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseBlendedSelection]
      TreeOptions.SelectionOptions = [toExtendedFocus, toFullRowSelect, toRightClickSelect, toAlwaysSelectNode, toRestoreSelection]
      OnDragOver = VirtualStringTree1DragOver
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
    Left = 463
    Top = 242
    Width = 534
    Height = 218
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Color = 2829099
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    Transparent = True
    Visible = False
    object Label2: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 510
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
      Top = 93
      Width = 510
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
      AlignWithMargins = True
      Left = 12
      Top = 47
      Width = 510
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
      ExplicitLeft = 10
      ExplicitTop = 45
      ExplicitWidth = 263
    end
    object RzProgressBar2: TRzProgressBar
      AlignWithMargins = True
      Left = 12
      Top = 128
      Width = 510
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
      ExplicitLeft = 10
      ExplicitTop = 126
      ExplicitWidth = 263
    end
    object RzPanelProgressBtnPanel: TRzPanel
      AlignWithMargins = True
      Left = 12
      Top = 176
      Width = 510
      Height = 34
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BorderOuter = fsNone
      Color = 2829099
      TabOrder = 0
      Transparent = True
      object RzButton1: TRzButton
        Left = 295
        Top = 0
        Width = 215
        Height = 34
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
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 702
    Width = 1473
    Height = 35
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
    TabOrder = 2
    ExplicitTop = 700
    ExplicitWidth = 1463
    object RzStatusPane_AppVer: TRzStatusPane
      Left = 0
      Top = 0
      Width = 222
      Height = 35
      Hint = 'This application version'
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      FrameStyle = fsBump
      Align = alLeft
      Alignment = taCenter
      Caption = 'version 0.0.0'
      ExplicitTop = -5
      ExplicitHeight = 34
    end
    object RzStatusPane_SQLiteVer: TRzStatusPane
      Left = 236
      Top = 0
      Width = 222
      Height = 35
      Hint = 'Current sqlite3.dll version'
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      Caption = 'SQL v:'
      ExplicitTop = -5
      ExplicitHeight = 34
    end
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 227
      Top = 5
      Width = 4
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Shape = bsLeftLine
    end
    object RzStatusPane3: TRzStatusPane
      Left = 483
      Top = 0
      Width = 990
      Height = 35
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Caption = ''
      ExplicitLeft = 488
    end
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 463
      Top = 5
      Width = 15
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 462
    end
  end
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 1473
    Height = 39
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    UseSystemFont = False
    ActionManager = ActionManager1
    AllowHiding = True
    Caption = 'ActionMainMenuBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 10461087
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    Spacing = 0
    ExplicitWidth = 1463
  end
  object ActionToolBar2: TActionToolBar
    Left = 0
    Top = 39
    Width = 1473
    Height = 72
    Margins.Left = 0
    Margins.Top = 7
    Margins.Right = 0
    Margins.Bottom = 0
    ActionManager = ActionManager2
    Caption = 'ActionToolBar2'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 10461087
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    EdgeBorders = [ebTop]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Spacing = 0
    ExplicitWidth = 1463
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 136
    Top = 188
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
    Left = 1304
    Top = 171
  end
  object DirtyHackDPiTimer1: TTimer
    Enabled = False
    OnTimer = DirtyHackDPiTimer1Timer
    Left = 880
    Top = 191
  end
  object RzFormState1: TRzFormState
    Section = 'mainwnd'
    RegIniFile = RzRegIniFile1
    Left = 400
    Top = 508
  end
  object RzRegIniFile1: TRzRegIniFile
    Left = 584
    Top = 508
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = Action27
            CommandStyle = csSeparator
            CommandProperties.Width = -1
            CommandProperties.Font.Charset = DEFAULT_CHARSET
            CommandProperties.Font.Color = clWindowText
            CommandProperties.Font.Height = -18
            CommandProperties.Font.Name = 'Segoe UI'
            CommandProperties.Font.Style = []
            CommandProperties.ParentFont = False
          end
          item
            ContextItems.CaptionOptions = coNone
            ContextItems = <>
            Items = <
              item
                Action = Action6
                Caption = '&Open setting directory in Explorer'
                ImageIndex = 16
                ImageName = 'icons8_adventure'
              end
              item
                Action = Action24
                Caption = '&Generate .BAT script for checked profiles(s)...'
                ImageIndex = 8
                ImageName = 'icons8_console_2'
              end
              item
                Caption = '-'
              end
              item
                Action = Action7
                Caption = '&Exit'
              end>
            Action = Action1
            Caption = '&File'
          end
          item
            Action = Action26
          end
          item
            ContextItems.CaptionOptions = coNone
            ContextItems = <>
            Items = <
              item
                Action = Action8
                Caption = '&Add new profile path...'
                ImageIndex = 3
                ImageName = 'icons8_add_folder'
              end
              item
                Action = Action9
                Caption = '&Edit selected...'
                ImageIndex = 4
                ImageName = 'f3'
              end
              item
                Action = Action10
                Caption = '&Delete selected'
                ImageIndex = 5
                ImageName = 'icons8_delete_folder'
              end
              item
                Caption = '-'
              end
              item
                Action = Action11
                Caption = '&Check all'
                ImageIndex = 6
                ImageName = 'icons8_Checked_Checkbox_1'
              end
              item
                Action = Action12
                Caption = '&UnCheck all'
                ImageIndex = 7
                ImageName = 'icons8_Unchecked_Checkbox_1'
              end
              item
                Caption = '-'
              end
              item
                Action = Action13
                Caption = '&Make selected profile Invisible'
                ImageIndex = 15
                ImageName = 'icons8_hide'
              end
              item
                Action = Action14
                Caption = 'Ma&ke selected profile Visible'
                ImageIndex = 14
                ImageName = 'icons8_eye'
              end>
            Action = Action2
            Caption = '&Edit'
          end
          item
            Action = Action26
          end
          item
            ContextItems.CaptionOptions = coNone
            ContextItems = <>
            Items = <
              item
                Action = Action15
                Caption = '&Reload profiles'
                ImageIndex = 2
                ImageName = 'icons8_find_and_replace'
              end
              item
                Caption = '-'
              end
              item
                Action = Action16
                Caption = '&Full Optimization'
                ImageIndex = 0
                ImageName = 'Page 9'
              end
              item
                Action = Action47
                Caption = 'Fa&st Optimization'
                ImageIndex = 20
                ImageName = 'fxxc1'
              end
              item
                Caption = '-'
              end
              item
                Action = Action35
                Caption = 'F&ull Optimization (selected profile)'
                ImageIndex = 1
                ImageName = 'f2'
              end
              item
                Action = Action17
                Caption = 'F&ast Optimization (selected profile)'
                ImageIndex = 19
                ImageName = 'ret1'
              end
              item
                Caption = '-'
              end
              item
                Action = Action18
                Caption = 'Op&en profile directory in Explorer'
                ImageIndex = 12
                ImageName = 'icons8_symlink_directory_1'
              end
              item
                Action = Action19
                Caption = '&Copy profile directory to Clipboard'
                ImageIndex = 17
                ImageName = 'icons8_file_submodule'
              end>
            Action = Action3
            Caption = '&Profiles'
          end
          item
            Action = Action26
          end
          item
            ContextItems.CaptionOptions = coNone
            ContextItems = <>
            Items = <
              item
                Action = Action20
                Caption = '&Show toolbar'
              end
              item
                Action = Action21
                Caption = 'S&how log panel'
              end
              item
                Action = Action22
                Caption = 'Sh&ow non existing profiles'
              end
              item
                Action = Action23
                Caption = 'Sho&w profiles hidden by user'
              end>
            Action = Action4
            Caption = '&View'
          end
          item
            Action = Action26
          end
          item
            ContextItems.CaptionOptions = coNone
            ContextItems = <>
            Action = Action5
            Caption = '&Settings'
            ImageIndex = 9
            ImageName = 'icons8_settings_1'
          end
          item
            Action = Action26
            CommandStyle = csSeparator
            CommandProperties.Width = -1
            CommandProperties.Font.Charset = DEFAULT_CHARSET
            CommandProperties.Font.Color = clWindowText
            CommandProperties.Font.Height = -18
            CommandProperties.Font.Name = 'Segoe UI'
            CommandProperties.Font.Style = []
            CommandProperties.ParentFont = False
          end
          item
            Action = Action25
            Caption = ' &info'
            ImageIndex = 13
            ImageName = 'icons8_fish_skeleton'
          end>
        ActionBar = ActionMainMenuBar1
      end
      item
        Items.CaptionOptions = coAll
        Items = <
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end
          item
            Caption = '-'
          end>
        GlyphLayout = blGlyphTop
      end>
    LargeImages = DataModule1.SVGIconVirtualImageList4
    Images = DataModule1.SVGIconVirtualImageList4
    Left = 1100
    Top = 188
    StyleName = 'Platform Default'
    object Action1: TAction
      Category = 'top'
      Caption = 'File'
      OnExecute = AllActionExecute
    end
    object Action2: TAction
      Category = 'top'
      Caption = 'Edit'
      OnExecute = AllActionExecute
    end
    object Action3: TAction
      Category = 'top'
      Caption = 'Profiles'
      OnExecute = AllActionExecute
    end
    object Action4: TAction
      Category = 'top'
      Caption = 'View'
      OnExecute = AllActionExecute
    end
    object Action5: TAction
      Tag = 99
      Category = 'top'
      Caption = 'Settings'
      ImageIndex = 9
      ImageName = 'icons8_settings_1'
      OnExecute = AllActionExecute
    end
    object Action6: TAction
      Tag = 22
      Category = 'File'
      Caption = 'Open setting directory in Explorer'
      ImageIndex = 16
      ImageName = 'icons8_adventure'
      OnExecute = AllActionExecute
    end
    object Action24: TAction
      Tag = 5
      Category = 'File'
      Caption = 'Generate .BAT script for checked profiles(s)...'
      ImageIndex = 8
      ImageName = 'icons8_console_2'
      OnExecute = AllActionExecute
    end
    object Action7: TAction
      Tag = 1
      Category = 'File'
      Caption = 'Exit'
      OnExecute = AllActionExecute
    end
    object Action8: TAction
      Tag = 10
      Category = 'Edit'
      Caption = 'Add new profile path...'
      ImageIndex = 3
      ImageName = 'icons8_add_folder'
      OnExecute = AllActionExecute
    end
    object Action9: TAction
      Tag = 8
      Category = 'Edit'
      Caption = 'Edit selected...'
      ImageIndex = 4
      ImageName = 'f3'
      OnExecute = AllActionExecute
    end
    object Action10: TAction
      Tag = 9
      Category = 'Edit'
      Caption = 'Delete selected'
      ImageIndex = 5
      ImageName = 'icons8_delete_folder'
      OnExecute = AllActionExecute
    end
    object Action11: TAction
      Tag = 14
      Category = 'Edit'
      Caption = 'Check all'
      ImageIndex = 6
      ImageName = 'icons8_Checked_Checkbox_1'
      OnExecute = AllActionExecute
    end
    object Action12: TAction
      Tag = 15
      Category = 'Edit'
      Caption = 'UnCheck all'
      ImageIndex = 7
      ImageName = 'icons8_Unchecked_Checkbox_1'
      OnExecute = AllActionExecute
    end
    object Action13: TAction
      Tag = 16
      Category = 'Edit'
      Caption = 'Make selected profile Invisible'
      ImageIndex = 15
      ImageName = 'icons8_hide'
      OnExecute = AllActionExecute
    end
    object Action14: TAction
      Tag = 17
      Category = 'Edit'
      Caption = 'Make selected profile Visible'
      ImageIndex = 14
      ImageName = 'icons8_eye'
      OnExecute = AllActionExecute
    end
    object Action15: TAction
      Tag = 13
      Category = 'Profiles'
      Caption = 'Reload profiles'
      ImageIndex = 2
      ImageName = 'icons8_find_and_replace'
      OnExecute = AllActionExecute
    end
    object Action16: TAction
      Tag = 23
      Category = 'Profiles'
      Caption = 'Full Optimization'
      ImageIndex = 0
      ImageName = 'Page 9'
      OnExecute = AllActionExecute
    end
    object Action47: TAction
      Tag = 24
      Category = 'Profiles'
      Caption = 'Fast Optimization'
      ImageIndex = 20
      ImageName = 'fxxc1'
      OnExecute = AllActionExecute
    end
    object Action35: TAction
      Tag = 25
      Category = 'Profiles'
      Caption = 'Full Optimization (selected profile)'
      ImageIndex = 1
      ImageName = 'f2'
      OnExecute = AllActionExecute
    end
    object Action17: TAction
      Tag = 26
      Category = 'Profiles'
      Caption = 'Fast Optimization (selected profile)'
      ImageIndex = 19
      ImageName = 'ret1'
      OnExecute = AllActionExecute
    end
    object Action18: TAction
      Tag = 6
      Category = 'Profiles'
      Caption = 'Open profile directory in Explorer'
      ImageIndex = 12
      ImageName = 'icons8_symlink_directory_1'
      OnExecute = AllActionExecute
    end
    object Action19: TAction
      Tag = 7
      Category = 'Profiles'
      Caption = 'Copy profile directory to Clipboard'
      ImageIndex = 17
      ImageName = 'icons8_file_submodule'
      OnExecute = AllActionExecute
    end
    object Action20: TAction
      Tag = 18
      Category = 'View'
      Caption = 'Show toolbar'
      GroupIndex = 1
      OnExecute = AllActionExecute
    end
    object Action21: TAction
      Tag = 19
      Category = 'View'
      Caption = 'Show log panel'
      GroupIndex = 2
      OnExecute = AllActionExecute
    end
    object Action22: TAction
      Tag = 20
      Category = 'View'
      Caption = 'Show non existing profiles'
      GroupIndex = 3
      OnExecute = AllActionExecute
    end
    object Action23: TAction
      Tag = 21
      Category = 'View'
      Caption = 'Show profiles hidden by user'
      GroupIndex = 4
      OnExecute = AllActionExecute
    end
    object AllAction: TAction
      Caption = 'AllAction'
      OnExecute = AllActionExecute
    end
    object Action25: TAction
      Tag = 114
      Category = 'top'
      Caption = ' info'
      ImageIndex = 13
      ImageName = 'icons8_fish_skeleton'
      OnExecute = AllActionExecute
    end
    object Action26: TAction
      Category = 'top'
      Caption = '|'
    end
    object Action27: TAction
      Category = 'top'
      Caption = '::'
    end
    object Action28: TAction
      Category = 'Log'
      Caption = 'Copy to clipboard'
      OnExecute = Copy1Click
      OnUpdate = Action28Update
    end
    object Action29: TAction
      Category = 'Log'
      Caption = 'Goto file'
      OnExecute = Gotofile1Click
      OnUpdate = Action29Update
    end
    object Action30: TAction
      Category = 'top'
      Caption = 'Optimize'
      OnExecute = Action30Execute
    end
  end
  object PopupActionBar1: TPopupActionBar
    Images = DataModule1.SVGIconVirtualImageList4
    Left = 128
    Top = 345
    object Fil1: TMenuItem
      Action = Action35
    end
    object Optimizeselectedprofile2: TMenuItem
      Action = Action17
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object OpenprofiledirectoryinExplorer1: TMenuItem
      Action = Action18
    end
    object CopyprofiledirectorytoClipboard1: TMenuItem
      Action = Action19
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Addnewprofilepath1: TMenuItem
      Action = Action8
    end
    object edit2: TMenuItem
      Action = Action9
    end
    object Deleteselected1: TMenuItem
      Action = Action10
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object MakeselectedprofileInvisible1: TMenuItem
      Action = Action13
    end
    object MakeselectedprofileVisible1: TMenuItem
      Action = Action14
    end
  end
  object ActionManager2: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = Action31
                Caption = '&Full Optimization (selected profile)'
                ImageIndex = 1
                ImageName = 'f2'
              end>
            Action = Action36
            Caption = '&full'
            CommandStyle = csComboBox
            ImageIndex = 0
            ImageName = 'Page 9'
            CommandProperties.Width = -1
          end
          item
            Items = <
              item
                Action = Action32
                Caption = '&Fast Optimization (selected profile)'
                ImageIndex = 17
                ImageName = 'ret1'
              end>
            Action = Action37
            Caption = 'fa&st'
            CommandStyle = csComboBox
            ImageIndex = 18
            ImageName = 'fxxc1'
            CommandProperties.Width = -1
          end
          item
            Caption = '-'
          end
          item
            Action = Action38
            Caption = '&reload'
            ImageIndex = 2
            ImageName = 'icons8_find_and_replace'
          end
          item
            Caption = '-'
          end
          item
            Action = Action39
            Caption = '&add'
            ImageIndex = 3
            ImageName = 'icons8_add_folder'
          end
          item
            Action = Action40
            Caption = '&edit'
            ImageIndex = 4
            ImageName = 'f3'
          end
          item
            Action = Action41
            Caption = '&delete'
            ImageIndex = 5
            ImageName = 'icons8_delete_folder'
          end
          item
            Caption = '-'
          end
          item
            Action = Action44
            Caption = 'c&opy'
            ImageIndex = 13
            ImageName = 'icons8_file_submodule'
          end
          item
            Action = Action45
            Caption = 'o&pen'
            ImageIndex = 12
            ImageName = 'icons8_symlink_directory_1'
          end
          item
            Caption = '-'
          end
          item
            Action = Action42
            Caption = 'c&heck'
            ImageIndex = 6
            ImageName = 'icons8_Checked_Checkbox_1'
          end
          item
            Action = Action43
            Caption = '&uncheck'
            ImageIndex = 7
            ImageName = 'icons8_Unchecked_Checkbox_1'
          end>
        ActionBar = ActionToolBar2
        GlyphLayout = blGlyphTop
      end>
    LargeImages = DataModule1.SVGIconVirtualImageList5
    Images = DataModule1.SVGIconVirtualImageList5
    Left = 1108
    Top = 289
    StyleName = 'Platform Default'
    object Action36: TAction
      Tag = 23
      Caption = 'full'
      Hint = 'Full optimization for checked profiles'
      ImageIndex = 0
      ImageName = 'Page 9'
      OnExecute = AllActionExecute
    end
    object Action37: TAction
      Tag = 24
      Caption = 'fast'
      Hint = 'Fast optimization for checked profiles'
      ImageIndex = 17
      ImageName = 'ret1'
      OnExecute = AllActionExecute
    end
    object Action38: TAction
      Tag = 13
      Caption = 'reload'
      Hint = 'Reload profiles'
      ImageIndex = 2
      ImageName = 'icons8_find_and_replace'
      OnExecute = AllActionExecute
    end
    object Action39: TAction
      Tag = 10
      Caption = 'add'
      Hint = 'Add new profile'
      ImageIndex = 3
      ImageName = 'icons8_add_folder'
      OnExecute = AllActionExecute
    end
    object Action40: TAction
      Tag = 8
      Caption = 'edit'
      Hint = 'Edit selected profile'
      ImageIndex = 4
      ImageName = 'f3'
      OnExecute = AllActionExecute
    end
    object Action41: TAction
      Tag = 9
      Caption = 'delete'
      Hint = 'Delete selected profile'
      ImageIndex = 5
      ImageName = 'icons8_delete_folder'
      OnExecute = AllActionExecute
    end
    object Action42: TAction
      Tag = 14
      Caption = 'check'
      Hint = 'Set all checked'
      ImageIndex = 6
      ImageName = 'icons8_Checked_Checkbox_1'
      OnExecute = AllActionExecute
    end
    object Action43: TAction
      Tag = 15
      Caption = 'uncheck'
      Hint = 'Set all unchecked'
      ImageIndex = 7
      ImageName = 'icons8_Unchecked_Checkbox_1'
      OnExecute = AllActionExecute
    end
    object Action44: TAction
      Tag = 7
      Caption = 'copy'
      Hint = 'Copy profile directory to Clipboard'
      ImageIndex = 13
      ImageName = 'icons8_file_submodule'
      OnExecute = AllActionExecute
    end
    object Action45: TAction
      Tag = 6
      Caption = 'open'
      Hint = 'Open profile directory in Explorer'
      ImageIndex = 12
      ImageName = 'icons8_symlink_directory_1'
      OnExecute = AllActionExecute
    end
    object Action46: TAction
      Tag = 99
      Caption = 'settings'
      ImageIndex = 9
      ImageName = 'icons8_settings_1'
      OnExecute = AllActionExecute
    end
    object Action31: TAction
      Tag = 25
      Caption = 'Full Optimization (selected profile)'
      ImageIndex = 1
      ImageName = 'f2'
      OnExecute = AllActionExecute
    end
    object Action32: TAction
      Tag = 26
      Caption = 'Fast Optimization (selected profile)'
      ImageIndex = 17
      ImageName = 'ret1'
      OnExecute = AllActionExecute
    end
  end
  object PopupActionBar2: TPopupActionBar
    OnPopup = PopupActionBar2Popup
    Left = 1268
    Top = 537
    object Copytoclipboard1: TMenuItem
      Action = Action28
    end
    object Gotofile2: TMenuItem
      Action = Action29
    end
  end
end
