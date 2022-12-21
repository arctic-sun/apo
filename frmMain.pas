unit frmMain;

interface

uses
  {-$DEFINE DEBUGMODE}
 {$IFDEF DEBUGMODE}
   ObjectInspectorEh,
 {$ENDIF}

  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  Winapi.ShlObj,

  System.SysUtils,
  System.Variants,
  System.ImageList,
  System.Classes,
  System.Generics.Collections,
  System.Types,
  System.IOUtils,
  System.Diagnostics,
  System.TimeSpan,
  System.Threading,

  Vcl.Themes,
  Vcl.Styles,
  Vcl.Graphics,
  Vcl.StdCtrls,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ImgList,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.TitleBarCtrls,
  Vcl.Clipbrd,
  Vcl.WinXCtrls,
  Vcl.ExtDlgs,

  SVGIconImageListBase,
  SVGIconImageList,
  SVGIconImage,

  RzStatus,
  RzPanel,
  RzButton,
  RzPrgres,
  RzSplit,
  RzLabel,

  VirtualTrees,
  VirtualTrees.BaseAncestorVCL,
  VirtualTrees.BaseTree,
  VirtualTrees.AncestorVCL,
  VirtualTrees.Header
  ;

type
  TFormMain = class(TForm)
    RzStatusBar1: TRzStatusBar;
    TitleBarPanel1: TTitleBarPanel;
    PopupMenu1: TPopupMenu;
    ScannProfiles: TMenuItem;
    aa1: TMenuItem;
    MenuButton: TRzToolButton;
    AddCustomProfileBtn: TMenuItem;
    DelCustomProfileBtn: TMenuItem;
    N1: TMenuItem;
    Checkallprofiles1: TMenuItem;
    UnCheckallprofiles1: TMenuItem;
    N2: TMenuItem;
    OptimizeBtn: TRzToolButton;
    N3: TMenuItem;
    Openprofiledirectory1: TMenuItem;
    Copyprofiledirectorypath1: TMenuItem;
    RzStatusPane_AppVer: TRzStatusPane;
    RzStatusPane_SQLiteVer: TRzStatusPane;
    Bevel1: TBevel;
    RzStatusPane3: TRzStatusPane;
    Bevel2: TBevel;
    info1: TMenuItem;
    FileOpenDialog1: TFileOpenDialog;
    SettingsBtn: TMenuItem;
    N4: TMenuItem;
    RzPanelProgress: TRzPanel;
    Label2: TLabel;
    Label3: TLabel;
    RzProgressBar1: TRzProgressBar;
    RzProgressBar2: TRzProgressBar;
    RzToolbar1: TRzToolbar;
    MenuButton2: TRzToolButton;
    OptimizeBtn2: TRzToolButton;
    VirtualStringTree1: TVirtualStringTree;
    RzSplitter1: TRzSplitter;
    RzPanel2: TRzPanel;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    VirtualStringTree2: TVirtualStringTree;
    PopupMenu2: TPopupMenu;
    Copy1: TMenuItem;
    Gotofile1: TMenuItem;
    CreateBATfile1: TMenuItem;
    FileSaveDialog1: TFileSaveDialog;
    Edit1: TMenuItem;
    RzToolButton4: TRzToolButton;
    Checkallprofiles2: TRzToolButton;
    UnCheckallprofiles2: TRzToolButton;
    RzToolButton_OpenProfileDir2: TRzToolButton;
    Copyprofiledirectorypath2: TRzToolButton;
    RzToolButton10: TRzToolButton;
    RzToolButton11: TRzToolButton;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel3: TRzLabel;
    RzPanel1: TRzPanel;
    Optimizeselectedprofile1: TMenuItem;
    N5: TMenuItem;
    RzToolButton3: TRzToolButton;
    RzPanel3: TRzPanel;
    RzButton1: TRzButton;
    RzToolButton5: TRzToolButton;
    PopupMenu3: TPopupMenu;
    VST1: TMenuItem;
    Form1: TMenuItem;
    WhiteSkin1: TMenuItem;
    BlackSkin1: TMenuItem;
    DirtyHackDPiTimer1: TTimer;
    SVGIconImage2: TSVGIconImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TitleBarPanel1Paint(Sender: TObject; Canvas: TCanvas; var ARect: TRect);
    procedure OptimizeBtnClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SettingsBtnClick(Sender: TObject);
    procedure ActionsClickClick(Sender: TObject);
    procedure MenuButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure VirtualStringTree1FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualStringTree1GetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure VirtualStringTree1GetImageIndexEx(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex; var ImageList: TCustomImageList);
    procedure VirtualStringTree1BeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure VirtualStringTree1DrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
    procedure VirtualStringTree2GetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure VirtualStringTree2FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Gotofile1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure Optimizeselectedprofile1Click(Sender: TObject);
    procedure VirtualStringTree1NodeClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
    procedure VirtualStringTree1Checked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure RzButton1Click(Sender: TObject);
    procedure Act1Click(Sender: TObject);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);
    procedure DirtyHackDPiTimer1Timer(Sender: TObject);
  private
    { Private declarations }
    xOldDPI, xNewDPI: Integer;
    add_profiledlg_last_cbindex: integer;
    // procedure WMDpiChanged(var Message: TMessage); message WM_DPICHANGED;
    procedure WMDropFiles(var Msg: TWMDropFiles);  message WM_DROPFILES;
    procedure updateButtonsState(const ccs: boolean = False );
    procedure VSTSetCheckState(const b: Boolean);
    procedure ProgressDlgVisible(const b: Boolean);
    procedure BeforeProcOptimize;
    procedure AfterProcOptimize;
    procedure ProcCreateBAT(const outfile : string);
    procedure ProcOptimize(const selectedOnly: Boolean = False);
    procedure ProcOptimizeLOG(const selectedOnly: Boolean = False);
    procedure ProcSearchProfiles;
    procedure CollectDisabledProfiles;
    procedure CustomProfileDeleteSelected;
    procedure AddProfileDlg(const DefProfilePath : string = ''; defAppType: Integer = 0);
    procedure AddProfile(const pPath: String; const AppType: Integer = 0; const ManualAdded: Boolean = false);
    function  AddProfileToList(const pPath: string; const pAppType: Integer): Integer;
    function  AddProfileToVST(const pPath: string; const pAppType: Integer; const ManualAdded: Boolean = false): Integer;
    function  LogAdd(RootNode: PVirtualNode; const p1: string = ''; p2: string = ''; p3: string =''): PVirtualNode;
    procedure LogEdit(Node: PVirtualNode; const p1: string = ''; p2: string = ''; p3: string ='');

    procedure ChangeControlsForDPI(const DPIIndex: integer);
  public
    { Public declarations }

  end;



  PItemNodeData = ^TItemNodeData;
  TItemNodeData = record
    v_ProfileName  : String;
    h_AppType      : Integer;
    v_FilesCount   : String;
    v_SizeBefore   : String;
    v_SizeAfter    : String;
    v_RateStr      : String;
    h_ManualAdded  : Boolean;
    h_RateProgress : Integer;
    h_PathNotFound : Boolean;
  end;

  PLOGItemNodeData = ^TLOGItemNodeData;
  TLOGItemNodeData = record
    ProcName  : String;
    ProcValue : String;
    ProcResult: String;
  end;

var
  FormMain: TFormMain;
  APO_Portable : Boolean;
  FirstShow: Boolean = False;

  settings_minfilesizeType  : Integer;
  settings_minfilesizeValue : Int64;     // MinSize     0 - any size
  settings_maxscanndepth    : Integer;   // MaxDepth   -1 - any depth
  settings_delete_wal       : Boolean;
  settings_delete_shm       : Boolean;
  settings_showhint         : Boolean;
  settings_showlog          : Boolean;
  settings_searchlnkdesktop : Boolean;
  settings_searchlnksmenu   : Boolean;
  settings_captiontoolbar   : boolean;
  settings_ThemeStyle       : integer;

  CancelOptProc : Boolean;

// Decrease Exe size
//{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}      //
//{$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}   //      Line numbers are stripped from file.
//{$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}  //      Local symbols are stripped from file.
//{$SetPEFlags IMAGE_FILE_AGGRESIVE_WS_TRIM}    //      Agressively trim working set.
//{$DYNAMICBASE OFF}


  procedure ApplyTheme(const LT: Boolean = False);

implementation

uses aConstUnit,
     DataModuleUnit,
     UtilsUnit,
     BatScriptUnt,
     frmInfoUnit,
     frmSettingsUnit,
     frmAddProfileUnit;

var
    CustomProfilePaths     : TStringList;
    DisabledProfiles       : TArray<String>;
    SearchProfilesResult   : TList<TAProfiles>;

const
     VST_PROGRESS_BAR_COLOR = $00598FFF;

     VST_PROFILENAME_COLUMN_INDEX = 0;
     VST_FILESCOUNT_COLUMN_INDEX  = 1;
     VST_SIZEBEFORE_COLUMN_INDEX  = 2;
     VST_SIZEAFTER_COLUMN_INDEX   = 3;
     VST_RATE_COLUMN_INDEX        = 4;


{$R *.dfm}


{$REGION ' misc  '}

// aero = 1, govnero = 0
function IsAeroEnabled: Boolean;
type
  TDwmIsCompositionEnabledFunc = function(out pfEnabled: BOOL): HRESULT; stdcall;
var
  IsEnabled: BOOL;
  ModuleHandle: HMODULE;
  DwmIsCompositionEnabledFunc: TDwmIsCompositionEnabledFunc;
begin
  Result := False;
  if Win32MajorVersion >= 6 then // Vista or Windows 7+
  begin
    ModuleHandle := LoadLibrary('dwmapi.dll');
    if ModuleHandle <> 0 then
    try
      @DwmIsCompositionEnabledFunc := GetProcAddress(ModuleHandle, 'DwmIsCompositionEnabled');
      if Assigned(DwmIsCompositionEnabledFunc) then
        if DwmIsCompositionEnabledFunc(IsEnabled) = S_OK then
          Result := IsEnabled;
    finally
      FreeLibrary(ModuleHandle);
    end;
  end;
end;

function GetAppSettingsPath: string;
begin
  if APO_Portable then
   Result := IncludeTrailingPathDelimiter( ExtractFilePath( paramStr(0) ) ) + APP_PORTABLE_SETTINGS_PATH
  else
   Result := GetEnvironmentVariable('USERPROFILE') + APP_SETTINGS_PATH ;
end;

procedure SaveSettings;
var s, tmp_str: string;
begin
  s :=  settings_minfilesizeValue.ToString + ',' +
  settings_minfilesizeType.ToString + ',' +
  settings_maxscanndepth.ToString + ','   +
  settings_delete_wal.ToString + ','     +
  settings_delete_shm.ToString + ','     +
  settings_showhint.ToString + ',' +
  settings_showlog.ToString + ',' +
  settings_searchlnkdesktop.ToString + ',' +
  settings_searchlnksmenu.ToString + ',' +
  settings_captiontoolbar.ToString + ',' +
  settings_ThemeStyle.ToString;

  tmp_str := GetAppSettingsPath; // GetEnvironmentVariable('USERPROFILE') + APP_SETTINGS_PATH ;
  ForceDirectories(tmp_str);

  CustomProfilePaths.SaveToFile(tmp_str + APP_CUSTOM_PROFILES_FILENAME);

  System.IOUtils.TFile.WriteAllText( tmp_str + APP_SETTINGS_FILENAME, s, TEncoding.ANSI );

  System.IOUtils.TFile.WriteAllLines( tmp_str + APP_DISABLED_PROFILES_FILENAME, DisabledProfiles, TEncoding.UTF8 );
end;

procedure LoadingSettings;
var s, tmp_str: string;
    str_items : TArray<string>;
begin
  tmp_str := GetAppSettingsPath;// GetEnvironmentVariable('USERPROFILE') + APP_SETTINGS_PATH ;

  if FileExists(tmp_str + APP_CUSTOM_PROFILES_FILENAME) then
    CustomProfilePaths.LoadFromFile(tmp_str + APP_CUSTOM_PROFILES_FILENAME);

  if FileExists(tmp_str + APP_DISABLED_PROFILES_FILENAME) then
    DisabledProfiles := System.IOUtils.TFile.ReadAllLines( tmp_str+ APP_DISABLED_PROFILES_FILENAME, TEncoding.UTF8 );

  if not FileExists(tmp_str + APP_SETTINGS_FILENAME) then exit;

   s := System.IOUtils.TFile.ReadAllText(tmp_str+ APP_SETTINGS_FILENAME, TEncoding.ANSI );


    str_items := s.Split([',']);
    if Length(str_items)>0 then
    settings_minfilesizeValue:= str_items[0].ToInt64;
    if Length(str_items)>1 then
    settings_minfilesizeType:=  str_items[1].ToInteger;
    if Length(str_items)>2 then
    settings_maxscanndepth:=    str_items[2].ToInteger;
    if Length(str_items)>3 then
    settings_delete_wal:=       str_items[3].ToBoolean;
    if Length(str_items)>4 then
    settings_delete_shm:=       str_items[4].ToBoolean;
    if Length(str_items)>5 then
    settings_showhint:=         str_items[5].ToBoolean;
    if Length(str_items)>6 then
    settings_showlog:=          str_items[6].ToBoolean;
    if Length(str_items)>7 then
    settings_searchlnkdesktop:= str_items[7].ToBoolean;
    if Length(str_items)>8 then
    settings_searchlnksmenu:=   str_items[8].ToBoolean;
    if Length(str_items)>9 then
    settings_captiontoolbar:=   str_items[9].ToBoolean;

    if Length(str_items)>10 then
    settings_ThemeStyle := str_items[10].ToInteger else settings_ThemeStyle := 0;

end;

function GetMinSizeAsBytes: Int64;
begin
    // MinSize  "0" - any size
    case settings_minfilesizeType of
     0: result := settings_minfilesizeValue;//  Byte
     1: result := settings_minfilesizeValue*1024; // KB
     2: result := settings_minfilesizeValue*1024*1024;// MB
     3: result := settings_minfilesizeValue*1024*1024*1024;// GB
    end;
end;

  {
  1280x720 HD
  1920x1080 FHD
  2560x1440 QHD
  3840x2160 4K
  7680x4320 8K
  }



{$ENDREGION}

{$REGION ' Form events  '}

procedure TFormMain.WMDropFiles(var Msg: TWMDropFiles);
// from https://habr.com/ru/post/179131/
var
  DropH: HDROP;               // дескриптор операции перетаскивания
  DroppedFileCount: Integer;  // количество переданных файлов
  FileNameLength: Integer;    // длина имени файла
  FileName: string;           // буфер, принимающий имя файла
  I: Integer;                 // итератор для прохода по списку
  DropPoint: TPoint;          // структура с координатами операции Drop
begin
  inherited;
  // Сохраняем дескриптор
  DropH := Msg.Drop;
  try
    // Получаем количество переданных файлов
    DroppedFileCount := DragQueryFile(DropH, $FFFFFFFF, nil, 0);
    // Получаем имя каждого файла и обрабатываем его
    for I := 0 to Pred(DroppedFileCount) do
    begin
      // получаем размер буфера
      FileNameLength := DragQueryFile(DropH, I, nil, 0);
      // создаем буфер, который может принять в себя строку с именем файла
      // (Delphi добавляет терминирующий ноль автоматически в конец строки)
      SetLength(FileName, FileNameLength);
      // получаем имя файла
      DragQueryFile(DropH, I, PChar(FileName), FileNameLength + 1);

       if ( FileGetAttr(FileName) and faDirectory = faDirectory) then
       begin
         //AddProfile(FileName, 0, True)
         AddProfileDlg(FileName, -1);
       end
       else
        if CompareText( ExtractFileExt(FileName) , '.lnk' ) = 0 then
        begin
          var _target, _argument: string;

          case GetLnkFile(FileName, _target, _argument) of

           RESULT_LNK_TO_DIRECTORY: AddProfile(_target, 0 {RESULT_UNKNOWN_PROFILE}, True );

           RESULT_LNK_TO_CHROMED_USERDATADIR: begin
                 var ProfilePath: string;
                 var appType: Integer;
                 appType := GetChromedProfileInfo(_target, _argument, ProfilePath);

                 if appType >= 0 {RESULT_UNKNOWN_PROFILE} then
                   AddProfile(ProfilePath, appType, true);
              end;

           RESULT_LNK_TO_CHROMED_PROFILE: {skip} ;
           RESULT_LNK_UNKNOWN: ;

          end;
        end;
    end;
    // Опционально: получаем координаты, по которым произошла операция Drop
    // DragQueryPoint(DropH, DropPoint);
    // ... что-то делаем с данными координатами здесь
  finally
    // Финализация - разрушаем дескриптор
    // не используйте DropH после выполнения данного кода...
    DragFinish(DropH);
  end;
  // Говорим о том, что сообщение обработано
  Msg.Result := 0;
end;

 {$REGION ' DPI Dirty Hack :D '}

 {
 В чём тут суть:

 1.
 При разрешении 3840x2160 4K иконы тулбара должны быть 24pix
 А при более низких разрешениях 16px (но могут быть и исключения)
 А как там оно для 8K загадка ...

 2.
 При бросковом перетаскивании окна из одного моника в другой с разными DPI
 масштабирование исполняется криво, и его нужно вызвать повторно.
 }

procedure TFormMain.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);
begin
  xOldDPI := OldDPI;
  xNewDPI := NewDPI;
  DirtyHackDPiTimer1.Enabled := True;
end;

procedure TFormMain.DirtyHackDPiTimer1Timer(Sender: TObject);
begin
 DirtyHackDPiTimer1.Enabled := False;
 FormMain.OnAfterMonitorDpiChanged := nil;

 ChangeControlsForDPI(xNewDPI);

 FormMain.ScaleControlsForDpi(xOldDPI);
 //FormMain.ScaleForPPI(xOldDPI);
 FormMain.ScaleControlsForDpi(xNewDPI);
 //FormMain.ScaleForPPI(xNewDPI);
 FormMain.OnAfterMonitorDpiChanged := FormAfterMonitorDpiChanged;
end;

 {$ENDREGION}


procedure TFormMain.ChangeControlsForDPI(const DPIIndex: integer);
begin



  case DPIIndex of
    96 :  begin
           

           DataModule1.SVGIconVirtualImageList2.Size := 16;
           DataModule1.SVGIconVirtualImageList1.Size := 16;
           OptimizeBtn.UseToolbarButtonSize := False;
           OptimizeBtn.Width := 200;
           OptimizeBtn.UseToolbarButtonSize := true;
          end;

    144 : begin
           { Image1.Height := 30;
            Image1.Proportional := True;
            Image1.Stretch := True;    }

            DataModule1.SVGIconVirtualImageList2.Size := 24;
            DataModule1.SVGIconVirtualImageList1.Size := 24;
            OptimizeBtn.UseToolbarButtonSize := False;
            OptimizeBtn.Width := 200;
            OptimizeBtn.UseToolbarButtonSize := true;
          end;
  end;
end;



procedure ApplyTheme(const LT: Boolean = False);
begin
  case settings_ThemeStyle of
   1:
    begin
      FormMain.Checkallprofiles2.ImageIndex := 16;
      FormMain.UnCheckallprofiles2.ImageIndex := 17;
      FormMain.UnCheckallprofiles1.ImageIndex := 17;
      FormMain.Checkallprofiles1.ImageIndex := 16;
      FormMain.MenuButton2.ImageIndex := 18;
      FormMain.MenuButton.ImageIndex := 18;
      FormMain.info1.ImageIndex := 19;
      FormMain.VirtualStringTree1.Colors.HotColor := clNavy;
      FormMain.VirtualStringTree1.SelectionBlendFactor := 200;
      FormMain.VirtualStringTree2.Colors.HotColor := clNavy;
      FormMain.VirtualStringTree2.SelectionBlendFactor := 200;

      if LT then
      TStyleManager.TrySetStyle('Windows11 Modern Light');
    end;

   0:
    begin
      FormMain.Checkallprofiles2.ImageIndex := 9;
      FormMain.UnCheckallprofiles2.ImageIndex := 10;
      FormMain.UnCheckallprofiles1.ImageIndex := 10;
      FormMain.Checkallprofiles1.ImageIndex := 9;
      FormMain.MenuButton2.ImageIndex := 0;
      FormMain.MenuButton.ImageIndex := 0;
      FormMain.info1.ImageIndex := 12;
      FormMain.VirtualStringTree1.Colors.HotColor := $00FDBA60;
      FormMain.VirtualStringTree1.SelectionBlendFactor := 128;
      FormMain.VirtualStringTree2.Colors.HotColor := $00FDBA60;
      FormMain.VirtualStringTree2.SelectionBlendFactor := 128;

      if LT then
      TStyleManager.TrySetStyle('Windows11 Modern Dark');
    end;

  end;

end;



procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CollectDisabledProfiles;  // <- Required for SaveSettings
  SaveSettings;
  CustomProfilePaths.Free;
  FreeSearchProfilesResult(SearchProfilesResult);
  DragAcceptFiles(Self.Handle, False);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  add_profiledlg_last_cbindex := 0;
  FileOpenDialog1.FileName := '';

  FileSaveDialog1.FileName := 'OptimizationJob.bat';
  FileSaveDialog1.DefaultFolder := ExtractFilePath(ParamStr(0));


  CustomProfilePaths := TStringList.Create;
  CustomProfilePaths.NameValueSeparator := '|';
  CustomProfilePaths.DefaultEncoding := TEncoding.UTF8;

  if IsAeroEnabled.ToInteger = 0 then
  begin
     TitleBarPanel1.OnPaint := nil;
     FormMain.CustomTitleBar.Control := nil;
     FormMain.CustomTitleBar.Enabled := False;

     TitleBarPanel1.Enabled := False;
     TitleBarPanel1.Visible := False;
     TitleBarPanel1.Hide;
  end; { }

  VirtualStringTree1.NodeDataSize := SizeOf(TItemNodeData);
  VirtualStringTree2.NodeDataSize := SizeOf(TLOGItemNodeData);

  DragAcceptFiles(Self.Handle, true);

  // Accept D&D if app is elevated
  if IsElevated then
  begin
    ChangeWindowMessageFilter (WM_DROPFILES, MSGFLT_ADD);
    ChangeWindowMessageFilter (WM_COPYDATA, MSGFLT_ADD);
    ChangeWindowMessageFilter ($0049, MSGFLT_ADD);
    { or
      var I: integer := 0;
      while i <= WM_DROPFILES do
        ChangeWindowMessageFilter (i, MSGFLT_ADD);
     }
  end;

  APO_Portable := Pos( 'portable',  LowerCase( ExtractFileName( ParamStr(0) ) ) ) > 0  ;

end;

procedure TFormMain.FormResize(Sender: TObject);
begin
   VirtualStringTree1.Header.Options := VirtualStringTree1.Header.Options + [hoAutoResize];
   VirtualStringTree1.Header.Options := VirtualStringTree1.Header.Options - [hoAutoResize];

   VirtualStringTree2.Header.Options := VirtualStringTree2.Header.Options + [hoAutoResize];
   VirtualStringTree2.Header.Options := VirtualStringTree2.Header.Options - [hoAutoResize];

   // Opt Progress panel centering
   RzPanelProgress.Top  :=  (ClientHeight - RzPanelProgress.Height) div 2 ;
   RzPanelProgress.Left :=  (ClientWidth - RzPanelProgress.Width) div 2;
end;


function GetRandomColour: TColor;
begin
  // Result := RGB(200+Random(55), 200+Random(55), 200+Random(55));
  // Result := RGB(150+Random(105), 150+Random(105), 150+Random(105));
    Result := RGB(16+Random(255-16), 125+Random(255-125), 184+Random(255-184));
end;

function ColorToHex(Color: integer): string;
var
  r,g,b: byte;
begin
  r:=GetRValue(Color);
  g:=GetGValue(Color);
  b:=GetBValue(Color);
  Result:=IntToHex(r,2)+IntToHex(g,2)+IntToHex(b,2);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  if FirstShow then Exit;

  Caption := APP_CAPTION;

  if Self.Monitor.PixelsPerInch >= 144 then
  begin
    Randomize;
    var colorstr: string;
    var i: integer;

    for I := 0 to 23 do
    begin
      colorstr := '#' + ColorToHex( GetRandomColour );
      SVGIconImage2.SVGText :=  StringReplace(SVGIconImage2.SVGText, '#ffffff', colorstr, [{rfReplaceAll, rfIgnoreCase}] );
    end;
  end;


  ChangeControlsForDPI( Self.Monitor.PixelsPerInch );

  RzStatusPane_SQLiteVer.Caption :=
     Format(SQLStatusVerCaption, [FileVersion(sqlite3_lib)]);

  if APO_Portable then
    RzStatusPane_AppVer.Caption :=
       Format(AppVerPortableCaption, [FileVersion(Application.ExeName)])
  else
    RzStatusPane_AppVer.Caption :=
       Format(AppVerCaption, [FileVersion(Application.ExeName)]);

  Application.HintHidePause := 10000;

  // MinSize     0 - any size
  settings_minfilesizeType  := 2;   // MB
  settings_minfilesizeValue := 0;   // 0 MB
  settings_maxscanndepth    := -1;  // MaxDepth   "-1" = - any depth
  settings_delete_wal       := False;
  settings_delete_shm       := False;
  settings_showhint         := True;
  settings_showlog          := False;
  settings_searchlnkdesktop := False;
  settings_searchlnksmenu   := False;
  settings_captiontoolbar   := False;

  LoadingSettings;

  // Apply some settings
  FormMain.ShowHint              := settings_showhint;
  Application.ShowHint           := settings_showhint;
  RzSplitter1.LowerRight.Visible := settings_showlog;

  if settings_captiontoolbar then
  begin
    // If win7 w.o. aero then force show toolbar
    if IsAeroEnabled.ToInteger = 0  then
       RzToolbar1.Visible := True
    else
       RzToolbar1.Visible := False;
  end else
  begin
     TitleBarPanel1.OnPaint          := nil;
     FormMain.CustomTitleBar.Control := nil;
     FormMain.CustomTitleBar.Enabled := False;
     TitleBarPanel1.Enabled := False;
     TitleBarPanel1.Visible := False;
     TitleBarPanel1.Hide;
     RzToolbar1.Visible := True;
  end;

  SearchProfilesResult := nil;
  ProcSearchProfiles;

  FirstShow := True;
end;

// Paint form caption
procedure TFormMain.TitleBarPanel1Paint(Sender: TObject; Canvas: TCanvas; var ARect: TRect);
begin
 { Text:
   var s: string := 'Arctic Profile Optimizer';
   Canvas.Font.Style := [fsBold];
   Canvas.Font.Size := 12;
   Canvas.Font.Color := clWhite;
   DrawText(Canvas.Handle, PChar(s), Length(s), ARect, DT_SINGLELINE or DT_CENTER or DT_VCENTER);
   }
  // Canvas.Draw((ARect.Width div 2)-100 , (ARect.Height div 2)-5 ,Image1.Picture.Graphic);
   SVGIconImage2.svg.PaintTo(Canvas.Handle,  RectF(  ARect.Width+100 , ARect.Height , 0, 0), false);
end;

procedure TFormMain.MenuButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
 { OFF
   var Pt: TPoint;
   Pt := TRzToolButton(Sender).ClientToScreen(Point(0, TRzToolButton(Sender).ClientHeight));
   TRzToolButton(Sender).DropDownMenu.Popup(Pt.X, Pt.Y );  }
end;

{$ENDREGION}

{$REGION ' Procedures and Functions   '}

procedure TFormMain.updateButtonsState(const ccs: boolean = False );

  function VSTHasCheckedNodes: Boolean;
  var Node: PVirtualNode;
  begin
       Result := VirtualStringTree1.RootNodeCount > 0;
       // Перебор это конечно вариант, но лучше всёже следить слежку, или найти более быстрый перебор
       if not Result then Exit;
       Node :=  VirtualStringTree1.GetFirstLevel(1);
       while Assigned(Node) do
       begin
         if VirtualStringTree1.CheckState[Node] = csCheckedNormal then Exit(True);
         Node := VirtualStringTree1.GetNextLevel(Node, 1);
       end;
       Result := False;
  end;

begin

  if ccs then
  OptimizeBtn.Enabled  := VSTHasCheckedNodes;
  OptimizeBtn2.Enabled := OptimizeBtn.Enabled;

  if Assigned(VirtualStringTree1.FocusedNode)
  then
   Openprofiledirectory1.Enabled :=
       (VirtualStringTree1.RootNodeCount > 0 ) and
       (VirtualStringTree1.GetNodeLevel(VirtualStringTree1.FocusedNode) = 1)
  else
   Openprofiledirectory1.Enabled := False;

   Optimizeselectedprofile1.Enabled := Openprofiledirectory1.Enabled;

   RzToolButton_OpenProfileDir2.Enabled := Openprofiledirectory1.Enabled;

  Copyprofiledirectorypath1.Enabled := Openprofiledirectory1.Enabled;
  Copyprofiledirectorypath2.Enabled := Copyprofiledirectorypath1.Enabled;

  UnCheckallprofiles1.Enabled := (VirtualStringTree1.RootNodeCount > 0 );
  Checkallprofiles1.Enabled := UnCheckallprofiles1.Enabled;

  Checkallprofiles2.Enabled := Checkallprofiles1.Enabled;
  UnCheckallprofiles2.Enabled := UnCheckallprofiles1.Enabled;


  var ItemNodeData : PItemNodeData := nil;
  var ManualAdded: Boolean := false;

  if Assigned(VirtualStringTree1.FocusedNode) then
      ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);

  if Assigned(ItemNodeData) then
      ManualAdded := ItemNodeData^.h_ManualAdded ;

  DelCustomProfileBtn.Enabled := (CustomProfilePaths.Count > 0) and
  (VirtualStringTree1.RootNodeCount > 0 ) and  ManualAdded  ;

end;

procedure TFormMain.VSTSetCheckState(const b: Boolean);
var
  Node         : PVirtualNode;
  CheckState   : TCheckState;
  ItemNodeData : PItemNodeData;
begin
   if b
   then CheckState := csCheckedNormal
   else CheckState := csUncheckedNormal;

   VirtualStringTree1.BeginUpdate;
   try
     Node :=  VirtualStringTree1.GetFirstLevel(1);
     while Assigned(Node) do
     begin
       VirtualStringTree1.CheckState[Node] := CheckState;
       Node := VirtualStringTree1.GetNextLevel(Node, 1);
     end;
   finally
     VirtualStringTree1.EndUpdate;
   end;
   updateButtonsState(True);
end;

procedure TFormMain.ProgressDlgVisible(const b: Boolean);
begin
  RzPanelProgress.Visible := b;
  RzProgressBar1.PartsComplete := 0;
  RzProgressBar2.PartsComplete := 0;
end;

procedure TFormMain.BeforeProcOptimize;
begin
   CancelOptProc        := False;
   OptimizeBtn.Enabled  := False;
   OptimizeBtn2.Enabled := False;
   MenuButton.Enabled   := False;
   MenuButton2.Enabled  := False;
   RzToolbar1.Enabled   := False;
   RzSplitter1.Enabled  := False;

   Application.ProcessMessages;   {  }
end;

procedure TFormMain.AfterProcOptimize;
begin
  OptimizeBtn.Enabled  := True;
  OptimizeBtn2.Enabled := True;
  MenuButton.Enabled   := True;
  MenuButton2.Enabled  := True;
  RzSplitter1.Enabled  := True;
  RzToolbar1.Enabled   := True;

  if CancelOptProc  then
    RzStatusPane3.Caption := 'optimization canceled.'
  else
    RzStatusPane3.Caption := 'optimization done.';

  ProgressDlgVisible(False);
  if RzSplitter1.LowerRight.Visible then   VirtualStringTree2.Refresh;
  VirtualStringTree1.Refresh;
  updateButtonsState;

  Application.ProcessMessages;
end;


type
  TUTF8EncodingNoBOM = class(TUTF8Encoding)
  public
    function GetPreamble: TBytes; override;
  end;

function TUTF8EncodingNoBOM.GetPreamble: TBytes;
begin
  SetLength(Result, 0);
end;

procedure TFormMain.ProcCreateBAT(const outfile : string);
var
 aTask: ITask;
begin

   aTask := TTask.Create(
   procedure
   var
    i, ProfileNo    : Integer;
    Node            : PVirtualNode;
    BatOut: TArray<string>;
   begin
     TThread.Synchronize(TThread.Current, procedure begin VirtualStringTree1.BeginUpdate; end);

     try
       {$REGION ' Cout checked profiles '}
         var TP: Integer := 0;
         Node :=  VirtualStringTree1.GetFirstLevel(1);
         while Assigned(Node) do
         begin
           if Node.CheckState = csCheckedNormal then Inc(TP);
           Node := VirtualStringTree1.GetNextLevel(Node, 1);
         end;
       {$ENDREGION}

       SetLength(BatOut, 0);
       StaticBatchBegin1( TP.ToString, BatOut);
       ProfileNo := 1;

           Node :=  VirtualStringTree1.GetFirstLevel(1);
           while Assigned(Node) do
           begin
              if Node.CheckState.IsChecked then
              begin
                var ItemNodeData: PItemNodeData;
                ItemNodeData := VirtualStringTree1.GetNodeData(Node);

                StaticBatchAddProfile1(ItemNodeData^.v_ProfileName,
                                        AppNameFromType(ItemNodeData^.h_AppType),
                                        ProfileNo,
                                        IsAppTypeFF(ItemNodeData^.h_AppType),
                                        BatOut
                                       );
                Inc(ProfileNo);
              end;
              Node := VirtualStringTree1.GetNextLevel(Node, 1);
           end;
           StaticBatchEnd1(BatOut);
     finally
        TThread.Synchronize(TThread.Current, procedure begin VirtualStringTree1.EndUpdate; end);

        var EncodingUTF8NoBoom: TEncoding;
        EncodingUTF8NoBoom := TUTF8EncodingNoBOM.Create;
        System.IOUtils.TFile.WriteAllLines( outfile, BatOut, EncodingUTF8NoBoom );
        FreeAndNil(EncodingUTF8NoBoom);
     end;
   end);
   aTask.Start;
end;

procedure TFormMain.ProcOptimize(const selectedOnly: Boolean = False);
var
 aTask: ITask;
begin
   BeforeProcOptimize;

   aTask := TTask.Create(
   procedure
        {
      function CalcRate(before, after: Int64):Integer;
      begin
       result := 0;
         if before = 0 then exit;
         if after = 0 then exit;
         Result := Round( ( (before - after) / before ) * 100) ;
      end;  }

   var
    i               : Integer;
    ProfileFileList : TList<TSearchRec{TSSearchRec}>;
    tmpFileName     : string;
    MaskArray       : TStringDynArray;
    SizeBefore      : Int64;
    SizeAfter       : Int64;
    FilesProcessed  : Integer;
    RateProgress    : Integer;
    FilesCount      : Integer;
    Node            : PVirtualNode;
   begin
     // BeginUpdate
    // TThread.Synchronize(TThread.Current, procedure begin  VirtualStringTree1.BeginUpdate; end);

     try
       // Setup progress =======================================
       {$REGION ' Setup progress '}

       var TP: Integer := 0;
       if selectedOnly then
       begin
         TP := 1;
       end else
       begin
         Node :=  VirtualStringTree1.GetFirstLevel(1);
         while Assigned(Node) do
         begin
           if Node.CheckState = csCheckedNormal then Inc(TP);
           Node := VirtualStringTree1.GetNextLevel(Node, 1);
         end;
       end;

         RzProgressBar2.TotalParts := TP;
         RzProgressBar2.PartsComplete := 0;


         TThread.Synchronize(TThread.Current,
                  procedure
                  begin
                     RzStatusPane3.Caption := 'processing ...';
                     ProgressDlgVisible(True);
                  end);

       {$ENDREGION}

       // Enum Processing
       if selectedOnly then
         Node :=  VirtualStringTree1.FocusedNode
       else
         Node :=  VirtualStringTree1.GetFirstLevel(1);

       while Assigned(Node) do
       begin
          if Node.CheckState.IsChecked or selectedOnly then
          begin
            var ItemNodeData: PItemNodeData;
            ItemNodeData := VirtualStringTree1.GetNodeData(Node);

            if DirectoryExists( IncludeTrailingPathDelimiter( ItemNodeData^.v_ProfileName ) ) then
            begin

              // Reset
              FilesCount     := 0;
              FilesProcessed := 0;
              SizeBefore     := 0;
              SizeAfter      := 0;

              // Setup: MaskArray; Proc: delete_wal, delete_shm
               {$REGION ' Setup: MaskArray; Proc: delete_wal, delete_shm  '}
                  if ItemNodeData^.h_AppType in [100..107] then
                  begin
                     MaskArray := [];

                     if settings_delete_wal or settings_delete_shm then
                     begin
                       if settings_delete_wal then MaskArray := ['*.sqlite-wal'];
                       if settings_delete_shm then MaskArray := MaskArray + ['*.sqlite-shm'];

                       ProfileFileList := ScannDirectory(
                                                   ItemNodeData^.v_ProfileName,
                                                   MaskArray,
                                                   GetMinSizeAsBytes,        // MinSize     0 - any size
                                                   settings_maxscanndepth    // MaxDepth   -1 - any depth
                                                  );

                       for I := 0 to ProfileFileList.Count-1 do
                          DeleteFile( {ProfileFileList[i].Path +}  ProfileFileList[i].Name );


                        ProfileFileList.Free;
                       //FreeSearchList(ProfileFileList);
                     end;

                     MaskArray := ['*.sqlite', '*.db'];
                  end
                  else MaskArray := ['*.*','*'];
               {$ENDREGION}


              // Get profile files
              ProfileFileList := ScannDirectory(
                                             ItemNodeData^.v_ProfileName,
                                             MaskArray,
                                             GetMinSizeAsBytes,        // MinSize     0 - any size
                                             settings_maxscanndepth    // MaxDepth   -1 - any depth
                                            );

              FilesCount := ProfileFileList.Count;

              // Setup Profile progress

              TThread.Synchronize(TThread.Current, procedure
              begin
                RzProgressBar1.PartsComplete := 0;
                RzProgressBar1.TotalParts := FilesCount;
              end);

              // *********** Process optimization ********** //
              For i := 0 to FilesCount-1 do
              begin
                // Check for Cancel
                if CancelOptProc then Break;
                if ProfileFileList[i].Size > 16 then
                begin
                   tmpFileName := {ProfileFileList[i].Path + } ProfileFileList[i].Name ;
                   if IsSQLiteFile(tmpFileName) then
                   begin
                     SizeBefore := SizeBefore + ProfileFileList[i].Size;
                     SQLiteOptimizeFile( tmpFileName );
                     inc(FilesProcessed);
                     SizeAfter := SizeAfter + System.IOUtils.TFile.GetSize( tmpFileName );
                   end;
                end;
                 // *********** Progress bar Profile ********** //
                 TThread.Synchronize(TThread.Current, procedure begin  RzProgressBar1.IncPartsByOne; end);
              end;

              ProfileFileList.Free;
              ProfileFileList := nil;

              // *********** Update GRID values ********** //
              ItemNodeData^.v_SizeBefore   := FormatByteSize( SizeBefore );
              ItemNodeData^.v_SizeAfter    := FormatByteSize( SizeAfter );
              ItemNodeData^.v_FilesCount   := FilesProcessed.ToString;
              ItemNodeData^.h_RateProgress := CalcRate(SizeBefore , SizeAfter );
              ItemNodeData^.v_RateStr      := ItemNodeData^.h_RateProgress.ToString + '%';

              // *********** Progress bar overall (if Optimize Checked) ********** //
              TThread.Synchronize(TThread.Current, procedure begin RzProgressBar2.IncPartsByOne; end);

            end
            else
            begin
              ItemNodeData^.h_PathNotFound := True;
              TThread.Synchronize(TThread.Current, procedure begin RzProgressBar2.IncPartsByOne; end);
            end;
          end;

        if CancelOptProc then Break;

        if selectedOnly then Node := nil else
           Node :=  VirtualStringTree1.GetNextLevel(Node, 1);
       end;

     finally
        // EndUpdate
       // TThread.Synchronize(TThread.Current, procedure begin VirtualStringTree1.EndUpdate; end);

     end;
     AfterProcOptimize;
   end);
   aTask.Start;
end;

procedure TFormMain.ProcOptimizeLOG(const selectedOnly: Boolean = False);
var
 aTask: ITask;
begin
  BeforeProcOptimize;

  {$REGION ' OptimizeProfilesThread '}
   aTask := TTask.Create(
   procedure
    {
      function CalcRate(before, after: Int64):Integer;
      begin
       result := 0;
         if before = 0 then exit;
         if after = 0 then exit;
         Result := Round( ( (before - after) / before ) * 100) ;
      end;

      function DeletePartPath(Path: string; DelCount: Integer): string;
      begin Result := Copy(Path, DelCount+1, Length(Path)-DelCount);  end;

      function ifthenstr(b: Boolean; trueStr, falseStr: string): string;
      begin if b then Result := trueStr else Result := falseStr; end;
      }

   var
    i               : Integer;
    ProfileFileList : TList<{TSSearchRec}TSearchRec>;
    tmpFileName     : string;
    MaskArray       : TStringDynArray;

    profileSizeBefore,
    profileSizeAfter        : Int64;

    profileFilesProcessed,
    profileFilesCount       : Integer;

    Node,
    logNodeStart,
    logNodeProfile : PVirtualNode;

    logProfileNo,

    logProfileDeletedFiles : Integer;

    logFileSizeAfter,
    logProfileDeletedFilesSize,
    logTotalProfilesSizeBefore,
    logTotalProfilesSizeAfter : Int64;

    logTotalFailedProfiles,
    logTotalCheckedProfiles,
    logTotalProfileCount,
    logTotalFilesProcessed,
    logTotalDeletedFiles: Cardinal;

    LogTotalStopwatch: TStopwatch;
    LogTotalElapsed: TTimeSpan;
   begin
     // BeginUpdate
     LogTotalStopwatch := TStopwatch.StartNew;
     TThread.Synchronize(TThread.Current, procedure
     begin
     //  VirtualStringTree1.BeginUpdate;
     //  VirtualStringTree2.BeginUpdate;
     end);

     try
       logTotalCheckedProfiles := 0;  // Checked profiles
       logTotalProfileCount    := 0;  // Total profiles

       // Setup progress =======================================
       {$REGION ' Setup progress '}

       if selectedOnly then
       begin
         logTotalCheckedProfiles := 1;
         logTotalProfileCount := 1;
       end else
       begin
         Node :=  VirtualStringTree1.GetFirstLevel(1);
         while Assigned(Node) do
         begin
           if Node.CheckState = csCheckedNormal then Inc(logTotalCheckedProfiles);
           inc(logTotalProfileCount);
           Node := VirtualStringTree1.GetNextLevel(Node, 1);
         end;
       end;

         RzProgressBar2.TotalParts := logTotalCheckedProfiles;
         RzProgressBar2.PartsComplete := 0;

         TThread.Synchronize(nil,
                  procedure
                  begin
                     RzStatusPane3.Caption := 'processing ...';
                     ProgressDlgVisible(True);
                  end);
       {$ENDREGION}

       logProfileNo               := 0;
       logTotalFailedProfiles     := 0;
       logTotalFilesProcessed     := 0;
       logTotalDeletedFiles       := 0;
       logTotalProfilesSizeBefore := 0;
       logTotalProfilesSizeAfter  := 0;



       TThread.Synchronize(TThread.Current, procedure
       begin
         VirtualStringTree2.BeginUpdate;

          if selectedOnly then

           logNodeStart := LogAdd(nil,
                                 'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                                 'selected profile',
                                 Format('Processed %s of %s, Optimized files: %s, Deleted: %s, Size before: %s, Size after: %s', ['','','','','',''])
                                  )
           else
           logNodeStart := LogAdd(nil,
                                 'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                                 Format('Enabled profiles: %s of %s', [logTotalCheckedProfiles.ToString, logTotalProfileCount.ToString]),
                                 Format('Processed %s of %s, Optimized files: %s, Deleted: %s, Size before: %s, Size after: %s', ['','','','','',''])
                                  );

         VirtualStringTree2.EndUpdate;
       end);

       // Enum Processing
       if selectedOnly then
        Node :=  VirtualStringTree1.FocusedNode
       else
        Node :=  VirtualStringTree1.GetFirstLevel(1);

       while Assigned(Node) do
       begin
          if Node.CheckState.IsChecked or selectedOnly then
          begin
             var ItemNodeData: PItemNodeData;
             ItemNodeData := VirtualStringTree1.GetNodeData(Node);

             inc(logProfileNo);

             if DirectoryExists( IncludeTrailingPathDelimiter( ItemNodeData^.v_ProfileName ) ) then
             begin

                // Reset
                profileFilesCount     := 0;
                profileFilesProcessed := 0;
                profileSizeBefore     := 0;
                profileSizeAfter      := 0;

                logProfileDeletedFiles := 0;
                logProfileDeletedFilesSize := 0;

                TThread.Synchronize(TThread.Current, procedure
                begin
                   VirtualStringTree2.BeginUpdate;
                   logNodeProfile := LogAdd(logNodeStart,
                                                Format('Profile #%s', [logProfileNo.ToString]),
                                                ItemNodeData^.v_ProfileName,
                                                '-'
                                                );
                   VirtualStringTree2.EndUpdate;
                end);


              // Setup: MaskArray; Proc: delete_wal, delete_shm
               {$REGION ' Setup: MaskArray; Proc: delete_wal, delete_shm  '}
                  if ItemNodeData^.h_AppType in [100..107] then
                  begin
                     MaskArray := [];

                     if settings_delete_wal or settings_delete_shm then
                     begin
                       if settings_delete_wal then MaskArray := ['*.sqlite-wal'];
                       if settings_delete_shm then MaskArray := MaskArray + ['*.sqlite-shm'];

                       ProfileFileList := ScannDirectory(
                                                   ItemNodeData^.v_ProfileName,
                                                   MaskArray,
                                                   GetMinSizeAsBytes,        // MinSize     0 - any size
                                                   settings_maxscanndepth    // MaxDepth   -1 - any depth
                                                  );

                       var tmpDeletedBool: Boolean := False;
                       var tmpDeletedFileSZ: Int64 := 0;
                       for I := 0 to ProfileFileList.Count-1 do
                       begin
                          tmpDeletedFileSZ := System.IOUtils.TFile.GetSize( {ProfileFileList[i].Path +} ProfileFileList[i].Name );

                          logProfileDeletedFilesSize := logProfileDeletedFilesSize + tmpDeletedFileSZ;

                          DeleteFile( {ProfileFileList[i].Path +} ProfileFileList[i].Name );

                          tmpDeletedBool := FileExists({ProfileFileList[i].Path +} ProfileFileList[i].Name);

                          if tmpDeletedBool then
                           inc(logProfileDeletedFiles);


                           TThread.Synchronize(TThread.Current, procedure
                           begin
                            VirtualStringTree2.BeginUpdate;
                            LogAdd(LogNodeProfile,
                                   Format('#%d Delete',[(i+1)]),
                                   DeletePartPath({ProfileFileList[i].Path +} ProfileFileList[i].Name, Length(ItemNodeData^.v_ProfileName)),
                                   ifthenstr(tmpDeletedBool, 'Done. (' + FormatByteSize( tmpDeletedFileSZ ) + ')' , 'Fail' )
                                    );

                            VirtualStringTree2.EndUpdate;
                           end);
                       end;

                       ProfileFileList.Free;
                       //FreeSearchList(ProfileFileList);
                     end;

                     MaskArray := ['*.sqlite', '*.db'];
                  end
                  else MaskArray := ['*.*','*'];
               {$ENDREGION}


                // Get profile files
                ProfileFileList := ScannDirectory(
                                               ItemNodeData^.v_ProfileName,
                                               MaskArray,
                                               GetMinSizeAsBytes,        // MinSize     0 - any size
                                               settings_maxscanndepth    // MaxDepth   -1 - any depth
                                              );

                profileFilesCount := ProfileFileList.Count;

                // Setup Profile progress

                 TThread.Synchronize(TThread.Current, procedure
                 begin
                      RzProgressBar1.PartsComplete := 0;
                      RzProgressBar1.TotalParts := profileFilesCount;
                 end);

                // *********** Process optimization ********** //
                For i := 0 to profileFilesCount-1 do
                begin
                   if CancelOptProc then Break;
                   if ProfileFileList[i].Size > 16 then
                   begin
                       tmpFileName := {ProfileFileList[i].Path +} ProfileFileList[i].Name ;
                       if IsSQLiteFile(tmpFileName) then
                       begin
                         logFileSizeAfter := 0;
                         ProfileSizeBefore := ProfileSizeBefore + ProfileFileList[i].Size;
                         SQLiteOptimizeFile( tmpFileName );
                         inc(profileFilesProcessed);
                         logFileSizeAfter := System.IOUtils.TFile.GetSize( tmpFileName );
                         ProfileSizeAfter := ProfileSizeAfter + logFileSizeAfter;

                         TThread.Synchronize(TThread.Current, procedure
                         begin
                           VirtualStringTree2.BeginUpdate;

                           //TThread.Synchronize(nil, procedure begin    end);
                           LogAdd(LogNodeProfile,
                                  Format('#%d Optimization',[(profileFilesProcessed)]),
                                  DeletePartPath(tmpFileName, Length(ItemNodeData^.v_ProfileName) ),
                                  Format( 'Done. Size before: %s, Size after: %s', [ FormatByteSize(ProfileFileList[i].Size), FormatByteSize(logFileSizeAfter) ])
                                  );
                            VirtualStringTree2.EndUpdate;
                         end);

                       end;
                   end;
                   // *********** Progress bar Profile ********** //
                   TThread.Synchronize(TThread.Current, procedure begin  RzProgressBar1.IncPartsByOne; end);
                end;

                ProfileFileList.Free;

                // *********** Update GRID values ********** //
                ItemNodeData^.v_SizeBefore   := FormatByteSize( ProfileSizeBefore );
                ItemNodeData^.v_SizeAfter    := FormatByteSize( ProfileSizeAfter );
                ItemNodeData^.v_FilesCount   := profileFilesProcessed.ToString;
                ItemNodeData^.h_RateProgress := CalcRate(ProfileSizeBefore , ProfileSizeAfter );
                ItemNodeData^.v_RateStr      := ItemNodeData^.h_RateProgress.ToString + '%';

                logTotalFilesProcessed := logTotalFilesProcessed + profileFilesProcessed;
                logTotalDeletedFiles := logTotalDeletedFiles + logProfileDeletedFiles;

                logTotalProfilesSizeBefore := logTotalProfilesSizeBefore + ProfileSizeBefore;
                logTotalProfilesSizeAfter := logTotalProfilesSizeAfter + ProfileSizeAfter;


                TThread.Synchronize(TThread.Current, procedure
                begin
                  VirtualStringTree2.BeginUpdate;

                   LogEdit(logNodeProfile,
                          Format('Profile #%s', [logProfileNo.ToString]),
                          ItemNodeData^.v_ProfileName,
                          Format('Optimized files: %s, Deleted: %s, Size before: %s, Size after: %s',
                                 [profileFilesProcessed.ToString,
                                  logProfileDeletedFiles.ToString,
                                  FormatByteSize( ProfileSizeBefore ),
                                  FormatByteSize( ProfileSizeAfter )
                                  ])
                                );

                  VirtualStringTree2.EndUpdate;
                end);



                // *********** Progress bar overall (if Optimize Checked) ********** //
                TThread.Synchronize(TThread.Current, procedure begin RzProgressBar2.IncPartsByOne; end);
             end else
             begin
               inc(logTotalFailedProfiles);


                TThread.Synchronize(TThread.Current, procedure
                begin
                  VirtualStringTree2.BeginUpdate;

                  logNodeProfile := LogAdd(logNodeStart,
                                          Format('Profile #%s', [logProfileNo.ToString]),
                                          ItemNodeData^.v_ProfileName,
                                          'Fail. Profile path not found.'
                                          );


                  VirtualStringTree2.EndUpdate;
                end);


               ItemNodeData^.h_PathNotFound := True;
               TThread.Synchronize(TThread.Current, procedure begin RzProgressBar2.IncPartsByOne; end);
             end;
          end;

        if CancelOptProc then Break;

        if selectedOnly then Node := nil else
        Node :=  VirtualStringTree1.GetNextLevel(Node, 1);
       end;

     finally
       LogTotalElapsed := LogTotalStopwatch.Elapsed;

       var ElapsedTimeStr: string;
       if LogTotalElapsed.Seconds = 0 then
           ElapsedTimeStr  := '0.' + LogTotalElapsed.Milliseconds.ToString
       else
           ElapsedTimeStr  :=  LogTotalElapsed.Seconds.ToString;


        TThread.Synchronize(TThread.Current, procedure
        begin
         VirtualStringTree2.BeginUpdate;
             LogEdit(LogNodeStart,
                     '',//'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                     '',//Format('Enabled profiles: %s of %s', [TP.ToString, AP.ToString]),
                     Format( 'Completed in: ~%s sec. Processed %s of %s profiles. Files optimize: %s, deleted: %s, size before: %s, size after: %s',
                            [
                            ElapsedTimeStr,
                            (logTotalCheckedProfiles-logTotalFailedProfiles).ToString,
                            logTotalCheckedProfiles.ToString,
                            logTotalFilesProcessed.ToString,
                            logTotalDeletedFiles.ToString,
                            FormatByteSize( logTotalProfilesSizeBefore),
                            FormatByteSize( logTotalProfilesSizeAfter)]
                            )
                     );
         VirtualStringTree2.EndUpdate;
        end);



       { TThread.Synchronize(TThread.Current, procedure
        begin
         VirtualStringTree2.EndUpdate;
          VirtualStringTree1.EndUpdate;
        end); }
     end;
     AfterProcOptimize;
   end);
  {$ENDREGION}

  aTask.Start;

end;

procedure TFormMain.CustomProfileDeleteSelected;

  function KeyIndexOf(const S: TStrings; const Text: string): Integer;
  begin
    for Result := 0 to S.Count-1 do
     if CompareText(Text, S.KeyNames[Result] ) = 0 then Exit;
    Exit(-1);
  end;

var
 i: Integer;
 ItemNodeData : PItemNodeData;
 Level1Node : PVirtualNode;
begin
  ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);
  if Not Assigned(ItemNodeData) then exit;

  if not ItemNodeData^.h_ManualAdded then Exit;

  VirtualStringTree1.BeginUpdate;
  try
    // if Root selected then delete al custom profiles
    if VirtualStringTree1.FocusedNode.ChildCount > 0 then
    begin
       Level1Node := VirtualStringTree1.FocusedNode.FirstChild;
       while Assigned(Level1Node) do
       begin
         ItemNodeData := VirtualStringTree1.GetNodeData(Level1Node);
         if assigned(ItemNodeData) then
         begin
           i := KeyIndexOf(CustomProfilePaths, ItemNodeData^.v_ProfileName );
           if i > -1 then CustomProfilePaths.Delete(i);
         end;
         Level1Node := Level1Node.NextSibling;
       end;
       VirtualStringTree1.DeleteSelectedNodes;
    end else
    // Delete selected profile
    begin
      i := KeyIndexOf(CustomProfilePaths, ItemNodeData^.v_ProfileName );
      if i > -1 then
      begin
        CustomProfilePaths.Delete(i);

        if VirtualStringTree1.FocusedNode.Parent.ChildCount = 1 then
          VirtualStringTree1.DeleteNode(VirtualStringTree1.FocusedNode.Parent)
        else
          VirtualStringTree1.DeleteSelectedNodes;

      end;

    end;
  finally
    VirtualStringTree1.EndUpdate;
  end;

  updateButtonsState(true);
end;

procedure TFormMain.AddProfileDlg(const DefProfilePath : string = ''; defAppType: Integer = 0);
begin
   Application.CreateForm(TAddProfileDlgForm, AddProfileDlgForm);
   try
     AddProfileDlgForm.Edit1.Text := DefProfilePath;
     if defAppType = -1 then
      AddProfileDlgForm.ComboBoxEx1.ItemIndex := add_profiledlg_last_cbindex
     else
      AddProfileDlgForm.ComboBoxEx1.ItemIndex := defAppType;


     if AddProfileDlgForm.ShowModal <> mrOk then  Exit;

     var ProfilePath: string := AddProfileDlgForm.ProfileDirectory;
     var appType: integer := AddProfileDlgForm.ProfileAppType;
     AddProfile(ProfilePath, appType, true);

   finally
     add_profiledlg_last_cbindex := AddProfileDlgForm.ComboBoxEx1.ItemIndex;
     AddProfileDlgForm.Free;
   end;
end;

//https://stackoverflow.com/questions/4618743/how-to-make-messagedlg-centered-on-owner-form
function MessageDlgCenter(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): Integer;
var R: TRect;
begin
  if not Assigned(Screen.ActiveForm) then
  begin
    Result := MessageDlg(Msg, DlgType, Buttons, 0);
  end else
  begin
    with CreateMessageDialog(Msg, DlgType, Buttons) do
    try
      GetWindowRect(Screen.ActiveForm.Handle, R);
      Left := R.Left + ((R.Right - R.Left) div 2) - (Width div 2);
      Top := R.Top + ((R.Bottom - R.Top) div 2) - (Height div 2);
      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;

const
  CNST_PROFILE_ADD_OK = -1;

procedure TFormMain.AddProfile(const pPath: String; const AppType: Integer = 0; const ManualAdded: Boolean = false);
begin
  if AddProfileToList(pPath, appType) = CNST_PROFILE_ADD_OK
    then AddProfileToVST(pPath, appType, ManualAdded) else
    MessageDlgCenter('Profile path already in list', mtInformation, [mbOK]);

  updateButtonsState;
end;

function TFormMain.AddProfileToList(const pPath: string; const pAppType: Integer): Integer;
begin
   CustomProfilePaths.NameValueSeparator := '|';

   Result:= CustomProfilePaths.IndexOfName(pPath);
   if Result > CNST_PROFILE_ADD_OK then Exit;

   Result:=  CustomProfilePaths.IndexOf(pPath);
   if Result > CNST_PROFILE_ADD_OK then Exit;

   Result := CNST_PROFILE_ADD_OK;
   CustomProfilePaths.Add( pPath + '|' + pAppType.ToString  );
end;

function TFormMain.AddProfileToVST(const pPath: string; const pAppType: Integer; const ManualAdded: Boolean = false): Integer;

const
 RESULT_PROFILE_ALREADY_EXISTS = -1;
 RESULT_PROFILE_ADDED          =  0;

var
  RootNode, CildNode : PVirtualNode;
  ItemNodeData       : PItemNodeData;
begin
  result := RESULT_PROFILE_ADDED;

  // Search for existing profile
  CildNode :=  VirtualStringTree1.GetFirstLevel(1);
  while Assigned(CildNode) do
  begin
    ItemNodeData := VirtualStringTree1.GetNodeData(CildNode);
    if Assigned(ItemNodeData) then
     if CompareText( ItemNodeData^.v_ProfileName, pPath) = 0 then
      begin
        Result := RESULT_PROFILE_ALREADY_EXISTS;
        Exit;
      end;

     CildNode := VirtualStringTree1.GetNextLevel(CildNode, 1);
  end;

  if pAppType > 0 then
  //=================================================================================
  // apptype > 0
  //=================================================================================
  begin
        // Search for root node
        RootNode :=  VirtualStringTree1.GetFirstLevel(0);
        while Assigned(RootNode) do
        begin
          ItemNodeData := VirtualStringTree1.GetNodeData(RootNode);
          if Assigned(ItemNodeData) then
           if ItemNodeData^.h_AppType = pAppType then  Break;

           RootNode := VirtualStringTree1.GetNextLevel(RootNode, 0);
        end;

        // If Root node not exists, then create it
        if not Assigned(RootNode)  then
        begin
           RootNode := VirtualStringTree1.AddChild(nil);
           RootNode.CheckType := ctTriStateCheckBox ;// ctCheckBox;
           Include( RootNode.States, vsExpanded);
           ItemNodeData := VirtualStringTree1.GetNodeData(RootNode);
           if Assigned(ItemNodeData) then
           with ItemNodeData^ do
           begin
              v_ProfileName := AppNameFromType(pAppType);
              h_AppType     := pAppType;
              v_FilesCount  := '';
              v_SizeBefore  := '';
              v_SizeAfter   := '';
              v_RateStr     := '';
           end;
        end;

         // Add child node (profile path)
         CildNode := VirtualStringTree1.AddChild(RootNode);
         CildNode.CheckType := ctCheckBox;// ctTriStateCheckBox ;// ctCheckBox;

         // Bug-fix
         VirtualStringTree1.CheckState[CildNode] := csCheckedNormal;

         if ProfilePathIsDisabled(pPath, DisabledProfiles)
         then VirtualStringTree1.CheckState[CildNode] := csUnCheckedNormal
         else VirtualStringTree1.CheckState[CildNode] := csCheckedNormal;

         ItemNodeData := VirtualStringTree1.GetNodeData(CildNode);
         if Assigned(ItemNodeData) then
            with ItemNodeData^ do
            begin
              v_ProfileName   :=  pPath;
              h_AppType   :=  pAppType;
              v_FilesCount    :=  '';
              v_SizeBefore    :=  '';
              v_SizeAfter     :=  '';
              v_RateStr       :=  '';
              h_RateProgress  :=  0;
              h_ManualAdded   :=  ManualAdded;
              h_PathNotFound  :=  not DirectoryExists(pPath) ;
            end;

  end
  else
  //=================================================================================
  // PROFILE_TYPE_UNDEFINED
  //=================================================================================
  begin
      // Check root node if exists
      RootNode :=  VirtualStringTree1.GetFirstLevel(0);
      while Assigned(RootNode) do
      begin
        ItemNodeData := VirtualStringTree1.GetNodeData(RootNode);
        if Assigned(ItemNodeData) then
         if ItemNodeData^.h_AppType = PROFILE_TYPE_UNDEFINED then  Break;

         RootNode := VirtualStringTree1.GetNextLevel(RootNode, 0);
      end;

      // If root not node exists then create Root node
      if not Assigned(RootNode)  then
      begin
         RootNode := VirtualStringTree1.AddChild(nil);
         RootNode.CheckType := ctTriStateCheckBox ;// ctCheckBox;
         Include( RootNode.States, vsExpanded);
         ItemNodeData := VirtualStringTree1.GetNodeData(RootNode);
         if Assigned(ItemNodeData) then
         with ItemNodeData^ do
         begin
            v_ProfileName := 'Undefined profiles';
            h_AppType :=  PROFILE_TYPE_UNDEFINED; //PROFILE_TYPE_UNDEFINED
            v_FilesCount  := '';
            v_SizeBefore  := '';
            v_SizeAfter   := '';
            v_RateStr     := '';
         end;
      end;

       // Add child node (profile path)
       CildNode := VirtualStringTree1.AddChild(RootNode);
       CildNode.CheckType := ctCheckBox;// ctTriStateCheckBox ;// ctCheckBox;

       // Bug-fix
       VirtualStringTree1.CheckState[CildNode] := csCheckedNormal;

       if ProfilePathIsDisabled(pPath, DisabledProfiles)
       then VirtualStringTree1.CheckState[CildNode] := csUnCheckedNormal
       else VirtualStringTree1.CheckState[CildNode] := csCheckedNormal;

       ItemNodeData := VirtualStringTree1.GetNodeData(CildNode);
       if Assigned(ItemNodeData) then
          with ItemNodeData^ do
          begin
            v_ProfileName  :=  pPath;
            h_AppType  :=  PROFILE_TYPE_UNDEFINED;
            v_FilesCount   :=  '';
            v_SizeBefore   :=  '';
            v_SizeAfter    :=  '';
            v_RateStr      :=  '';
            h_RateProgress :=  0;
            h_ManualAdded  :=  ManualAdded;
            h_PathNotFound :=  not DirectoryExists(pPath) ;
          end;
  end;

end;

procedure TFormMain.ProcSearchProfiles;
var
 i, j               : Integer;
 VTNode, VTRootNode : PVirtualNode;
 ItemNodeData       : PItemNodeData;
begin

   VirtualStringTree1.RootNodeCount := 0;
   VirtualStringTree1.Clear;

   FreeSearchProfilesResult(SearchProfilesResult);
   SearchProfilesResult := GetProfilesA;

   // Add searched profiles
   VirtualStringTree1.BeginUpdate;
   try
     // Found profiles
     for j := 0 to SearchProfilesResult.Count-1 do
     begin
       VTRootNode := VirtualStringTree1.AddChild(nil);
       VTRootNode.CheckType := ctTriStateCheckBox ;// ctCheckBox;
       Include( VTRootNode.States, vsExpanded);
       ItemNodeData := VirtualStringTree1.GetNodeData(VTRootNode);
       if Assigned(ItemNodeData) then
       with ItemNodeData^ do
       begin
          v_ProfileName := SearchProfilesResult[j].appName;
          h_AppType     := SearchProfilesResult[j].appType;
          v_FilesCount  := '';
          v_SizeBefore  := '';
          v_SizeAfter   := '';
          v_RateStr     := '';
       end;
       // ------------------------------------------------
        for i := 0 to SearchProfilesResult[j].appProfiles.Count-1 do
        begin
          VTNode := VirtualStringTree1.AddChild(VTRootNode);
          VTNode.CheckType := ctCheckBox;

          // Bug-fix
          VirtualStringTree1.CheckState[VTNode] := csCheckedNormal;

          if ProfilePathIsDisabled(SearchProfilesResult[j].appProfiles[i], DisabledProfiles)
          then VirtualStringTree1.CheckState[VTNode] := csUnCheckedNormal
          else VirtualStringTree1.CheckState[VTNode] := csCheckedNormal;

          ItemNodeData := VirtualStringTree1.GetNodeData(VTNode);
          if Assigned(ItemNodeData) then
          with ItemNodeData^ do
          begin
            v_ProfileName   := SearchProfilesResult[j].appProfiles[i];
            h_AppType       := SearchProfilesResult[j].appType;
            v_FilesCount    := '';
            v_SizeBefore    := '';
            v_SizeAfter     := '';
            v_RateStr       := '';
            h_RateProgress  := 0;
            h_PathNotFound  := False;
          end;
        end;
     end;

   finally
    VirtualStringTree1.EndUpdate;
   end;

   // Add Undefined profiles
   VirtualStringTree1.BeginUpdate;
   try
     if CustomProfilePaths.Count > 0 then
     for i := 0 to CustomProfilePaths.Count-1 do
     begin
        var appInx: integer := {0} PROFILE_TYPE_UNDEFINED;
        appInx := StrToIntDef( CustomProfilePaths.ValueFromIndex[i] , {0} PROFILE_TYPE_UNDEFINED);

        if trim( CustomProfilePaths.Strings[i] ).Length > 0 then
         AddProfileToVST( CustomProfilePaths.KeyNames[i], appInx, True);
     end;
   finally
     VirtualStringTree1.EndUpdate;
   end;

  // Add profiles from Desktop shortcuts
  if settings_searchlnkdesktop then
  begin
     var DesktopLNKListList : TList<TSearchRec{TSSearchRec}>;
     DesktopLNKListList := ScannDirectory( GetSpecialFolderPath(CSIDL_DESKTOP),
                                            ['*.lnk'],
                                            0,   // MinSize     0 - any size
                                            1    // MaxDepth   -1 - any depth
                                            );

     VirtualStringTree1.BeginUpdate;
     try
       var profilePath: string := '';
       var appType: Integer;
       var _target, _argument: string;
       for I := 0 to DesktopLNKListList.Count-1 do
       if GetLnkFile({DesktopLNKListList[i].Path +} DesktopLNKListList[i].Name, _target, _argument) = 1 {RESULT_LNK_TO_CHROMED_PROFILE} then
       begin
         appType := GetChromedProfileInfo(_target, _argument, ProfilePath);
         if appType in [RESULT_LNK_TO_DIRECTORY, RESULT_LNK_TO_CHROMED_USERDATADIR]   then
           AddProfileToVST(ProfilePath, appType);
       end;
     finally
       DesktopLNKListList.Free;
       VirtualStringTree1.EndUpdate;
     end;
  end;

  // Add profiles from StartMenu shortcuts
  if settings_searchlnksmenu then
  begin
     var StartMenuLNKListList : TList<TSearchRec{TSSearchRec}>;
     StartMenuLNKListList := ScannDirectory( GetSpecialFolderPath(CSIDL_STARTMENU),
                                              ['*.lnk'],
                                              0,   // MinSize     0 - any size
                                              2    // MaxDepth   -1 - any depth
                                              );
     VirtualStringTree1.BeginUpdate;
     try
       var profilePath: string := '';
       var appType: Integer;
       var _target, _argument: string;
       for I := 0 to StartMenuLNKListList.Count-1 do
       if GetLnkFile({StartMenuLNKListList[i].Path +} StartMenuLNKListList[i].Name, _target, _argument) = 1 {RESULT_LNK_TO_CHROMED_PROFILE} then
       begin
         appType := GetChromedProfileInfo(_target, _argument, ProfilePath);
         if appType in [RESULT_LNK_TO_DIRECTORY, RESULT_LNK_TO_CHROMED_USERDATADIR] then
          AddProfileToVST(ProfilePath, appType);
       end;
     finally
       StartMenuLNKListList.Free;
       VirtualStringTree1.EndUpdate;
     end;
  end;

  updateButtonsState;
end;

procedure TFormMain.CollectDisabledProfiles;
var CliNode: PVirtualNode;
    ItemNodeData : PItemNodeData;
begin
 DisabledProfiles := [];
    CliNode :=  VirtualStringTree1.GetFirstLevel(1);
    while Assigned(CliNode) do
    begin
      if CliNode.CheckState.IsUnChecked then
      begin
        ItemNodeData := VirtualStringTree1.GetNodeData(CliNode);
        if Assigned(ItemNodeData) then
        begin
           DisabledProfiles := DisabledProfiles + [ItemNodeData^.v_ProfileName];
        end;
      end;
      CliNode := VirtualStringTree1.GetNextLevel(CliNode, 1);
    end;
end;


{$ENDREGION}

{$REGION ' Popup events '}

procedure TFormMain.Act1Click(Sender: TObject);
begin
  var tg: Integer;
  {$IFDEF DEBUGMODE}
  if Sender is TMenuItem  then  tg:= TMenuItem(Sender).Tag;
   case tg of

     0: ShowObjectInspectorForm(VirtualStringTree1, Rect(Left+Width+10, Top, Left+Width+10+400, Top+Height), True);
     1: ShowObjectInspectorForm(FormMain, Rect(Left+Width+10, Top, Left+Width+10+400, Top+Height), True);
     2:
      begin
        Checkallprofiles2.ImageIndex := 16;
        UnCheckallprofiles2.ImageIndex := 17;
        UnCheckallprofiles1.ImageIndex := 17;
        Checkallprofiles1.ImageIndex := 16;
        MenuButton2.ImageIndex := 18;
        MenuButton.ImageIndex := 18;
        info1.ImageIndex := 19;
        TStyleManager.TrySetStyle('Windows11 Modern Light');
        // FormMain.StyleName := TStyleManager.ActiveStyle.Name;
      end;

     3:
      begin
        Checkallprofiles2.ImageIndex := 9;
        UnCheckallprofiles2.ImageIndex := 10;
        UnCheckallprofiles1.ImageIndex := 10;
        Checkallprofiles1.ImageIndex := 9;
        MenuButton2.ImageIndex := 0;
        MenuButton.ImageIndex := 0;
        info1.ImageIndex := 12;
        TStyleManager.TrySetStyle('Windows11 Modern Dark');
        // FormMain.StyleName := TStyleManager.ActiveStyle.Name;
      end;
   end;
 {$ENDIF}
end;

procedure TFormMain.ActionsClickClick(Sender: TObject);
begin
  var tg: Integer;
  if Sender is TMenuItem     then  tg:= TMenuItem(Sender).Tag;
  if Sender is TRzToolButton then  tg:= TRzToolButton(Sender).Tag;

   case tg{TMenuItem(Sender).Tag} of

     1: begin
           CollectDisabledProfiles;
           procSearchProfiles;
        end;

     2: AddProfileDlg('',-1);

     3: CustomProfileDeleteSelected;

     4: VSTSetCheckState(True);

     5: VSTSetCheckState(False);

     6: begin  //open profile dir
          if not Assigned(VirtualStringTree1.FocusedNode) then Exit;
          var s: string;
          var ItemNodeData : PItemNodeData := nil;
          ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);
          if not Assigned(ItemNodeData) then Exit;
          s := ItemNodeData^.v_ProfileName;
          ShellExecute(0, nil, 'explorer.exe', PWideChar('/select,' + s), nil, SW_SHOWNORMAL) ; {}
        end;

     7: begin //Copy profile directory path
          if not Assigned(VirtualStringTree1.FocusedNode) then Exit;
          var s: string;
          var ItemNodeData : PItemNodeData := nil;
          ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);
          if not Assigned(ItemNodeData) then Exit;
          s := ItemNodeData^.v_ProfileName;
          Vcl.Clipbrd.Clipboard.SetTextBuf( PWideChar(S) );
        end;

     8:  SettingsBtnClick(nil); //settings

     9:
          try
            Application.CreateForm(TfrmInfo, frmInfo);
            frmInfo.ShowModal;
          finally
            frmInfo.Free;
          end;

     10: if FileSaveDialog1.Execute then
            // if createdfile then
             ProcCreateBAT( FileSaveDialog1.FileName );

   end;
end;

procedure TFormMain.PopupMenu1Popup(Sender: TObject);
begin
  updateButtonsState;
end;

procedure TFormMain.SettingsBtnClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSettings, frmSettings);
  try
    with frmSettings do
    begin
       Edit1.Text := settings_minfilesizeValue.ToString;
       ComboBox1.ItemIndex := settings_minfilesizeType;

       if settings_maxscanndepth = -1
       then Edit2.Text := '0'
       else Edit2.Text := settings_maxscanndepth.ToString;

       if settings_delete_wal       then ToggleSwitch1.State := tssOn else ToggleSwitch1.State := tssOff;
       if settings_delete_shm       then ToggleSwitch2.State := tssOn else ToggleSwitch2.State := tssOff;
       if settings_showhint         then ToggleSwitch3.State := tssOn else ToggleSwitch3.State := tssOff;
       if settings_showlog          then ToggleSwitch4.State := tssOn else ToggleSwitch4.State := tssOff;
       if settings_searchlnkdesktop then ToggleSwitch5.State := tssOn else ToggleSwitch5.State := tssOff;
       if settings_searchlnksmenu   then ToggleSwitch6.State := tssOn else ToggleSwitch6.State := tssOff;
       if settings_captiontoolbar   then ToggleSwitch7.State := tssOn else ToggleSwitch7.State := tssOff;

       ComboBox2.ItemIndex := settings_ThemeStyle;
    end;

    if frmSettings.ShowModal = mrOk then
    begin

      // MinSize  "0" - any size
      settings_minfilesizeValue := StrToInt(frmSettings.Edit1.Text);
      settings_minfilesizeType := frmSettings.ComboBox1.ItemIndex ;

      // MaxDepth   "-1" - any depth
      settings_maxscanndepth := StrToInt(frmSettings.Edit2.Text);
      if settings_maxscanndepth = 0 then settings_maxscanndepth := -1;

      settings_delete_wal        := frmSettings.ToggleSwitch1.State = tssOn;
      settings_delete_shm        := frmSettings.ToggleSwitch2.State = tssOn;
      settings_showhint          := frmSettings.ToggleSwitch3.State = tssOn;
      settings_showlog           := frmSettings.ToggleSwitch4.State = tssOn;
      settings_searchlnkdesktop  := frmSettings.ToggleSwitch5.State = tssOn;
      settings_searchlnksmenu    := frmSettings.ToggleSwitch6.State = tssOn;
      settings_captiontoolbar    := frmSettings.ToggleSwitch7.State = tssOn;
      settings_ThemeStyle        := frmSettings.ComboBox2.ItemIndex;

      FormMain.ShowHint              := settings_showhint;
      Application.ShowHint           := settings_showhint;
      RzSplitter1.LowerRight.Visible := settings_showlog;

      if IsAeroEnabled.ToInteger <> 0  then
      if settings_captiontoolbar then
      begin
         RzToolbar1.Visible := False ;

         TitleBarPanel1.OnPaint := TitleBarPanel1Paint;
         FormMain.CustomTitleBar.Control := TitleBarPanel1;
         FormMain.CustomTitleBar.Enabled := True;
         TitleBarPanel1.Enabled := True;
         TitleBarPanel1.Visible := True;
         TitleBarPanel1.Show;
      end else
      begin
         TitleBarPanel1.OnPaint := nil;
         FormMain.CustomTitleBar.Control := nil;
         FormMain.CustomTitleBar.Enabled := False;
         TitleBarPanel1.Enabled := False;
         TitleBarPanel1.Visible := False;
         TitleBarPanel1.Hide;

         RzToolbar1.Visible := True ;
      end;

      ApplyTheme(True);
    end;
  finally
    frmSettings.Free;
  end;
end;

procedure TFormMain.OptimizeBtnClick(Sender: TObject);
begin
 if settings_showlog then ProcOptimizeLOG else ProcOptimize;
end;

procedure TFormMain.Optimizeselectedprofile1Click(Sender: TObject);
begin
 if settings_showlog then ProcOptimizeLOG(True) else ProcOptimize(True);
end;

{$ENDREGION}

{$REGION ' VST '}

procedure TFormMain.VirtualStringTree1BeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
var
   LRect:Trect;
   ItemNodeData: PItemNodeData;
   D: Double;
begin
  if Column <> VST_RATE_COLUMN_INDEX then Exit;
  if Sender.GetNodeLevel(Node) = 0 then  Exit;

  ItemNodeData := Sender.GetNodeData(Node);
  if Assigned(ItemNodeData) then
  with TargetCanvas do
  begin
    FillRect(CellRect);
    Brush.Color := VST_PROGRESS_BAR_COLOR;
    LRect := CellRect;
    D := (LRect.Width / 100) * ItemNodeData^.h_RateProgress ;
    LRect.Width := Round(D);
    FillRect(LRect);
  end;
end;

procedure TFormMain.VirtualStringTree1Checked(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  updateButtonsState(true);
end;

procedure TFormMain.VirtualStringTree1DrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
  var
  ItemNodeData: PItemNodeData;
begin
  if Node.ChildCount > 0 then exit;

  ItemNodeData := Sender.GetNodeData(Node);
  if ItemNodeData^.h_PathNotFound then
   TargetCanvas.Font.Style := [fsStrikeOut];

end;

procedure TFormMain.VirtualStringTree1FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  ItemNodeData: PItemNodeData;
begin
  ItemNodeData := Sender.GetNodeData(Node);
  // Explicitely free the string, the VCL cannot know that there is one but needs to free
  // it nonetheless. For more fields in such a record which must be freed use Finalize(Data^) instead touching
  // every member individually.
  Finalize(ItemNodeData^);
end;

procedure TFormMain.VirtualStringTree1GetImageIndexEx(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex; var ImageList: TCustomImageList);
var
  ItemNodeData: PItemNodeData;
begin
  if Column > 0 then Exit;

  ImageIndex := -1;

  if Kind = ikState then Exit;    // ikNormal, ikSelected, ikState, ikOverlay

  ItemNodeData := Sender.GetNodeData(Node);

  if not Assigned(ItemNodeData) then Exit;


  // DataModule1.SVGIconImageList2.Size := 24;

  // ImageList := DataModule1.SVGIconImageList2;
  ImageList := DataModule1.SVGIconVirtualImageList2;

  if Node.ChildCount = 0 then
    ImageIndex :=  26
  else
    ImageIndex := AppImageIndexFromType( ItemNodeData^.h_AppType );

end;

procedure TFormMain.VirtualStringTree1GetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var CellText: string);
var
  ItemNodeData: PItemNodeData;
begin
  ItemNodeData := Sender.GetNodeData(Node);
  if Assigned(ItemNodeData) then
    case Column of
      VST_PROFILENAME_COLUMN_INDEX:
                                    case TextType of
                                      ttNormal: CellText := ItemNodeData^.v_ProfileName;
                                      ttStatic: CellText := '';
                                    end;

      VST_FILESCOUNT_COLUMN_INDEX : CellText := ItemNodeData^.v_FilesCount;
      VST_SIZEBEFORE_COLUMN_INDEX : CellText := ItemNodeData^.v_SizeBefore;
      VST_SIZEAFTER_COLUMN_INDEX  : CellText := ItemNodeData^.v_SizeAfter;
      VST_RATE_COLUMN_INDEX       : CellText := ItemNodeData^.v_RateStr;

     { case TextType of
        ttNormal: CellText := ItemNodeData^.v_ProfileName;
        ttStatic: CellText := '(' + ItemNodeData^.v_ProfileName + ')';
       end;  }
    end;
end;

procedure TFormMain.VirtualStringTree1NodeClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
begin
 updateButtonsState;
end;

{$ENDREGION}

{$REGION ' LOG, VST '}

procedure TFormMain.PopupMenu2Popup(Sender: TObject);
begin
  //
  Gotofile1.Enabled := False;
  Copy1.Enabled := False;
  Copy1.Caption :='Copy';
  Gotofile1.Caption :=  'Open';

  if VirtualStringTree2.FocusedNode = nil then Exit;
  if VirtualStringTree2.RootNodeCount = 0 then Exit;

  Copy1.Enabled := True;

  var gLevel: integer := VirtualStringTree2.GetNodeLevel( VirtualStringTree2.FocusedNode )  ;
  Gotofile1.Enabled := gLevel in [2, 1];
  case gLevel of
    2: begin Gotofile1.Caption :=  'Open selected file in explorer';   Copy1.Caption :='Copy selected file';    end;
    1: begin Gotofile1.Caption :=  'Open selected path in explorer';   Copy1.Caption :='Copy profile file(s)';    end;
    0: Copy1.Caption :='Copy profile(s) and files';
  end;

end;

procedure TFormMain.Gotofile1Click(Sender: TObject);
var
  LOGItemNodeData : PLOGItemNodeData;
  NodeLevel1, NodeLevel2: PVirtualNode;
  list, ProfileRootPath: string;
begin
  // GotoFile
  LOGItemNodeData := VirtualStringTree2.GetNodeData(VirtualStringTree2.FocusedNode.Parent );
  if Assigned(LOGItemNodeData) then
    ProfileRootPath :=  LOGItemNodeData^.ProcValue;

  LOGItemNodeData := VirtualStringTree2.GetNodeData(VirtualStringTree2.FocusedNode);
  if Assigned(LOGItemNodeData) then
     list := ProfileRootPath + LOGItemNodeData^.ProcValue;

  Vcl.Clipbrd.Clipboard.SetTextBuf( PWideChar(list) );
end;

procedure TFormMain.Copy1Click(Sender: TObject);
var
  LOGItemNodeData : PLOGItemNodeData;
  NodeLevel1, NodeLevel2: PVirtualNode;
  list, ProfileRootPath: string;
begin
  case VirtualStringTree2.GetNodeLevel( VirtualStringTree2.FocusedNode )  of

   // Copy all profiles
   0: begin
         list := '';

         NodeLevel1 := VirtualStringTree2.GetFirstChild( VirtualStringTree2.FocusedNode );
         while NodeLevel1 <> nil do
         begin
           LOGItemNodeData := VirtualStringTree2.GetNodeData(NodeLevel1);
           if Assigned(LOGItemNodeData) then
           begin
              list :=  list  + '===================='+ #13#10 + LOGItemNodeData^.ProcName + ' | ' +  LOGItemNodeData^.ProcValue + ' | ' + LOGItemNodeData^.ProcResult  + #13#10 + '====================' + #13#10;
              ProfileRootPath := LOGItemNodeData^.ProcValue;
           end;

               NodeLevel2 := VirtualStringTree2.GetFirstChild( NodeLevel1 );
               while NodeLevel2 <> nil do
               begin
                 LOGItemNodeData := VirtualStringTree2.GetNodeData(NodeLevel2);
                   if Assigned(LOGItemNodeData) then
                     list := list + ProfileRootPath + LOGItemNodeData^.ProcValue + #13#10;

                 NodeLevel2:= VirtualStringTree2.GetNextSibling(NodeLevel2);
               end;

           NodeLevel1:= VirtualStringTree2.GetNextSibling(NodeLevel1);
         end;

        Vcl.Clipbrd.Clipboard.SetTextBuf( PWideChar(list) );
      end;

   // Copy all files
   1: begin
       LOGItemNodeData := VirtualStringTree2.GetNodeData(VirtualStringTree2.FocusedNode);
          if Assigned(LOGItemNodeData) then
             ProfileRootPath := LOGItemNodeData^.ProcValue; // Rootpath

       NodeLevel2 := VirtualStringTree2.GetFirstChild( VirtualStringTree2.FocusedNode );
       while NodeLevel2 <> nil do
       begin
         LOGItemNodeData := VirtualStringTree2.GetNodeData(NodeLevel2);
         if Assigned(LOGItemNodeData) then
            list := list + ProfileRootPath + LOGItemNodeData^.ProcValue + #13#10;

         NodeLevel2:= VirtualStringTree2.GetNextSibling(NodeLevel2);
       end;

       Vcl.Clipbrd.Clipboard.SetTextBuf( PWideChar(list) );
      end;

   // Copy selected file
   2: begin
          LOGItemNodeData := VirtualStringTree2.GetNodeData(VirtualStringTree2.FocusedNode.Parent );
          if Assigned(LOGItemNodeData) then
            ProfileRootPath :=  LOGItemNodeData^.ProcValue;

          LOGItemNodeData := VirtualStringTree2.GetNodeData(VirtualStringTree2.FocusedNode);
          if Assigned(LOGItemNodeData) then
             list := ProfileRootPath + LOGItemNodeData^.ProcValue;

          Vcl.Clipbrd.Clipboard.SetTextBuf( PWideChar(list) );
      end;

  end;

end;

procedure TFormMain.RzButton1Click(Sender: TObject);
begin
  CancelOptProc := True;
  Application.ProcessMessages;
end;

procedure TFormMain.RzToolButton1Click(Sender: TObject);
begin
   //  hide
   settings_showlog := False;
   RzSplitter1.LowerRight.Visible := settings_showlog;
end;

procedure TFormMain.RzToolButton2Click(Sender: TObject);
begin
   VirtualStringTree2.Clear;
   VirtualStringTree2.RootNodeCount := 0;
end;



procedure TFormMain.LogEdit(Node: PVirtualNode; const p1: string = ''; p2: string = ''; p3: string ='');
var
  LOGItemNodeData : PLOGItemNodeData;
begin
  LOGItemNodeData := VirtualStringTree2.GetNodeData(Node);
  if Assigned(LOGItemNodeData) then
  with LOGItemNodeData^ do
  begin
   if p1 <> '' then  ProcName   := P1;
   if p2 <> '' then  ProcValue  := P2;
   if p3 <> '' then  ProcResult := P3;
  end;
end;

function TFormMain.LogAdd(RootNode: PVirtualNode; const p1: string = ''; p2: string = ''; p3: string =''): PVirtualNode;
var Node: PVirtualNode;
    LOGItemNodeData : PLOGItemNodeData;
begin
  Result := VirtualStringTree2.AddChild(RootNode);
  LOGItemNodeData := VirtualStringTree1.GetNodeData(Result);
  if Assigned(LOGItemNodeData) then
  with LOGItemNodeData^ do
  begin
     ProcName   := P1;
     ProcValue  := P2;
     ProcResult := P3;
  end;
end;

procedure TFormMain.VirtualStringTree2FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  LOGItemNodeData: PLOGItemNodeData;
begin
  LOGItemNodeData := Sender.GetNodeData(Node);
  // Explicitely free the string, the VCL cannot know that there is one but needs to free
  // it nonetheless. For more fields in such a record which must be freed use Finalize(Data^) instead touching
  // every member individually.
  Finalize(LOGItemNodeData^);
end;

procedure TFormMain.VirtualStringTree2GetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  LOGItemNodeData: PLOGItemNodeData;
begin
  LOGItemNodeData := Sender.GetNodeData(Node);
  if Assigned(LOGItemNodeData) then
    case Column of
      0 : CellText := LOGItemNodeData^.ProcName;
      1 : CellText := LOGItemNodeData^.ProcValue;
      2 : CellText := LOGItemNodeData^.ProcResult;
    end;
end;

{$ENDREGION}


end.
