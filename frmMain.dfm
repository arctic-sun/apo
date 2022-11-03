object FormMain: TFormMain
  Left = 0
  Top = 0
  ClientHeight = 603
  ClientWidth = 1150
  Color = 14120960
  CustomTitleBar.CaptionAlignment = taCenter
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 45
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
  Font.Name = 'Verdana'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 45
  Position = poDesktopCenter
  PrintScale = poPrintToFit
  ShowHint = True
  StyleElements = [seFont, seClient]
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 22
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
      ExplicitHeight = 35
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
      ExplicitHeight = 35
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
      ExplicitLeft = 482
      ExplicitWidth = 949
      ExplicitHeight = 35
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
      Images = DataModule1.SVGIconImageList1
      ToolStyle = tsDropDown
      Align = alLeft
      OnMouseMove = MenuButtonMouseMove
      ExplicitHeight = 36
    end
    object Image1: TImage
      Left = 462
      Top = 11
      Width = 474
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Center = True
      Picture.Data = {
        0B5453564747726170686963851600003C3F786D6C2076657273696F6E3D2231
        2E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D
        226E6F223F3E0A3C212D2D2043726561746564207769746820496E6B73636170
        652028687474703A2F2F7777772E696E6B73636170652E6F72672F29202D2D3E
        0A0A3C7376670A20202077696474683D2238302E3438333933326D6D220A2020
        206865696768743D22322E393932303733316D6D220A20202076696577426F78
        3D223020302038302E34383339333220322E39393230373331220A2020207665
        7273696F6E3D22312E31220A20202069643D2273766735220A202020786D6C6E
        733D22687474703A2F2F7777772E77332E6F72672F323030302F737667220A20
        2020786D6C6E733A7376673D22687474703A2F2F7777772E77332E6F72672F32
        3030302F737667223E0A20203C646566730A202020202069643D226465667332
        22202F3E0A20203C670A202020202069643D226C6179657231220A2020202020
        7472616E73666F726D3D227472616E736C617465282D34342E3135333730372C
        2D3131362E323633383429223E0A202020203C670A2020202020202061726961
        2D6C6162656C3D224152435449432050524F46494C45204F5054494D495A4552
        220A2020202020202069643D2274657874323336220A20202020202020737479
        6C653D22666F6E742D73697A653A342E313936343670783B6C696E652D686569
        6768743A312E32353B666F6E742D66616D696C793A4F7874613B2D696E6B7363
        6170652D666F6E742D73706563696669636174696F6E3A274F7874612C204E6F
        726D616C273B66696C6C3A236666666666663B7374726F6B652D77696474683A
        302E313034393132223E0A2020202020203C706174680A202020202020202020
        643D226D2034372E30393132332C3131362E32363338352068202D322E333530
        303138206C202D302E3538373530342C302E35383735207620322E3335303032
        206820302E3538373530342076202D322E3035363237206C20302E3239333735
        322C2D302E3239333735206820312E373632353134206C20302E323933373532
        2C302E3239333735207620302E32393337362068202D312E3736323531332076
        20302E35383735206820312E373632353133207620312E313735303120682030
        2E3538373530342076202D322E3335303032207A220A20202020202020202069
        643D2270617468343233220A2020202020202020207374796C653D2266696C6C
        3A2366666666666622202F3E0A2020202020203C706174680A20202020202020
        2020643D226D2035312E3834353831392C3131362E3835313335202D302E3538
        373530342C2D302E353837352068202D322E393337353232207620322E393337
        3532206820302E3538373530342076202D322E3335303032206820322E303536
        323635206C20302E3239333735332C302E3239333735207620302E3538373531
        206C202D302E3635303435322C302E363530343520302E3832323530362C302E
        3831383331206820302E34313534352076202D302E3431313235206C202D302E
        3338313837382C2D302E333831383820302E3338313837382C2D302E33383138
        38207A220A20202020202020202069643D2270617468343235220A2020202020
        202020207374796C653D2266696C6C3A2366666666666622202F3E0A20202020
        20203C706174680A202020202020202020643D226D2035352E3935343135332C
        3131362E38353133352076202D302E353837352068202D332E35323530323620
        7620322E3335303032206C20302E3538373530342C302E35383735206820322E
        3933373532322076202D302E353837352068202D322E363433373639206C202D
        302E3239333735332C2D302E32393337362076202D312E3436383736207A220A
        20202020202020202069643D2270617468343237220A20202020202020202073
        74796C653D2266696C6C3A2366666666666622202F3E0A2020202020203C7061
        74680A202020202020202020643D226D2035362E3233353331372C3131362E32
        36333835207620302E35383735206820312E343638373631207620322E333530
        3032206820302E3538373530342076202D322E3035363237206C20302E323933
        3735322C2D302E3239333735206820312E3137353030392076202D302E353837
        35207A220A20202020202020202069643D2270617468343239220A2020202020
        202020207374796C653D2266696C6C3A2366666666666622202F3E0A20202020
        20203C706174680A202020202020202020643D226D2036302E3438323133382C
        3131362E32363338352068202D302E323933373532207620322E393337353220
        6820302E3538373530342076202D322E3634333737207A220A20202020202020
        202069643D2270617468343331220A2020202020202020207374796C653D2266
        696C6C3A2366666666666622202F3E0A2020202020203C706174680A20202020
        2020202020643D226D2036342E3933343538322C3131362E3835313335207620
        2D302E353837352068202D332E353235303236207620322E3335303032206C20
        302E3538373530342C302E35383735206820322E3933373532322076202D302E
        353837352068202D322E3634333737206C202D302E3239333735322C2D302E32
        393337362076202D312E3436383736207A220A20202020202020202069643D22
        70617468343333220A2020202020202020207374796C653D2266696C6C3A2366
        666666666622202F3E0A2020202020203C706174680A20202020202020202064
        3D226D2037302E3331343434392C3131362E32363338352068202D322E393337
        353232207620322E3933373532206820302E3538373530342076202D322E3335
        303032206820322E303536323636206C20302E3239333735322C302E32393337
        35207620302E3538373531206C202D302E3239333735322C302E323933373520
        68202D312E343638373631207620302E3538373531206820312E373632353133
        206C20302E3538373530342C2D302E35383735312076202D312E313735303120
        7A220A20202020202020202069643D2270617468343335220A20202020202020
        20207374796C653D2266696C6C3A2366666666666622202F3E0A202020202020
        3C706174680A202020202020202020643D226D2037342E3937323531362C3131
        362E3835313335202D302E3538373530352C2D302E353837352068202D322E39
        3337353232207620322E3933373532206820302E3538373530352076202D322E
        3335303032206820322E303536323635206C20302E3239333735322C302E3239
        333735207620302E3538373531206C202D302E3635303435312C302E36353034
        3520302E3832323530362C302E3831383331206820302E34313534352076202D
        302E3431313235206C202D302E3338313837382C2D302E333831383820302E33
        38313837382C2D302E3338313838207A220A20202020202020202069643D2270
        617468343337220A2020202020202020207374796C653D2266696C6C3A236666
        6666666622202F3E0A2020202020203C706174680A202020202020202020643D
        226D2037382E3439333334372C3131362E32363338352068202D322E39333735
        3232207620322E3335303032206C20302E3538373530342C302E353837352068
        20322E3933373532322076202D322E3335303032207A206D20302C322E333530
        30322068202D322E303536323636206C202D302E3239333735322C2D302E3239
        3337362076202D312E3436383736206820322E303536323635206C20302E3239
        333735332C302E3239333735207A220A20202020202020202069643D22706174
        68343339220A2020202020202020207374796C653D2266696C6C3A2366666666
        666622202F3E0A2020202020203C706174680A202020202020202020643D226D
        2038332E3138303739312C3131362E38353133352076202D302E353837352068
        202D332E353235303236207620302E35383735207A206D202D332E3532353032
        362C322E3335303032206820302E3538373530352076202D312E313735303120
        6820322E3335303031372076202D302E353837352068202D322E393337353232
        207A220A20202020202020202069643D2270617468343431220A202020202020
        2020207374796C653D2266696C6C3A2366666666666622202F3E0A2020202020
        203C706174680A202020202020202020643D226D2038332E3837333230392C31
        31362E32363338352068202D302E323933373532207620322E39333735322068
        20302E3538373530342076202D322E3634333737207A220A2020202020202020
        2069643D2270617468343433220A2020202020202020207374796C653D226669
        6C6C3A2366666666666622202F3E0A2020202020203C706174680A2020202020
        20202020643D226D2038352E3638313838382C3131382E3631333837202D302E
        3239333735332C2D302E32393337362076202D322E30353632362068202D302E
        353837353034207620322E3335303032206C20302E3538373530342C302E3538
        3735206820322E3933373532322076202D302E35383735207A220A2020202020
        2020202069643D2270617468343435220A2020202020202020207374796C653D
        2266696C6C3A2366666666666622202F3E0A2020202020203C706174680A2020
        20202020202020643D226D2039322E3231313537362C3131362E383531333520
        76202D302E3538373520482038382E3638363535207620302E35383735207A20
        6D202D322E3933373532322C312E3137353031206820322E3335303031382076
        202D302E3538373520482038382E3638363535207620312E3736323531206820
        332E3532353032362076202D302E353837352068202D322E393337353232207A
        220A20202020202020202069643D2270617468343437220A2020202020202020
        207374796C653D2266696C6C3A2366666666666622202F3E0A2020202020203C
        706174680A202020202020202020643D226D2039372E3533363838392C313136
        2E32363338352068202D322E393337353231207620322E3335303032206C2030
        2E3538373530342C302E35383735206820322E3933373532322076202D322E33
        35303032207A206D20302C322E33353030322068202D322E303536323635206C
        202D302E3239333735322C2D302E32393337362076202D312E34363837362068
        20322E303536323635206C20302E3239333735322C302E3239333735207A220A
        20202020202020202069643D2270617468343439220A20202020202020202073
        74796C653D2266696C6C3A2366666666666622202F3E0A2020202020203C7061
        74680A202020202020202020643D226D203130312E37303339382C3131362E32
        363338352068202D322E393337353237207620322E3933373532206820302E35
        38373530352076202D322E3335303032206820322E303536323632206C20302E
        32393337362C302E3239333735207620302E3538373531206C202D302E323933
        37362C302E32393337352068202D312E343638373538207620302E3538373531
        206820312E373632353138206C20302E353837352C2D302E3538373531207620
        2D312E3137353031207A220A20202020202020202069643D2270617468343531
        220A2020202020202020207374796C653D2266696C6C3A236666666666662220
        2F3E0A2020202020203C706174680A202020202020202020643D226D20313032
        2E35393336322C3131362E3236333835207620302E35383735206820312E3436
        383736207620322E3335303032206820302E353837352076202D322E30353632
        37206C20302E32393337362C2D302E3239333735206820312E31373530312076
        202D302E35383735207A220A20202020202020202069643D2270617468343533
        220A2020202020202020207374796C653D2266696C6C3A236666666666662220
        2F3E0A2020202020203C706174680A202020202020202020643D226D20313036
        2E38343034342C3131362E32363338352068202D302E3239333735207620322E
        3933373532206820302E353837352076202D322E3634333737207A220A202020
        20202020202069643D2270617468343535220A2020202020202020207374796C
        653D2266696C6C3A2366666666666622202F3E0A2020202020203C706174680A
        202020202020202020643D226D203130372E37383838342C3131362E33313834
        207620322E3933373532206820302E35383735312076202D322E333530303120
        6820302E3239333735206C20302E38383132352C302E383831323520302E3434
        3036332C2D302E3434303632202D312E30323831332C2D312E3032383134207A
        206D20322E33353030322C30202D302E31343638382C302E313436383820302E
        34343036332C302E3434303633206820302E3239333735207620322E33353030
        31206820302E35383735312076202D322E3933373532207A220A202020202020
        20202069643D2270617468343537220A2020202020202020207374796C653D22
        66696C6C3A2366666666666622202F3E0A2020202020203C706174680A202020
        202020202020643D226D203131322E32373036372C3131362E32363338352068
        202D302E3239333736207620322E3933373532206820302E3538373531207620
        2D322E3634333737207A220A20202020202020202069643D2270617468343539
        220A2020202020202020207374796C653D2266696C6C3A236666666666662220
        2F3E0A2020202020203C706174680A202020202020202020643D226D20313135
        2E39383435332C3131372E31343531202D302E32393337352C302E3239333736
        2068202D322E3035363237206C202D302E32393337352C302E32393337352030
        2E34343036332C302E343430363320302E31343638372C2D302E313436383820
        6820322E3035363237206C20302E353837352C2D302E353837352076202D312E
        31373530312068202D332E3532353032207620302E35383735206820322E3933
        373532207A206D202D322E39333735322C312E343638373720302E3538333331
        2C302E35383735206820322E39343137312076202D302E35383735207A220A20
        202020202020202069643D2270617468343631220A2020202020202020207374
        796C653D2266696C6C3A2366666666666622202F3E0A2020202020203C706174
        680A202020202020202020643D226D203132302E36313332332C3131362E3835
        3133352076202D302E353837352068202D332E3532353032207620302E353837
        35207A206D202D322E39333735322C312E3137353031206820322E3335303032
        2076202D302E353837352068202D322E3933373532207620312E373632353120
        6820332E35323530322076202D302E353837352068202D322E3933373532207A
        220A20202020202020202069643D2270617468343633220A2020202020202020
        207374796C653D2266696C6C3A2366666666666622202F3E0A2020202020203C
        706174680A202020202020202020643D226D203132342E36333736342C313136
        2E3835313335202D302E35383735312C2D302E353837352068202D322E393337
        3532207620322E3933373532206820302E353837352076202D322E3335303032
        206820322E3035363237206C20302E32393337352C302E323933373520762030
        2E3538373531206C202D302E36353034352C302E363530343520302E38323235
        312C302E3831383331206820302E34313534352076202D302E3431313235206C
        202D302E33383138382C2D302E333831383820302E33383138382C2D302E3338
        313838207A220A20202020202020202069643D2270617468343635220A202020
        2020202020207374796C653D2266696C6C3A2366666666666622202F3E0A2020
        20203C2F673E0A20203C2F673E0A3C2F7376673E0A}
      Transparent = True
      Visible = False
    end
    object RzPanel1: TRzPanel
      AlignWithMargins = True
      Left = 132
      Top = 5
      Width = 217
      Height = 34
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BorderOuter = fsNone
      BorderSides = []
      Color = 2829099
      FlatColor = clNavy
      FlatColorAdjustment = 0
      FrameControllerNotifications = [fcpColor, fcpFocusColor, fcpDisabledColor, fcpReadOnlyColor, fcpReadOnlyColorOnFocus, fcpParentColor, fcpFlatButtonColor, fcpFlatButtons, fcpFrameColor, fcpFrameHotColor, fcpFrameHotTrack, fcpFrameHotStyle, fcpFrameSides, fcpFrameStyle, fcpFramingPreference]
      TabOrder = 0
      Transparent = True
      VisualStyle = vsGradient
      object OptimizeBtn: TRzToolButton
        Left = 0
        Top = 0
        Width = 217
        Height = 34
        Hint = 'Start optimization'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        SelectionColorStop = clBtnFace
        SelectionFrameColor = clBtnFace
        Flat = False
        ImageIndex = 9
        Images = DataModule1.SVGIconImageList1
        ShowCaption = True
        UseToolbarButtonSize = False
        UseToolbarShowCaption = False
        Align = alClient
        Caption = 'Optimize profiles'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -18
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = OptimizeBtnClick
        ExplicitTop = -3
        ExplicitWidth = 205
      end
    end
  end
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 44
    Width = 1150
    Height = 42
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    RowHeight = 38
    ButtonWidth = 38
    ButtonHeight = 38
    TextOptions = ttoCustom
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    Color = 2829099
    TabOrder = 3
    ToolbarControls = (
      MenuButton2
      RzSpacer1
      OptimizeBtn2)
    object MenuButton2: TRzToolButton
      Left = 4
      Top = 2
      Width = 59
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      DropDownMenu = PopupMenu1
      ImageIndex = 0
      Images = DataModule1.SVGIconImageList1
      ToolStyle = tsDropDown
    end
    object RzSpacer1: TRzSpacer
      Left = 63
      Top = 2
      Width = 12
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Grooved = True
    end
    object OptimizeBtn2: TRzToolButton
      Left = 75
      Top = 2
      Width = 197
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      GradientColorStyle = gcsSystem
      ImageIndex = 9
      Images = DataModule1.SVGIconImageList1
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      UseToolbarVisualStyle = False
      VisualStyle = vsWinXP
      Caption = 'Optimize profiles'
      Enabled = False
      OnClick = OptimizeBtnClick
    end
  end
  object RzSplitter1: TRzSplitter
    Left = 0
    Top = 86
    Width = 1150
    Height = 483
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Orientation = orVertical
    Position = 249
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
      249
      1150
      258)
    UpperLeftControls = (
      VirtualStringTree1)
    LowerRightControls = (
      RzPanel2
      VirtualStringTree2)
    object VirtualStringTree1: TVirtualStringTree
      Left = 0
      Top = 0
      Width = 1150
      Height = 249
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
      Colors.HotColor = clWhite
      Colors.SelectionRectangleBlendColor = 13661955
      Colors.SelectionRectangleBorderColor = 13661955
      Colors.SelectionTextColor = clWhite
      Colors.TreeLineColor = 9471874
      Colors.UnfocusedColor = clSilver
      Colors.UnfocusedSelectionColor = 2829099
      Colors.UnfocusedSelectionBorderColor = 2829099
      DefaultNodeHeight = 36
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -18
      Header.Font.Name = 'Verdana'
      Header.Font.Style = [fsBold]
      Header.Height = 36
      Header.MaxHeight = 45
      Header.MinHeight = 36
      Header.Options = [hoColumnResize, hoDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoAutoSpring]
      Header.ParentFont = False
      Header.PopupMenu = PopupMenu1
      HintMode = hmHintAndDefault
      Indent = 27
      LineStyle = lsSolid
      Margin = 6
      PopupMenu = PopupMenu1
      TabOrder = 0
      TextMargin = 6
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoHideButtons, toAutoChangeScale]
      TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
      TreeOptions.PaintOptions = [toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseBlendedSelection, toUseExplorerTheme]
      TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect, toAlwaysSelectNode, toRestoreSelection]
      OnBeforeCellPaint = VirtualStringTree1BeforeCellPaint
      OnDrawText = VirtualStringTree1DrawText
      OnFreeNode = VirtualStringTree1FreeNode
      OnGetText = VirtualStringTree1GetText
      OnGetImageIndexEx = VirtualStringTree1GetImageIndexEx
      Touch.InteractiveGestures = [igPan, igPressAndTap]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
      Columns = <
        item
          Hint = 'Profile App\Path and settings for its optimization'
          MaxWidth = 15000
          MinWidth = 15
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coSmartResize, coAllowFocus, coEditable, coStyleColor]
          Position = 0
          Spacing = 5
          Text = 'Profile'
          Width = 499
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
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
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
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment, coEditable, coStyleColor]
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
      Height = 38
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
        Height = 28
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
      end
      object RzToolButton2: TRzToolButton
        AlignWithMargins = True
        Left = 959
        Top = 5
        Width = 75
        Height = 28
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
      end
    end
    object VirtualStringTree2: TVirtualStringTree
      Left = 0
      Top = 38
      Width = 1150
      Height = 187
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
      Colors.HotColor = clWhite
      Colors.SelectionRectangleBlendColor = 13661955
      Colors.SelectionRectangleBorderColor = 13661955
      Colors.SelectionTextColor = clWhite
      Colors.TreeLineColor = 9471874
      Colors.UnfocusedColor = clSilver
      Colors.UnfocusedSelectionColor = 2829099
      Colors.UnfocusedSelectionBorderColor = 2829099
      DefaultNodeHeight = 27
      Header.AutoSizeIndex = 2
      Header.Height = 36
      Header.MaxHeight = 45
      Header.MinHeight = 36
      Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
      Indent = 27
      Margin = 6
      PopupMenu = PopupMenu2
      TabOrder = 1
      TextMargin = 6
      TreeOptions.PaintOptions = [toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseBlendedSelection, toUseExplorerTheme]
      TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect, toAlwaysSelectNode, toRestoreSelection]
      OnFreeNode = VirtualStringTree2FreeNode
      OnGetText = VirtualStringTree2GetText
      Touch.InteractiveGestures = [igPan, igPressAndTap]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
      ExplicitTop = 33
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
    Height = 169
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
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Profile'
      ExplicitWidth = 57
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 80
      Width = 514
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Overall'
      ExplicitWidth = 65
    end
    object RzProgressBar1: TRzProgressBar
      Left = 7
      Top = 39
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
      Top = 107
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
      ExplicitLeft = 8
      ExplicitTop = 104
      ExplicitWidth = 523
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.SVGIconImageList1
    OnPopup = PopupMenu1Popup
    Left = 136
    Top = 120
    object ScannProfiles: TMenuItem
      Tag = 1
      Caption = 'Search existing profile(s)'
      ImageIndex = 1
      ImageName = 'icons8_search_folder'
      ShortCut = 116
      OnClick = ActionsClickClick
    end
    object aa1: TMenuItem
      Caption = '-'
    end
    object AddCustomProfileBtn: TMenuItem
      Tag = 2
      Caption = 'Add profile path...'
      ImageIndex = 2
      ImageName = 'icons8_add_folder'
      ShortCut = 16449
      OnClick = ActionsClickClick
    end
    object dlg1: TMenuItem
      Caption = 'Add profile path2...'
      OnClick = dlg1Click
    end
    object DelCustomProfileBtn: TMenuItem
      Tag = 3
      Caption = 'Remove selected profile'
      ImageIndex = 3
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
      ImageIndex = 5
      ImageName = 'icons8_Checked_Checkbox_1'
      ShortCut = 16471
      OnClick = ActionsClickClick
    end
    object UnCheckallprofiles1: TMenuItem
      Tag = 5
      Caption = 'UnCheck all profiles'
      ImageIndex = 6
      ImageName = 'icons8_Unchecked_Checkbox_1'
      ShortCut = 16453
      OnClick = ActionsClickClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Openprofiledirectory1: TMenuItem
      Tag = 6
      Caption = 'Open profile directory'
      ImageIndex = 4
      ImageName = 'icons8_move_to_folder'
      ShortCut = 16452
      OnClick = ActionsClickClick
    end
    object Copyprofiledirectorypath1: TMenuItem
      Tag = 7
      Caption = 'Copy profile path'
      ImageIndex = 10
      ImageName = 'icons8_user_folder'
      ShortCut = 16451
      OnClick = ActionsClickClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object SettingsBtn: TMenuItem
      Tag = 8
      Caption = 'Settings ...'
      ImageIndex = 8
      ImageName = 'icons8_settings_1'
      OnClick = ActionsClickClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object info1: TMenuItem
      Tag = 9
      Caption = 'Info'
      OnClick = ActionsClickClick
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 136
    Top = 176
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 676
    Top = 425
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
    object Gotofile1: TMenuItem
      Caption = 'Goto file'
      OnClick = Gotofile1Click
    end
  end
end
