unit frmMain;

interface

uses
 {.$DEFINE DEBUGMODE}
 {.$DEFINE SMALLEXE}
  aConstUnit,

  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  Winapi.ShlObj,

  System.Dateutils,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.Types,
  System.IOUtils,
  System.Diagnostics,
  System.TimeSpan,
  System.Threading,
  System.Actions,


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
  Vcl.Clipbrd,
  Vcl.WinXCtrls,
  Vcl.ExtDlgs,

  Vcl.ActnList,
  Vcl.ActnMan,
  Vcl.ActnCtrls,
  Vcl.ActnMenus,
  Vcl.ActnPopup,
  Vcl.ToolWin,
  Vcl.PlatformDefaultStyleActnCtrls,

  SVGIconImageListBase,
  SVGIconImageList,
  SVGIconImage,

  RzStatus,
  RzPanel,
  RzButton,
  RzPrgres,
  RzSplit,
  RzLabel,
  RzCommon,
  RzForms,

  VirtualTrees,
  VirtualTrees.BaseAncestorVCL,
  VirtualTrees.BaseTree,
  VirtualTrees.AncestorVCL,
  VirtualTrees.Header,
  VirtualTrees.Types,
  Vcl.ComCtrls
  ;


type
  TFormMain = class(TForm)
    FileOpenDialog1: TFileOpenDialog;
    RzPanelProgress: TRzPanel;
    Label2: TLabel;
    Label3: TLabel;
    RzProgressBar1: TRzProgressBar;
    RzProgressBar2: TRzProgressBar;
    VirtualStringTree1: TVirtualStringTree;
    RzSplitter1: TRzSplitter;
    RzPanel2: TRzPanel;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    VirtualStringTree2: TVirtualStringTree;
    FileSaveDialog1: TFileSaveDialog;
    RzPanelProgressBtnPanel: TRzPanel;
    RzButton1: TRzButton;
    PopupMenu3: TPopupMenu;
    DirtyHackDPiTimer1: TTimer;
    RzFormState1: TRzFormState;
    RzRegIniFile1: TRzRegIniFile;
    RzStatusBar1: TRzStatusBar;
    RzStatusPane_AppVer: TRzStatusPane;
    RzStatusPane_SQLiteVer: TRzStatusPane;
    Bevel1: TBevel;
    RzStatusPane3: TRzStatusPane;
    Bevel2: TBevel;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager1: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    AllAction: TAction;
    ActionToolBar2: TActionToolBar;
    Action24: TAction;
    Action25: TAction;
    Action26: TAction;
    Action27: TAction;
    PopupActionBar1: TPopupActionBar;
    Optimizeselectedprofile2: TMenuItem;
    OpenprofiledirectoryinExplorer1: TMenuItem;
    CopyprofiledirectorytoClipboard1: TMenuItem;
    edit2: TMenuItem;
    Addnewprofilepath1: TMenuItem;
    Deleteselected1: TMenuItem;
    MakeselectedprofileInvisible1: TMenuItem;
    MakeselectedprofileVisible1: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ActionManager2: TActionManager;
    Action36: TAction;
    Action37: TAction;
    Action38: TAction;
    Action39: TAction;
    Action40: TAction;
    Action41: TAction;
    Action42: TAction;
    Action43: TAction;
    Action44: TAction;
    Action45: TAction;
    Action46: TAction;
    PopupActionBar2: TPopupActionBar;
    Action28: TAction;
    Action29: TAction;
    Copytoclipboard1: TMenuItem;
    Gotofile2: TMenuItem;
    Action30: TAction;
    Action35: TAction;
    Action47: TAction;
    Action31: TAction;
    Action32: TAction;
    Fil1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);
    procedure VirtualStringTree1FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualStringTree1GetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure VirtualStringTree1GetImageIndexEx(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex; var ImageList: TCustomImageList);
    procedure VirtualStringTree1BeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure VirtualStringTree1DrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
    procedure VirtualStringTree1DragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
    procedure VirtualStringTree1NodeClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
    procedure VirtualStringTree1Checked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualStringTree2GetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure VirtualStringTree2FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Gotofile1Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
  // procedure Act1Click(Sender: TObject);
    procedure DirtyHackDPiTimer1Timer(Sender: TObject);
    procedure AllActionExecute(Sender: TObject);
    procedure PopupActionBar2Popup(Sender: TObject);
    procedure Action28Update(Sender: TObject);
    procedure Action29Update(Sender: TObject);
    procedure Action30Execute(Sender: TObject);
  private
    { Private declarations }
    add_profiledlg_last_cbindex: integer;
    xOldDPI, xNewDPI: Integer;
    procedure WMDropFiles(var Msg: TWMDropFiles);  message WM_DROPFILES;
    procedure updateButtonsState;
    procedure VSTSetCheckState(const b: Boolean);
    procedure ProgressDlgVisible(const b: Boolean);
    procedure BeforeProcOptimization;
    procedure AfterProcOptimization(const elapsedTime: string);
    procedure ProcCreateBAT(const outfile : string);
    procedure ProcOptimizeFullLOG(const selectedOnly: Boolean = False; const ShowLog: Boolean = False);
    procedure ProcOptimizeFastLOG(const selectedOnly: Boolean = False; const ShowLog: Boolean = False);
    function  LogAdd(RootNode: PVirtualNode; const p1: string = ''; p2: string = ''; p3: string =''): PVirtualNode;
    procedure LogEdit(Node: PVirtualNode; const p1: string = ''; p2: string = ''; p3: string ='');
    procedure UpdateNodeHeight(VST: TVirtualStringTree; H: Integer);
    function  AddProfileToVST_v2(const pathid: string; const appid: Integer; const optimizationenabled: boolean): Integer;
    procedure SearchAndLoadProfiles(const ActionIndex: Integer = CNST_LOAD_AND_SEARCH);
    procedure NewProfileDlg(const profilepath : string = ''; appid: Integer = 0; const customsettings: boolean = false);
    procedure EditProfileDlg;
    procedure DeleteProfile;
    procedure OpenProfileDirectory;
    procedure OpenSettingsDirectory;
    procedure CopyProfileDirectoryToClipboard;
    procedure ShowInfoDlg;
    procedure GenerateBATscript;
    procedure ShowSettingsDlg;
    procedure SetProfileVisibility(const vs: boolean);
    procedure ChangeToolbarVisibility;
    procedure ChangeLogpanelVisibility;
    procedure ChangeNonexistingprofilesVisibility;
    procedure ChangeHiddenprofilesVisibility;
  public
    { Public declarations }
    procedure SetUIFont(const FontName: string; const FontSize: Integer);
  end;

  PItemNodeData = ^TItemNodeData;
  TItemNodeData = record
    v_ProfileName  : String;
    v_FilesCount   : String;
    v_SizeBefore   : String;
    v_SizeAfter    : String;
    v_RateStr      : String;
    v_LastProcDate : string;
    h_AppIndex     : Integer;
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
  CancelOptProc : Boolean;


  // Decrease Exe size
 {$IFDEF SMALLEXE}
    {$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}      //
    {$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}   //      Line numbers are stripped from file.
    {$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}  //      Local symbols are stripped from file.
    {$SetPEFlags IMAGE_FILE_AGGRESIVE_WS_TRIM}    //      Agressively trim working set.
    {$DYNAMICBASE OFF}
 {$ENDIF}


  procedure ApplyTheme(const LT: Boolean = False);

implementation

uses aUtilsUnit,
     aLangUnit,
     aSettingsUnit,
     aConfigUnit,
     aCacheUnit,
     aGlobalsUnit,
     aBrowsersUnit,
     aSQLUtilsUnit,
     BatScriptUnt,

     DataModuleUnit,
     frmInfoUnit,
     frmSettingsUnit,
     frmAddProfileUnit;

var
    SearchProfilesResult   : TList<TAProfiles>;



{$R *.dfm}





{$REGION ' appearance + '}
{
  Monitor.Width x Monitor.Height
  1280x720  HD
  1920x1080 FHD
  2560x1440 QHD
  3840x2160 4K
  5120x2160 5k
  7680x4320 8K
 }

procedure TFormMain.UpdateNodeHeight(VST: TVirtualStringTree; H: Integer);
{
Грязный хак (исправляет проблему вертикального скрола на больших NodeHeight), что бы заработал
зайти в VirtualTrees.BaseTree.pas
найти строку:   FRangeY := FRoot.TotalHeight - FRoot.NodeHeight + FBottomSpace  ;
заменить на:  FRangeY := FRoot.TotalHeight + FRoot.NodeHeight + FBottomSpace  ;
}
var
  Node : PVirtualNode;
begin
  VST.DefaultNodeHeight := H;
  VST.BeginUpdate;
     Node :=  VST.GetFirst;
     while Assigned(Node) do
     begin
       Node.NodeHeight := H;
       VST.ToggleNode(Node);
       VST.ToggleNode(Node);
       Node := VST.GetNext(Node);
     end;
  VST.EndUpdate;
  VST.UpdateVerticalRange;
end;

procedure TFormMain.SetUIFont(const FontName: string; const FontSize: Integer);
var txtH: Integer;
begin
  FormMain.Font.Size  := FontSize ;
  FormMain.Font.Name  := FontName;

  txtH := Canvas.TextHeight( '!p' );

 // DataModule1.SVGIconVirtualImageList1.Size := txtH;
  DataModule1.SVGIconVirtualImageList2.Size := txtH;

  //menubar
  DataModule1.SVGIconVirtualImageList4.Size := txtH;

  // $Toolbar  ВЫЗЫВАТЬ ПЕРЕД $PopupMenu
  ActionToolBar2.AutoSizing := False;
  DataModule1.SVGIconVirtualImageList5.Size := ifthenint(txtH >= 16, txtH, 16);
  ActionToolBar2.Font.Name  := FontName;
  ActionToolBar2.Font.Size  := FontSize;
  ActionToolBar2.AutoSizing := True;

  // $PopupMenu ВЫЗЫВАТЬ ПОСЛЕ $Toolbar
  Screen.MenuFont.Size := FontSize;
  Screen.MenuFont.Name := FontName;
  DrawMenuBar(Handle);

  //Progress panel
  RzPanelProgress.AutoSize := False;
  try
   RzPanelProgress.Width  := (FormMain.Width div 3) + Canvas.TextWidth( Label2.Caption ) ;

   RzProgressBar1.Height :=  txtH + 10;
   RzProgressBar2.Height :=  txtH + 10;
   RzPanelProgressBtnPanel.Height := txtH + 20;
   RzPanelProgress.Height := (RzProgressBar1.Height*2) + RzPanelProgressBtnPanel.Height + (Label2.Height*2);

   RzButton1.Width  := Canvas.TextWidth( RzButton1.Caption ) + 30;
  finally
    RzPanelProgress.AutoSize := True;
  end;

  // LOG
  RzPanel2.Height := txtH +10;
  RzToolButton2.Width := Canvas.TextWidth(RzToolButton2.Caption) + 30;
  RzToolButton1.Width := Canvas.TextWidth(RzToolButton1.Caption) + 30;
  VirtualStringTree2.Header.Height := txtH + 8 ;
  UpdateNodeHeight(VirtualStringTree2, txtH + 8);


  // StatusBar
  RzStatusBar1.Height := Canvas.TextHeight( RzStatusPane_AppVer.Caption ) + 10;
  RzStatusPane_AppVer.Width := Canvas.TextWidth( RzStatusPane_AppVer.Caption ) + 10;
  RzStatusPane_SQLiteVer.Width := Canvas.TextWidth( RzStatusPane_SQLiteVer.Caption ) + 10;


  VirtualStringTree1.Header.Height := txtH + 8 ;
  UpdateNodeHeight(VirtualStringTree1, txtH + 8);

end;

procedure ApplyTheme(const LT: Boolean = False);
begin
  with FormMain do begin
      case  GLOBAL_ui_theme   of
       1: begin
                with VirtualStringTree1 do
                begin
                  Colors.HotColor                      := clNavy;
                  SelectionBlendFactor                 := 200;
                  Colors.GridLineColor                 := $00D0D0D0;
                  Colors.UnfocusedColor                := $002B2B2B;
                  Colors.UnfocusedSelectionColor       := $00C2A072;
                  Colors.UnfocusedSelectionBorderColor := $00FDBA60;
                end;

                with VirtualStringTree2 do
                begin
                  Colors.HotColor                      := clNavy;
                  SelectionBlendFactor                 := 200;
                  Colors.GridLineColor                 := $00D0D0D0;
                  Colors.UnfocusedColor                := $002B2B2B;
                  Colors.UnfocusedSelectionColor       := $00C2A072;
                  Colors.UnfocusedSelectionBorderColor := $00FDBA60;
                end;

                if LT then TStyleManager.TrySetStyle('Windows11 Modern Light');
          end;

       0: begin
               with VirtualStringTree1 do
               begin
                  Colors.HotColor                       := $00FDBA60;
                  SelectionBlendFactor                  := 128;
                  Colors.GridLineColor                  := $002B2B2B;
                  Colors.UnfocusedColor                 := $00DEDEDE;  // clSilver;
                  Colors.UnfocusedSelectionColor        := $00B68D56;  // $002B2B2B;
                  Colors.UnfocusedSelectionBorderColor  := $00B68D56;  //$002B2B2B;
               end;

               with VirtualStringTree2 do
               begin
                 Colors.HotColor                      := $00FDBA60;
                 SelectionBlendFactor                 := 128;
                 Colors.GridLineColor                 := $002B2B2B;
                 Colors.UnfocusedColor                := $00DEDEDE;  // clSilver;
                 Colors.UnfocusedSelectionColor       := $00B68D56;  // $002B2B2B;
                 Colors.UnfocusedSelectionBorderColor := $00B68D56;  //$002B2B2B;
               end;

               if LT then TStyleManager.TrySetStyle('Windows11 Modern Dark');
          end;
      end;
  end;
end;

procedure TFormMain.DirtyHackDPiTimer1Timer(Sender: TObject);
begin
   DirtyHackDPiTimer1.Enabled := False;
   FormMain.OnAfterMonitorDpiChanged := nil;
   FormMain.ScaleControlsForDpi(xOldDPI);
   FormMain.ScaleControlsForDpi(xNewDPI);

   SetUIFont(GLOBAL_ui_font_name, GLOBAL_ui_font_size);

   FormMain.OnAfterMonitorDpiChanged := FormAfterMonitorDpiChanged;
end;

{$ENDREGION}

{$REGION ' Form events  + '}

procedure TFormMain.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);
begin
  SetUIFont(GLOBAL_ui_font_name, GLOBAL_ui_font_size);

  xOldDPI := OldDPI;
  xNewDPI := NewDPI;
  DirtyHackDPiTimer1.Enabled := True;
end;

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
         NewProfileDlg(FileName, -1, false);
       end
       else
        if CompareText( ExtractFileExt(FileName) , '.lnk' ) = 0 then
        begin

          var profilePath: string;
          var appIndex, R: integer;

          R := GetProfileFromLNK(FileName, profilePath, appIndex);

          case R of
            GPF_RESULT_LINK_UDD_PD_OK,
            GPF_RESULT_LINK_UDD_OK,
            GPF_RESULT_LINK_PD_OK           : NewProfileDlg(profilePath, appIndex, false);
            GPF_RESULT_LINK_TO_DIRECTORY    : NewProfileDlg(profilePath, 0, false);

            GPF_RESULT_FAILED_TO_READ_LNK :
            begin
               DataModule1.TaskDialog5.Caption := READ_LNK_FAIL_DIALOG_CAPTION; //'Failed to read shortcut';
               DataModule1.TaskDialog5.Text    := FileName;
               DataModule1.TaskDialog5.Execute;
            end;

            GPF_RESULT_LINK_NO_CMD :
            begin
               DataModule1.TaskDialog5.Caption := READ_LNK_NOCMD_DIALOG_CAPTION;  // 'Failed to get profile path';
               DataModule1.TaskDialog5.Text    := READ_LNK_NOCMD_DIALOG_TEXT;     //'This shortcut does not contain profile information';
               DataModule1.TaskDialog5.Execute;
            end;

            GPF_RESULT_LINK_UDD_NOT_FOUND,
            GPF_RESULT_LINK_PD_NOT_FOUND :
            begin
              DataModule1.TaskDialog6.Caption := READ_LNK_PATHNOTFOUND_DIALOG_CAPTION;
              DataModule1.TaskDialog6.Text    := Format(READ_LNK_PATHNOTFOUND_DIALOG_TEXT, [profilePath]); // 'Profile path "' + profilePath +'" not found.' + #13#10 + 'Do you want to add this path anyway ?'   ;
                if DataModule1.TaskDialog6.Execute then
                  if DataModule1.TaskDialog6.ModalResult = mrYes then
                        NewProfileDlg(profilePath, appIndex, false);
            end;
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

procedure TFormMain.FormCreate(Sender: TObject);
begin
  RzRegIniFile1.Path := GetAppSettingsPath + APP_WND_SETTINGS;

  SearchProfilesResult := nil;

  add_profiledlg_last_cbindex := 0;
  FileOpenDialog1.FileName := '';

  FileSaveDialog1.FileName := DEFAULT_BAT_FILE_NAME; // 'OptimizationJob.bat';
  FileSaveDialog1.DefaultFolder := ExtractFilePath(ParamStr(0));

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
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  if FormMain.Tag = 1 then Exit;  // Prevent second time fire this event

  // Caption
  Application.Title := APP_CAPTION;
  Caption           := APP_CAPTION;

  // SQL ver
  RzStatusPane_SQLiteVer.Caption := Format(SQLStatusVerCaption, [FileVersion(sqlite3_lib)]);

  // App ver
  if APO_Portable
  then RzStatusPane_AppVer.Caption := Format(AppVerPortableCaption, [FileVersion(Application.ExeName)])
  else RzStatusPane_AppVer.Caption := Format(AppVerCaption, [FileVersion(Application.ExeName)]);

  Application.HintHidePause  := 5000;
  FormMain.ShowHint          := True;
  Application.ShowHint       := True;

  // Default
  FormResize(nil);

  // VST Header settings
  if JSONSettingsLoad
  then ReadHeaderSettings(APOSettings, VirtualStringTree1)
  else ApplyDefaultHeaderSettings(VirtualStringTree1);

  // Set UI Font and Size
  SetUIFont(GLOBAL_ui_font_name, GLOBAL_ui_font_size);

  // Load Cache
  APOCache.LoadCache( GetAppSettingsPath + APP_CACHE_FILENAME);

  // Log
  RzSplitter1.LowerRight.Visible := GLOBAL_show_showlog;

  // Toolbar
  ActionToolBar2.Visible := GLOBAL_show_toolbar;
  Action20.Checked := GLOBAL_show_toolbar;
  Action21.Checked := GLOBAL_show_showlog;
  Action22.Checked := GLOBAL_show_nonexisting_profiles;
  Action23.Checked := GLOBAL_show_hidden_profiles;

  // Prevent second time fire this event
  // FormMain.OnShow := nil; - Cause AV in RzFormState1(RzForms)
  FormMain.Tag := 1;

  SearchAndLoadProfiles;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { VTCheckBoxDecorator.Free;}
  var tms: string := GetAppSettingsPath;
  WriteSettings(APOSettings, VirtualStringTree1);
  APOSettings.SaveToJSONFile( tms + APP_JSETTINGS_V1);
  APOCache.SaveCache( tms + APP_CACHE_FILENAME);

  FreeSearchProfilesResult(SearchProfilesResult);

  DragAcceptFiles(Self.Handle, False);
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

{$ENDREGION}

{$REGION ' Procedures and Functions  + '}

procedure SetToolBarButtonsState(Am: TActionManager; s_enabled: boolean);
begin
  var i: integer;
  for I := 0 to Am.ActionCount-1 do
      Am.Actions[i].Enabled := s_enabled;
end;

procedure TFormMain.ProgressDlgVisible(const b: Boolean);
begin
   // Opt Progress panel centering
   RzPanelProgress.Top  :=  (ClientHeight - RzPanelProgress.Height) div 2 ;
   RzPanelProgress.Left :=  (ClientWidth - RzPanelProgress.Width) div 2;


  RzPanelProgress.Visible := b;
  RzProgressBar1.PartsComplete := 0;
  RzProgressBar2.PartsComplete := 0;
end;

procedure TFormMain.BeforeProcOptimization;
begin
   CancelOptProc        := False;
   SetToolBarButtonsState(ActionManager1, False);
   SetToolBarButtonsState(ActionManager2, False);
   RzSplitter1.Enabled  := False;
   Application.ProcessMessages;
end;



procedure TFormMain.AfterProcOptimization(const elapsedTime: string);
begin
  SetToolBarButtonsState(ActionManager1, True);
  SetToolBarButtonsState(ActionManager2, True);
  RzSplitter1.Enabled  := True;

  if CancelOptProc
  then RzStatusPane3.Caption :=  CANCELED_STATUSBAR_RESULT_CAPTION  //  'optimization canceled.'
  else RzStatusPane3.Caption :=  Format( DONE_STATUSBAR_RESULT_CAPTION, [elapsedTime]);     //  'optimization done.';

  ProgressDlgVisible(False);
  if RzSplitter1.LowerRight.Visible then   VirtualStringTree2.Refresh;
  VirtualStringTree1.Refresh;
  updateButtonsState;

  Application.ProcessMessages;
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
                                       // AppNameFromType(ItemNodeData^.h_AppIndex),
                                        AppIndexToName(ItemNodeData^.h_AppIndex),
                                        ProfileNo,
                                       // IsAppTypeFF(ItemNodeData^.h_AppIndex),
                                        IsAppIndexFF(ItemNodeData^.h_AppIndex),
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

{$ENDREGION}

{$REGION ' V2 '}

procedure TFormMain.NewProfileDlg(const profilepath : string = ''; appid: Integer = 0; const customsettings: boolean = false);
begin
   Application.CreateForm(TAddProfileDlgForm, AddProfileDlgForm);
   try
     AddProfileDlgForm.profilepath_Edit.Text := profilepath;

     // var tmp_appinx: integer;
     if appid = -1
     then AddProfileDlgForm.ProfileAppType := add_profiledlg_last_cbindex
     else AddProfileDlgForm.ProfileAppType := appid;

     if AddProfileDlgForm.ShowModal <> mrOk then Exit;

     add_profiledlg_last_cbindex := AddProfileDlgForm.appid_ComboBoxEx.ItemIndex;

     var profileinx: integer;

     // Пробуем добавить новый профиль
     profileinx := APOSettings.AddProfile(
     VarArrayOf([
                 Adjpath(AddProfileDlgForm.profilepath_Edit.Text),    // p_pathid                 // ID профиля (путь)
                 AddProfileDlgForm.ProfileAppType,                    // p_appid                  // ID приложения
                 True,                                                // p_optimizationenabled    // Разрешить оптимизацию (оно же чекбокс)
                 False                                                                            // Определяет является ли профиль найденным
                ])
                                         );

       // Если результат > -1 то профиль был добавлен
       if profileinx > -1 then
       begin
          // Добавление профиля в VST
          VirtualStringTree1.BeginUpdate;
          AddProfileToVST_v2( APOSettings.g_profiles[profileinx].p_pathid,
                              APOSettings.g_profiles[profileinx].p_appid,
                              APOSettings.g_profiles[profileinx].p_optimizationenabled
                                );
          VirtualStringTree1.EndUpdate;
          // Создаём кэш для добавленного профиля
          APOCache.AddProfile( APOSettings.g_profiles[profileinx].p_pathid );
       end else
       begin
          // Если результат -1 то профиль уже есть
          DataModule1.TaskDialog4.Execute;
          exit;
       end;

   finally
     AddProfileDlgForm.Free;
   end;

  WriteSettings(APOSettings, VirtualStringTree1);
  APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);
  APOCache.SaveCache( GetAppSettingsPath + APP_CACHE_FILENAME);

  updateButtonsState;
end;

procedure TFormMain.EditProfileDlg;
var
 profilepath    : string;
 profileinx     : integer;
 ItemNodeData   : PItemNodeData;
begin
   if not Assigned(VirtualStringTree1.FocusedNode) then Exit;
   ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);

   if not Assigned(ItemNodeData) then Exit;
   profilepath  := ItemNodeData^.v_ProfileName;

   Application.CreateForm(TAddProfileDlgForm, AddProfileDlgForm);
   try
     AddProfileDlgForm.profilepath_Edit.Text := profilepath;                                                              // Устанавливаем в Edit путь до профиля
     profileinx  := APOSettings.GetProfileIndex( profilepath );                                                           // Получаем Индекс профиля в APOSettings

     AddProfileDlgForm.ProfileAppType := APOSettings.g_profiles[profileinx].p_appid;                                      // Тип приложения

     if APOSettings.g_profiles[profileinx].p_from_search then                                                             // Если профиль добавлен через поиск
     begin                                                                                                                // то отображаем его только для чтения
       AddProfileDlgForm.profilepath_Edit.ReadOnly := True;
       AddProfileDlgForm.appid_ComboBoxEx.Enabled := False;
       AddProfileDlgForm.SpeedButton2.Enabled := False;
       AddProfileDlgForm.SpeedButton1.Enabled := False;
     end;

     if APOSettings.g_profiles[profileinx].p_user_visible
     then AddProfileDlgForm.ToggleSwitch1.State := tssOn
     else AddProfileDlgForm.ToggleSwitch1.State := tssOff;



     if AddProfileDlgForm.ShowModal <> mrOk then  Exit;                                                                  // Открытие диалока
     if APOSettings.g_profiles[profileinx].p_from_search then                                                            // Если профиль добавлен через поиск то выход
     begin
       APOSettings.g_profiles[profileinx].p_user_visible := AddProfileDlgForm.ToggleSwitch1.isOn;                        // Видимость профиля
       SearchAndLoadProfiles(CNST_LOAD_ONLY);                                                                                 // Перезагрузка списка
       WriteSettings(APOSettings, VirtualStringTree1);                                                                        // Сохранение VST в APOSettings
       APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);                                                    // Сохранение настроек APOSettings в файл
       updateButtonsState;
       Exit;
     end;

     var tmp_profileinx: integer := APOSettings.GetProfileIndex( Adjpath(AddProfileDlgForm.profilepath_Edit.Text) );
     APOSettings.g_profiles[profileinx].p_appid := AddProfileDlgForm.ProfileAppType ;
     ItemNodeData^.h_AppIndex := APOSettings.g_profiles[profileinx].p_appid ;

       if (profileinx <> tmp_profileinx) then                                                                             // Если путь до профиля в диалоге был изменен
         if tmp_profileinx = -1 then                                                                                      // Если путь до профиля в диалоге не существует в списке APOSettings.g_profiles то
         begin
           APOSettings.g_profiles[profileinx].p_pathid := Adjpath(AddProfileDlgForm.profilepath_Edit.Text);               // Меняем путь до профиля в APOSettings.g_profiles
           ItemNodeData^.v_ProfileName := APOSettings.g_profiles[profileinx].p_pathid ;            //todo: test           // Меняем путь до профиля в VST
           APOCache.ChangeProfilePath(ProfilePath, APOSettings.g_profiles[profileinx].p_pathid);   //todo: test           // Меняем путь до профиля в кеше
         end else
         begin
           DataModule1.TaskDialog4.Execute;                                                                               // Если путь до профиля в диалоге уже существует в списке APOSettings.g_profiles то
           Exit;                                                                                                          // Диалог об ошибке и выход
         end;

     APOSettings.g_profiles[profileinx].p_user_visible := AddProfileDlgForm.ToggleSwitch1.isOn;                           // Видимость профиля

   finally
     AddProfileDlgForm.Free;
   end;

   SearchAndLoadProfiles(CNST_LOAD_ONLY);                                                                                 // Перезагрузка списка
   WriteSettings(APOSettings, VirtualStringTree1);                                                                        // Сохранение VST в APOSettings
   APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);                                                    // Сохранение настроек APOSettings в файл
   APOCache.SaveCache( GetAppSettingsPath + APP_CACHE_FILENAME);                                                          // Сохранение кеша
   updateButtonsState;
end;

procedure TFormMain.DeleteProfile;
var
  profilepath    : string;
  ItemNodeData   : PItemNodeData;
  profileinx     : integer;
begin
   ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);
   profilepath  := ItemNodeData^.v_ProfileName;

   profileinx   := APOSettings.GetProfileIndex( profilepath );

   if APOSettings.g_profiles[profileinx].p_from_search then
   begin
     if DataModule1.TaskDialog1.Execute then
        if DataModule1.TaskDialog1.ModalResult = mrYes then
        begin
          APOSettings.g_profiles[profileinx].p_user_visible := False;
          SearchAndLoadProfiles(CNST_LOAD_ONLY);
          WriteSettings(APOSettings, VirtualStringTree1);
          APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);
          APOCache.SaveCache( GetAppSettingsPath + APP_CACHE_FILENAME);
        end;
    Exit;
   end;

   if DataModule1.TaskDialog2.Execute then
      if DataModule1.TaskDialog2.ModalResult <> mrYes then Exit;

   APOSettings.DeleteProfile(profileinx);
   APOCache.DeleteProfile(profilepath);

   SearchAndLoadProfiles(CNST_LOAD_ONLY);

   WriteSettings(APOSettings, VirtualStringTree1);
   APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);
   APOCache.SaveCache( GetAppSettingsPath + APP_CACHE_FILENAME);
   updateButtonsState;
end;

procedure TFormMain.SetProfileVisibility(const vs: boolean);
var
  profilepath    : string;
  ItemNodeData   : PItemNodeData;
  profileinx     : integer;
begin
   ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);
   profilepath  := ItemNodeData^.v_ProfileName;

   profileinx   := APOSettings.GetProfileIndex( profilepath );


   if not vs then                                                                                                        // Спрашиваем подтверждение если речь о скрытии профиля
   if DataModule1.TaskDialog3.Execute then
      if DataModule1.TaskDialog3.ModalResult <> mrYes then Exit;

    APOSettings.g_profiles[profileinx].p_user_visible := vs;
    SearchAndLoadProfiles(CNST_LOAD_ONLY);
    WriteSettings(APOSettings, VirtualStringTree1);
    APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);
    updateButtonsState;

end;

procedure TFormMain.VSTSetCheckState(const b: Boolean);
var
  Node         : PVirtualNode;
  CheckState   : TCheckState;
 // ItemNodeData : PItemNodeData;
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
   updateButtonsState;
end;

function TFormMain.AddProfileToVST_v2(const pathid: string; const appid: Integer; const optimizationenabled: boolean): Integer;

 Function GetL0RootNode(AppIDIndex: integer): PVirtualNode;
 var ItemNodeData       : PItemNodeData;
 begin
        Result := VirtualStringTree1.GetFirstLevel(0);
        while Assigned(Result) do
        begin
          ItemNodeData := VirtualStringTree1.GetNodeData(Result);
          if Assigned(ItemNodeData) then
           if ItemNodeData^.h_AppIndex = AppIDIndex then Exit;

          Result := VirtualStringTree1.GetNextLevel(Result, 0);
        end;
       Result := nil;
 end;


const
 RESULT_PROFILE_ALREADY_EXISTS = -1;
 RESULT_PROFILE_ADDED          =  0;

var
  RootNode, CildNode : PVirtualNode;
  ItemNodeData       : PItemNodeData;
begin
  result := RESULT_PROFILE_ADDED;

 {$REGION ' Search for existing profile '}
  CildNode :=  VirtualStringTree1.GetFirstLevel(1);
  while Assigned(CildNode) do
  begin
    ItemNodeData := VirtualStringTree1.GetNodeData(CildNode);
    if Assigned(ItemNodeData) then
     if CompareText( ItemNodeData^.v_ProfileName, pathid) = 0 then
      begin
        Result := RESULT_PROFILE_ALREADY_EXISTS;
        Exit;
      end;

     CildNode := VirtualStringTree1.GetNextLevel(CildNode, 1);
  end;
 {$ENDREGION}

      {$REGION ' Search for root node '}
        // Поиск корневого узла (по appid) к которому будет добавлен дочерний нод содержащий путь к профилю
      {  RootNode :=  VirtualStringTree1.GetFirstLevel(0);
        while Assigned(RootNode) do
        begin
          ItemNodeData := VirtualStringTree1.GetNodeData(RootNode);
          if Assigned(ItemNodeData) then
           if ItemNodeData^.h_AppIndex = appid then Break;

           RootNode := VirtualStringTree1.GetNextLevel(RootNode, 0);
        end;  }
       RootNode :=  GetL0RootNode(appid);
      {$ENDREGION}

      {$REGION ' If Root node not exists, then create it '}
        // Если корневого узла нету, то создаём его
        if not Assigned(RootNode)  then
        begin
           RootNode := VirtualStringTree1.AddChild(nil);
           RootNode.CheckType := ctTriStateCheckBox ;// ctCheckBox;
           Include( RootNode.States, vsExpanded);
           ItemNodeData := VirtualStringTree1.GetNodeData(RootNode);
           if Assigned(ItemNodeData) then
           with ItemNodeData^ do
           begin
              v_ProfileName  := AppIndexToName(appid);
              h_AppIndex      := appid;
              v_FilesCount   := '';
              v_SizeBefore   := '';
              v_SizeAfter    := '';
              v_RateStr      := '';
              v_LastProcDate := '';
           end;
        end;
      {$ENDREGION}

      {$REGION ' Add child node (profile path) '}
       // Создаём дочерний узел
       CildNode := VirtualStringTree1.AddChild(RootNode);

    {   if not user_visible then
        if not app_show_hidden_profiles then
           Exclude(CildNode.States, vsVisible);

       if not DirectoryExists(pathid) then
        if not app_show_nonexisting_profiles then
            Exclude(CildNode.States, vsVisible);   }

       CildNode.CheckType := ctCheckBox;// ctTriStateCheckBox ;// ctCheckBox;

         // Bug-fix (фикс бага в VST)
         VirtualStringTree1.CheckState[CildNode] := csCheckedNormal;

         if optimizationenabled
         then VirtualStringTree1.CheckState[CildNode] := csCheckedNormal
         else VirtualStringTree1.CheckState[CildNode] := csUnCheckedNormal;

         ItemNodeData := VirtualStringTree1.GetNodeData(CildNode);
         if Assigned(ItemNodeData) then
            with ItemNodeData^ do
            begin
              v_ProfileName   :=  pathid;
              h_AppIndex       :=  appid;
              v_FilesCount    :=  '';
              v_SizeBefore    :=  '';
              v_SizeAfter     :=  '';
              v_RateStr       :=  '';
              h_RateProgress  :=  0;
              h_PathNotFound  :=  not DirectoryExists(pathid) ;
            //  v_IsCaching     :=  BoolToStr(caching);
              v_LastProcDate  := 'Never';

                    //Кэш
                    var tmp_i : integer := APOCache.GetIndexByPathName(v_ProfileName);
                    if tmp_i > -1 then
                    begin
                      if APOCache.CacheRecArray[tmp_i].lastoptdate <> 0 then
                      begin
                        var tmp_d : integer := Round( DaySpan(APOCache.CacheRecArray[tmp_i].lastoptdate, now) );
                        var tmp_dts : string;

                        tmp_dts := ifthenstr(APOCache.CacheRecArray[tmp_i].Cancelled, 'Cancelled ', '');
                        // 'Cancelled at: '

                        if tmp_d = 0 then
                        v_LastProcDate := tmp_dts + 'today at: ' + FormatDateTime('hh:nn',APOCache.CacheRecArray[tmp_i].lastoptdate)
                        else
                        v_LastProcDate := tmp_dts +  tmp_d.ToString + ' day(s) ago';
                      end;
                    end else
                    begin
                      APOCache.AddProfile( v_ProfileName );
                    end;

            end;
      {$ENDREGION}

end;

procedure TFormMain.SearchAndLoadProfiles(const ActionIndex: Integer = CNST_LOAD_AND_SEARCH); // 0 - Загрузка и поиск, 1 - Загрузка, 2 - Поиск
var i, j, profileinx: integer;
begin

  VirtualStringTree1.RootNodeCount := 0;
  VirtualStringTree1.Clear;

  if ActionIndex in [CNST_LOAD_AND_SEARCH, CNST_LOAD_ONLY] then
  begin
    // Загрузка профилей из настроек
    // Вместо использования  Exclude(Node.States, vsVisible); для скрытия
    // ноды просто не создаются, ибо так проще, иначе придётся прикручивать контроль пустоты родительских нодов, что муторно.
    VirtualStringTree1.BeginUpdate;
    try
       if Length(APOSettings.g_profiles) > 0 then
       for i := 0 to High(APOSettings.g_profiles) do
       begin
         if APOSettings.g_profiles[i].p_user_visible or GLOBAL_show_hidden_profiles then
         begin
           if not DirectoryExists(APOSettings.g_profiles[i].p_pathid) then
              if not GLOBAL_show_nonexisting_profiles then Continue;

           AddProfileToVST_v2( APOSettings.g_profiles[i].p_pathid,
                               APOSettings.g_profiles[i].p_appid,
                               APOSettings.g_profiles[i].p_optimizationenabled
                             );
         end;
       end;
    finally
       VirtualStringTree1.EndUpdate;
    end;
  end;

  if ActionIndex in [CNST_LOAD_AND_SEARCH, CNST_SEARCH_ONLY] then
  begin
    // Поиск и загрузка из поиска
    FreeSearchProfilesResult(SearchProfilesResult);
    SearchProfilesResult := GetProfilesA;
    VirtualStringTree1.BeginUpdate;
    try
      for i := 0 to SearchProfilesResult.Count-1 do
      begin
         for j := 0 to SearchProfilesResult[i].appProfiles.Count-1 do
         begin
           profileinx := APOSettings.AddProfile(VarArrayOf([
                                                            SearchProfilesResult[i].appProfiles[j],                      // p_pathid
                                                            SearchProfilesResult[i].appIndex,                            // p_appid
                                                            True,                                                        // p_optimizationenabled
                                                            True                                                         // p_from_search
                                                           ]) );

           if profileinx > -1 then // Если результат -1 то профиль уже есть
            AddProfileToVST_v2( APOSettings.g_profiles[profileinx].p_pathid,
                                APOSettings.g_profiles[profileinx].p_appid,
                                APOSettings.g_profiles[profileinx].p_optimizationenabled  );   { }
         end;
      end;
    finally
      VirtualStringTree1.EndUpdate;
    end;
  end;

  updateButtonsState;
end;

procedure TFormMain.OpenProfileDirectory;
begin
  if not Assigned(VirtualStringTree1.FocusedNode) then Exit;
    var s: string;
    var ItemNodeData : PItemNodeData := nil;
    ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);
    if not Assigned(ItemNodeData) then Exit;
    s := ItemNodeData^.v_ProfileName;
    ShellExecute(0, nil, 'explorer.exe', PWideChar('/select,' + s), nil, SW_SHOWNORMAL) ;
end;

procedure TFormMain.OpenSettingsDirectory;
begin
    var s: string := GetAppSettingsPath + APP_JSETTINGS_V1;
    ShellExecute(0, nil, 'explorer.exe', PWideChar('/select,' + s), nil, SW_SHOWNORMAL) ;
end;

procedure TFormMain.CopyProfileDirectoryToClipboard;
begin //Copy profile directory path
  if not Assigned(VirtualStringTree1.FocusedNode) then Exit;
    var s: string;
    var ItemNodeData : PItemNodeData := nil;
    ItemNodeData := VirtualStringTree1.GetNodeData(VirtualStringTree1.FocusedNode);
    if not Assigned(ItemNodeData) then Exit;
    s :=  ItemNodeData^.v_ProfileName;
    Vcl.Clipbrd.Clipboard.SetTextBuf( PWideChar(S) );
end;

procedure TFormMain.ShowInfoDlg;
begin
  try
    Application.CreateForm(TfrmInfo, frmInfo);
    frmInfo.ShowModal;
  finally
    frmInfo.Free;
  end;
end;

procedure TFormMain.GenerateBATscript;
begin
if FileSaveDialog1.Execute then
             ProcCreateBAT( FileSaveDialog1.FileName );
end;

procedure TFormMain.ShowSettingsDlg;
begin
  Application.CreateForm(TfrmSettings, frmSettings);
  try
    with frmSettings do
    begin
      {-Language}
      ComboBox_ui_language.ItemIndex := TextPosIndex(GLOBAL_ui_language, ['Eng', 'Rus']);

      {-Check runing browsers}
      if GLOBAL_check_running_browsers then ToggleSwitch9.State := tssOn else ToggleSwitch9.State := tssOff;

      {Theme}
      ComboBox_ui_theme.ItemIndex := GLOBAL_ui_theme;

      {Font}
      FontComboBox_ui_font_name.FontName := GLOBAL_ui_font_name;
      SpinEdit_ui_font_size.Value        := GLOBAL_ui_font_size;
    end;

    if frmSettings.ShowModal = mrOk then
    begin
      {-Language}
      GLOBAL_ui_language := frmSettings.ComboBox_ui_language.Text;

      {-Check runing browsers}
      GLOBAL_check_running_browsers := frmSettings.ToggleSwitch9.isOn;

      {Theme}
      GLOBAL_ui_theme := frmSettings.ComboBox_ui_theme.ItemIndex;

      {Font}
      GLOBAL_ui_font_name := frmSettings.FontComboBox_ui_font_name.FontName;
      GLOBAL_ui_font_size := frmSettings.SpinEdit_ui_font_size.Value;

      {Apply}
      SetUIFont(GLOBAL_ui_font_name, GLOBAL_ui_font_size);
      ApplyTheme(True);

      WriteSettings(APOSettings, VirtualStringTree1);
      APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);
      APOCache.SaveCache( GetAppSettingsPath + APP_CACHE_FILENAME);
    end;

  finally
    frmSettings.Free;
  end;
end;

procedure TFormMain.ChangeToolbarVisibility;
begin
   ActionToolBar2.Visible := not ActionToolBar2.Visible;
   GLOBAL_show_toolbar := ActionToolBar2.Visible;
   Action20.Checked := GLOBAL_show_toolbar;
end;

procedure TFormMain.ChangeLogpanelVisibility;
begin
   RzSplitter1.LowerRight.Visible := not RzSplitter1.LowerRight.Visible;
   GLOBAL_show_showlog := RzSplitter1.LowerRight.Visible;
   Action21.Checked := GLOBAL_show_showlog;
end;

procedure TFormMain.ChangeNonexistingprofilesVisibility;
begin
  GLOBAL_show_nonexisting_profiles := not GLOBAL_show_nonexisting_profiles;
  Action22.Checked := GLOBAL_show_nonexisting_profiles;

  SearchAndLoadProfiles(CNST_LOAD_ONLY);
  WriteSettings(APOSettings, VirtualStringTree1);
  APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);
  updateButtonsState;
end;

procedure TFormMain.ChangeHiddenprofilesVisibility;
begin
  GLOBAL_show_hidden_profiles := not GLOBAL_show_hidden_profiles;
  Action23.Checked := GLOBAL_show_hidden_profiles;

  SearchAndLoadProfiles(CNST_LOAD_ONLY);
  WriteSettings(APOSettings, VirtualStringTree1);
  APOSettings.SaveToJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1);
  updateButtonsState;
end;

procedure TFormMain.AllActionExecute(Sender: TObject);
var tgIndex : integer;
begin
   if (Sender is TAction) then tgIndex := TAction(Sender).Tag;
   case tgIndex of
     1    :   Application.Terminate;
     5    :   GenerateBATscript;
     6    :   OpenProfileDirectory;
     7    :   CopyProfileDirectoryToClipboard;
     8    :   EditProfileDlg;
     9    :   DeleteProfile;
     10   :   NewProfileDlg('', -1, false);
     11   :  ;
     12   :  ;

     13   :   SearchAndLoadProfiles;
     14   :   VSTSetCheckState(True);
     15   :   VSTSetCheckState(False);
     16   :   SetProfileVisibility(False); //Set invisible
     17   :   SetProfileVisibility(True); //Set Visible
     18   :   ChangeToolbarVisibility;
     19   :   ChangeLogpanelVisibility;
     20   :   ChangeNonexistingprofilesVisibility;
     21   :   ChangeHiddenprofilesVisibility;
     22   :   OpenSettingsDirectory;  // Open setting directory in Explorer

     23   :   ProcOptimizeFullLOG(False, GLOBAL_show_showlog);  // full checked
     24   :   ProcOptimizeFastLOG(False, GLOBAL_show_showlog);    // fast checked
     25   :   ProcOptimizeFullLOG(True, GLOBAL_show_showlog);//    full selected
     26   :   ProcOptimizeFastLOG(True, GLOBAL_show_showlog);    // fast sel

     99   :   ShowSettingsDlg;
     114  :   ShowInfoDlg;
   end;
end;

procedure TFormMain.ProcOptimizeFullLOG(const selectedOnly: Boolean = False; const ShowLog: Boolean = False);
{
  * Полная оптимизация
    - Осуществляет поиск по подкаталогам без ограничения их глубины ( CNST_MAX_SEARCH_DEPTH := -1 )
    - Минимальный размер искомого файла 50kb ( CNST_MIN_FILE_SIZE := 50*1024 )
    - Минимальный размер разницы между размером файла на диске и в кеше = 0 byte ( cacheignoresz := 0 )
}
var  aTask: ITask;
begin
  BeforeProcOptimization;

  {$REGION ' OptimizeProfilesThread '}
   aTask := TTask.Create(
   procedure label Skipz;

   const
      CNST_MIN_FILE_SIZE    = 50*1024;   // 50kb
      CNST_MAX_SEARCH_DEPTH = -1;         // Unlimited

   var
  {$REGION ' var '}
    pFileList       : TList<TSearchRec>;
    tmpFileName     : string;
    MaskArray       : TStringDynArray;

    Node,                                            // Для обработки текущего профиля
    logNodeStart,                                    // Для лога
    logNodeProfile : PVirtualNode;                   // Для лога

    cacheignoresz,                                   // Минимальный размер разницы между размером файла на диске и в кеше
    profile_OptimizedFilesSizeBefore,                // Общий размер подлежащих оптимизации файлов обрабатываемого профиля До оптимизации
    profile_OptimizedFilesSizeAfter,                 // Общий размер подлежащих оптимизации файлов обрабатываемого профиля После оптимизации
    logTotal_OptimizedFilesSizeBefore,               // Общий размер оптимизированных файлов всех профилей До оптимизации
    logTotal_OptimizedFilesSizeAfter : Int64;        // Общий размер оптимизированных файлов всех профилей После оптимизации

    logProfileNo,                                    // Порядковый номер обрабатываемого профиля
    logTotal_FailedProfiles,                         // Кол-во отмеченых профилей которые не удалось найти
    logTotal_CheckedProfiles,                        // Кол-во отмеченых профилей
    logTotal_ProfileCount,                           // Кол-во всех профилей
    logTotal_OptimizedFileCount,                     // Общее кол-во файлов прошедших Оптимизацию
    logTotal_ProcessedFileCount,                     // Общее кол-во файлов прошедших Обработку
    profile_ProcessedFiles,                          // Кол-во файлов обрабатываемого профиля прошедших Обработку
    profile_SQLiteFiles,                             // Кол-во SQLite файлов в профиле
    profile_OptimizedFilesCount,                     // Кол-во файлов обрабатываемого профиля прошедших Оптимизацию
    profile_FilesCount       : Cardinal;             // Кол-во файлов обрабатываемого профиля

    profile_CacheIndex,                              // Индекс обрабатываемого профиля в кеше
    profile_CacheFileIndex   : Integer;              // Индекс файла (в кеше) обрабатываемого профиля

    LogTotalStopwatch        : TStopwatch;
    LogTotalElapsed          : TTimeSpan;
    ElapsedTimeStr: string;

    IsNewCacheEntry: Boolean;
  {$ENDREGION}

  begin
   LogTotalStopwatch := TStopwatch.StartNew;
   try
       logTotal_CheckedProfiles := 0;  // Checked profiles
       logTotal_ProfileCount    := 0;  // Total profiles

       // Setup progress =======================================
       {$REGION ' Setup progress '}

         if selectedOnly then
         begin
           logTotal_CheckedProfiles := 1;
           logTotal_ProfileCount     := 1;
         end else
         begin
           Node :=  VirtualStringTree1.GetFirstLevel(1);
           while Assigned(Node) do
           begin
             if (Node.CheckState = csCheckedNormal) and VirtualStringTree1.IsVisible[Node] then Inc(logTotal_CheckedProfiles);
             inc(logTotal_ProfileCount);
             Node := VirtualStringTree1.GetNextLevel(Node, 1);
           end;
         end;

         RzProgressBar2.TotalParts := logTotal_CheckedProfiles;
         RzProgressBar2.PartsComplete := 0;

         TThread.Synchronize(nil,
                    procedure
                    begin
                       RzStatusPane3.Caption := 'processing ...';
                       ProgressDlgVisible(True);
                    end);

       {$ENDREGION}

       logProfileNo                       := 0;
       logTotal_FailedProfiles            := 0;
       logTotal_ProcessedFileCount        := 0;
       logTotal_OptimizedFilesSizeBefore  := 0;
       logTotal_OptimizedFilesSizeAfter   := 0;
       logTotal_OptimizedFileCount        := 0;

       {$REGION ' log '}
       if ShowLog then
         TThread.Synchronize(TThread.Current, procedure
         begin
           VirtualStringTree2.BeginUpdate;

            if selectedOnly then
             logNodeStart := LogAdd(nil,
                                   'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                                   'selected profile',
                                   Format('Processed %s of %s, Optimized files: %s,  Size before: %s, Size after: %s', ['','','','',''])
                                    )
             else
             logNodeStart := LogAdd(nil,
                                   'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                                   Format('Enabled profiles: %s of %s', [logTotal_CheckedProfiles.ToString, logTotal_ProfileCount.ToString]),
                                   Format('Processed %s of %s, Optimized files: %s, Size before: %s, Size after: %s', ['','','','',''])
                                    );

           VirtualStringTree2.EndUpdate;
         end);
       {$ENDREGION}

     // Enum Processing
     if selectedOnly
     then Node := VirtualStringTree1.FocusedNode
     else Node := VirtualStringTree1.GetFirstLevel(1);

     while Assigned(Node) do
     begin
      if not (Node.CheckState.IsChecked or selectedOnly) then goto Skipz;
      if not VirtualStringTree1.IsVisible[Node] then goto Skipz;


      var ItemNodeData: PItemNodeData;
      ItemNodeData := VirtualStringTree1.GetNodeData(Node);

       {$REGION ' Действие если профиль отсутствует '}
          if not DirectoryExists( IncludeTrailingPathDelimiter( ExpandEnvironmentPath(ItemNodeData^.v_ProfileName) ) ) then  // Проверяем существование профиля
          begin                                                                                                              // Если профиль не найден то:
            inc(logTotal_FailedProfiles);
            if ShowLog then
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

            TThread.Synchronize(TThread.Current, procedure begin  RzProgressBar2.IncPartsByOne; end);

           Goto Skipz;
          end;
       {$ENDREGION}

       {$REGION ' Подготовка к оптимизации профиля '}
            // Reset
            profile_FilesCount                := 0;
            profile_ProcessedFiles            := 0;
            profile_OptimizedFilesSizeBefore  := 0;
            profile_OptimizedFilesSizeAfter   := 0;
            Profile_OptimizedFilesCount       := 0;
            profile_SQLiteFiles               := 0;

            cacheignoresz := 0;//  1*1024*1024; // 1 MB

           {$REGION ' log '}
              inc(logProfileNo);
              if ShowLog then
              TThread.Synchronize(TThread.Current, procedure
              begin
                 VirtualStringTree2.BeginUpdate;
                 logNodeProfile := LogAdd(logNodeStart,
                                          Format('#%s Profile (%s)', [logProfileNo.ToString,
                                                                      AppIndexToName(ItemNodeData^.h_AppIndex)]),
                                          ItemNodeData^.v_ProfileName,
                                          '-'
                                          );
                 VirtualStringTree2.EndUpdate;
              end);
           {$ENDREGION}

           // Profile index in cache
           profile_CacheIndex := APOCache.GetIndexByPathName( ItemNodeData^.v_ProfileName );                             // Получаем индекс профиля в кеше, если профиля нету то результат -1

           // Is new profile ?
           IsNewCacheEntry := profile_CacheIndex = -1;                                                                   // Установка флага новизны кеша на основе его (профиля в кеше) индекса
           if profile_CacheIndex = -1                                                                                    // Если в кеше нету профиля то
           then profile_CacheIndex := APOCache.AddProfile( ItemNodeData^.v_ProfileName)                                  // Создаём в кеше новый профиль и получаем его индекс
           else IsNewCacheEntry    := ( Length( APOCache.CacheRecArray[profile_CacheIndex].sqlfiles ) +                  // Если профиль в кеше есть но пустой, то ставим флаг новизны кеша
                                        Length( APOCache.CacheRecArray[profile_CacheIndex].sqlfilessz ) +
                                        Length( APOCache.CacheRecArray[profile_CacheIndex].nonsqlfiles ) ) = 0;
           // Search Mask
           if IsAppIndexFF( ItemNodeData^.h_AppIndex )                                                                   // Поисковая маска
           then MaskArray := ['*.sqlite', '*.db']                                                                        // для FF
           else MaskArray := ['*.*','*'];                                                                                // для всего остального

           // Get profile files
           pFileList := ScannDirectory(                                                                                  // Получаем список файлов в профиле
                                       ExpandEnvironmentPath(ItemNodeData^.v_ProfileName),                               // каталог
                                       MaskArray,                                                                        // маска
                                       CNST_MIN_FILE_SIZE,                                                               // минимальный размер файла
                                       CNST_MAX_SEARCH_DEPTH                                                             // максимальная глубина сканирования (-1 безконечная)
                                       );

           profile_FilesCount := pFileList.Count;                                                                        // кол-во файлов

           // Setup Profile progress
           TThread.Synchronize(TThread.Current, procedure
           begin
                RzProgressBar1.PartsComplete := 0;
                RzProgressBar1.TotalParts := profile_FilesCount;
           end);

           APOCache.CacheRecArray[profile_CacheIndex].BeginProc;
       {$ENDREGION}

       {$REGION ' оптимизация с кешироапнием '}
          var tmpFileSizeAfter : Int64;
          var i   : Integer;
          var vR  : TCacheValidateResult;

          profile_CacheFileIndex := -1;  // На случай если IsNewCacheEntry = True
          For i := 0 to profile_FilesCount-1 do
          begin
            if CancelOptProc then Break;
            tmpFileName := pFileList[i].Name ;

            if IsNewCacheEntry                                                                                           // Если кеш новый то
            then vR:= cvrNoFile                                                                                          // результат фалидации cvrNoFile
            else vR:= APOCache.CacheRecArray[profile_CacheIndex].validatefile(tmpFileName,                               // иначе валидация файла покешу
                                                                              pFileList[i].Size,
                                                                              cacheignoresz,
                                                                              profile_CacheFileIndex);
            case vR of
              cvrSQLiteNeedOptimization, cvrNoFile  :                                                                    // Если файл нуждается в оптимизации или его нету в кеше
              {$REGION ' cvrSQLiteNeedOptimization '}
              if IsSQLiteFile(tmpFileName) then                                                                          // Проверяем есть-ли у файла валидная сигнатура
              begin                                                                                                      // Если у файла валидная сигнатура
                SQLiteOptimizeFile( tmpFileName );                                                                       // Оптимизируем файл
                tmpFileSizeAfter := System.IOUtils.TFile.GetSize( tmpFileName );                                         // Получаем размер файла после оптимизации
                inc(profile_SQLiteFiles);                                                                                // Инкремент счетчика SQLite файлов


                if tmpFileSizeAfter < pFileList[i].Size then                                                             // Если оптимизация дала результат
                begin
                  inc(Profile_OptimizedFilesCount);                                                                      // инкремент кол-во оптимизированных файлов
                  inc(Profile_OptimizedFilesSizeBefore, pFileList[i].Size);                                              // общий размер профиля до
                  inc(Profile_OptimizedFilesSizeAfter, tmpFileSizeAfter);                                                // общий размер профиля после

                  if profile_CacheFileIndex = -1                                                                         // Если файла в кеше нету то
                  then APOCache.CacheRecArray[profile_CacheIndex].addfile(tmpFileName, tmpFileSizeAfter, True)           // Добавление в Кэш нового файла
                  else APOCache.CacheRecArray[profile_CacheIndex].UpdateFileByIndex(tmpFileName,                         // Иначе Обновление Кэша
                                                                                    tmpFileSizeAfter,
                                                                                    profile_CacheFileIndex);
                  if ShowLog then
                  TThread.Synchronize(TThread.Current, procedure
                  begin
                    LogAdd(LogNodeProfile,                                                                               // Запись в лог
                           Format('#%d %s',[ Profile_OptimizedFilesCount, ExtractFileName(tmpFileName) ]),               // #1 FileName.Ext
                           DeletePartPath(tmpFileName, Length(ItemNodeData^.v_ProfileName) ),                            // \Dir\FileName.Ext
                           Format( 'before: %s, after: %s', [ FormatByteSize(pFileList[i].Size),                         // before: 100 MB, after 50 MB
                                                              FormatByteSize(tmpFileSizeAfter) ])
                           );
                  end);
                end
                else
                  if profile_CacheFileIndex = -1                                                                         // Если файла в кеше нету то
                  then APOCache.CacheRecArray[profile_CacheIndex].addfile(tmpFileName, pFileList[i].Size, True);         // Добавление в Кэш нового файла

                                                                                            // инкремент кол-во обработанных файлов
              end
              else // Если у файла НЕвалидная сигнатура
                if profile_CacheFileIndex = -1                                                                           // Если файла в кеше нету то
                then APOCache.CacheRecArray[profile_CacheIndex].addfile(tmpFileName, 0, False)                           // Добавление в Кэш нового файла NonSQLite
                     // Сюда попадаем если файл ранее был SQLite, а потом перестал им быть
                else APOCache.CacheRecArray[profile_CacheIndex].UpdateFileByIndex(tmpFileName,                           // Иначе Обновление файла в Кэше
                                                                                  0,
                                                                                  profile_CacheFileIndex,
                                                                                  False);

              {$ENDREGION}
              cvrSQLiteNoNeedOptimization:  inc(profile_SQLiteFiles);                                                    // Если файл валидный (SQLite) но не нуждается в оптимизации
              cvrNonSQLite: ; // nothing                                                                                 // Если файл НЕвалидный (NonSQLite)
            end;

            inc(profile_ProcessedFiles);
            TThread.Synchronize(TThread.Current, procedure begin RzProgressBar1.IncPartsByOne; end);                     // *********** Progress bar Profile ********** //
          end;
       {$ENDREGION}

       {$REGION ' Конец оптимизации профиля '}

       var ProfileLastDT: TDateTime  :=  Now;                                                                            // Last update DateTime
       APOCache.CacheRecArray[profile_CacheIndex].lastoptdate := ProfileLastDT;                                          // Записываем в кеш дату конца оптимизации

       if not CancelOptProc then
       begin
         APOCache.CacheRecArray[profile_CacheIndex].EndProc;                                                             // Финалим кеш если процессинг закончился естественным путём
         Inc(APOCache.CacheRecArray[profile_CacheIndex].optimizations);                                                  // Инкремент каунтера оптимизаций в кэше
       end
       else
       Begin
         APOCache.CacheRecArray[profile_CacheIndex].ClearTmpFilesCache;
         APOCache.CacheRecArray[profile_CacheIndex].SetProfileCancelled(IsNewCacheEntry) ;                               // Если был отменен процессинг нового профиля, то очистить его кеш
       End;


       pFileList.Free;                                                                                                   // Освобождаем список файлов профиля

       // *********** VST ********** //
       ItemNodeData^.v_SizeBefore   := FormatByteSize( Profile_OptimizedFilesSizeBefore );                               // VST Before
       ItemNodeData^.v_SizeAfter    := FormatByteSize( Profile_OptimizedFilesSizeAfter );                                // VST After
       ItemNodeData^.v_FilesCount   := profile_SQLiteFiles.ToString + ' \ ' + Profile_OptimizedFilesCount.ToString ;     // Всего SQL файлов \ Оптимизированно
       ItemNodeData^.h_RateProgress := CalcRate(Profile_OptimizedFilesSizeBefore, Profile_OptimizedFilesSizeAfter );     // VST ProgressBar
       ItemNodeData^.v_RateStr      := ItemNodeData^.h_RateProgress.ToString + '%';                                      // VST ProgressBar Caption

       if not CancelOptProc then
       ItemNodeData^.v_LastProcDate := 'Today at: ' + FormatDateTime('hh:nn', ProfileLastDT)                             // VST Date
       else
       ItemNodeData^.v_LastProcDate :=  'Cancelled at: ' + FormatDateTime('hh:nn', ProfileLastDT);

       // *********** Total Counter ********** //
       if ShowLog then
       begin                                                                     // Total Counters
         inc(logTotal_ProcessedFileCount,           Profile_ProcessedFiles);                                               // Total Files Processed
         inc(logTotal_OptimizedFilesSizeBefore,     Profile_OptimizedFilesSizeBefore);                                     // Total Optimized Files Size Before
         inc(logTotal_OptimizedFilesSizeAfter,      Profile_OptimizedFilesSizeAfter);                                      // Total Optimized Files Size After
         inc(logTotal_OptimizedFileCount,           Profile_OptimizedFilesCount);                                          // Total files optimized

         TThread.Synchronize(TThread.Current, procedure
         begin
           VirtualStringTree2.BeginUpdate;
           LogEdit(logNodeProfile,
                    Format('#%s Profile (%s)', [logProfileNo.ToString, AppIndexToName(ItemNodeData^.h_AppIndex)]),         // #1 Profile (FireFox)
                    ItemNodeData^.v_ProfileName,                                                                           // c:\profile\path\
                    Format('Processed: %s, Optimized: %s, Size before: %s, Size after: %s',                                // Optimized files: 2, Size before: 3 mb, Size after: 1 mb
                                   [Profile_ProcessedFiles.ToString,
                                    Profile_OptimizedFilesCount.ToString,
                                    FormatByteSize( Profile_OptimizedFilesSizeBefore ),
                                    FormatByteSize( Profile_OptimizedFilesSizeAfter )
                                    ])
                           );
           VirtualStringTree2.EndUpdate;
         end);
       end;

       TThread.Synchronize(TThread.Current, procedure begin RzProgressBar2.IncPartsByOne; end);                          // *********** Progress bar overall (if Optimize Checked) ********** //

       {$ENDREGION}

       Skipz:
        if CancelOptProc then Break;
        if selectedOnly then Node := nil else Node :=  VirtualStringTree1.GetNextLevel(Node, 1);
     end;

   finally
    {$REGION ' Общая финализация '}
      LogTotalStopwatch.Stop;
      LogTotalElapsed := LogTotalStopwatch.Elapsed;
      ElapsedTimeStr := LogTotalElapsed.TotalSeconds.ToString(ffNumber, 4, 2);

      if ShowLog then
      TThread.Synchronize(TThread.Current, procedure
      begin
        VirtualStringTree2.BeginUpdate;
        if not CancelOptProc then
        LogEdit(LogNodeStart,
                   '',                                                                                                    // 'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                   '',                                                                                                    // Format('Enabled profiles: %s of %s', [TP.ToString, AP.ToString]),
                   Format( 'Completed in: ~%s sec. Profiles done: %s of %s. '+
                           'Files processed: %s, optimized: %s. Total size before: %s, after: %s',
                          [
                          ElapsedTimeStr,                                                                                 // Completed in: ~%s sec
                          (logTotal_CheckedProfiles-logTotal_FailedProfiles).ToString,                                    // Profiles done: %s
                          logTotal_CheckedProfiles.ToString,                                                              // of %s.
                          logTotal_ProcessedFileCount.ToString,                                                           // Files processed: %s
                          logTotal_OptimizedFileCount.ToString,                                                           // optimized: %s.
                          FormatByteSize( logTotal_OptimizedFilesSizeBefore),                                             // Total size before: %s
                          FormatByteSize( logTotal_OptimizedFilesSizeAfter)                                               // after: %s'
                          ]
                         )
              )
        else
         LogEdit(LogNodeStart,
                   '',                                                                                                    // 'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                   '',                                                                                                    // Format('Enabled profiles: %s of %s', [TP.ToString, AP.ToString]),
                   Format( 'Cancelled after: ~%s sec. Profiles done: %s of %s. '+
                           'Files processed: %s, optimized: %s. Total size before: %s, after: %s',
                          [
                          ElapsedTimeStr,                                                                                 // Completed in: ~%s sec
                          (logTotal_CheckedProfiles-logTotal_FailedProfiles).ToString,                                    // Profiles done: %s
                          logTotal_CheckedProfiles.ToString,                                                              // of %s.
                          logTotal_ProcessedFileCount.ToString,                                                           // Files processed: %s
                          logTotal_OptimizedFileCount.ToString,                                                           // optimized: %s.
                          FormatByteSize( logTotal_OptimizedFilesSizeBefore),                                             // Total size before: %s
                          FormatByteSize( logTotal_OptimizedFilesSizeAfter)                                               // after: %s'
                          ]
                         )
              );
        VirtualStringTree2.EndUpdate;
      end);
    {$ENDREGION}
   end;
    AfterProcOptimization(ElapsedTimeStr);
  end);
 {$ENDREGION}

  aTask.Start;
end;

procedure TFormMain.ProcOptimizeFastLOG(const selectedOnly: Boolean = False; const ShowLog: Boolean = False);
{
  * Быстрая оптимизация
    - Осуществляется на основе кешированных файлов размер которых отличается на 1 MB от ранее записанных в кеш.
    - Если профиля нет в кеше то осуществляется Полная оптимизация
      * Полная оптимизация
      - Осуществляет поиск по подкаталогам без ограничения их глубины ( CNST_MAX_SEARCH_DEPTH := -1 )
      - Минимальный размер искомого файла 100kb ( CNST_MIN_FILE_SIZE := 50*1024 )
      - Минимальный размер разницы между размером файла на диске и в кеше = 0 byte ( cacheignoresz := 0 )
}

var  aTask: ITask;
begin
  BeforeProcOptimization;

  {$REGION ' OptimizeProfilesThread '}
   aTask := TTask.Create(
   procedure label Skipz;

   const
      CNST_MIN_FILE_SIZE          = 50*1024;     // 50kb
      CNST_MAX_SEARCH_DEPTH       = -1;           // Unlimited
      CNST_CACHE_IGNOREIFLESSTHAN = 1*1024*1024;  // 1MB  Минимальный размер разницы между размером файла на диске и в кеше

   var
  {$REGION ' var '}
    pFileList       : TList<TSearchRec>;
    tmpFileName     : string;
    MaskArray       : TStringDynArray;

    Node,                                            // Для обработки текущего профиля
    logNodeStart,                                    // Для лога
    logNodeProfile : PVirtualNode;                   // Для лога

    profile_OptimizedFilesSizeBefore,                // Общий размер подлежащих оптимизации файлов обрабатываемого профиля До оптимизации
    profile_OptimizedFilesSizeAfter,                 // Общий размер подлежащих оптимизации файлов обрабатываемого профиля После оптимизации
    logTotal_OptimizedFilesSizeBefore,               // Общий размер оптимизированных файлов всех профилей До оптимизации
    logTotal_OptimizedFilesSizeAfter : Int64;        // Общий размер оптимизированных файлов всех профилей После оптимизации

    logProfileNo,                                    // Порядковый номер обрабатываемого профиля
    logTotal_FailedProfiles,                         // Кол-во отмеченых профилей которые не удалось найти
    logTotal_CheckedProfiles,                        // Кол-во отмеченых профилей
    logTotal_ProfileCount,                           // Кол-во всех профилей
    logTotal_OptimizedFileCount,                     // Общее кол-во файлов прошедших Оптимизацию
    logTotal_ProcessedFileCount,                     // Общее кол-во файлов прошедших Обработку
    profile_ProcessedFiles,                          // Кол-во файлов обрабатываемого профиля прошедших Обработку
    profile_SQLiteFiles,
    profile_OptimizedFilesCount,                     // Кол-во файлов обрабатываемого профиля прошедших Оптимизацию
    profile_FilesCount       : Cardinal;             // Кол-во файлов обрабатываемого профиля

    profile_CacheIndex,                              // Индекс обрабатываемого профиля в кеше
    profile_CacheFileIndex    : Integer;              // Индекс файла (в кеше) обрабатываемого профиля

    LogTotalStopwatch        : TStopwatch;
    LogTotalElapsed          : TTimeSpan;
    ElapsedTimeStr: string;
    i: integer;
    IsNewCacheEntry: Boolean;
  {$ENDREGION}

  begin
   LogTotalStopwatch := TStopwatch.StartNew;
   try
       logTotal_CheckedProfiles := 0;  // Checked profiles
       logTotal_ProfileCount    := 0;  // Total profiles

       // Setup progress =======================================
       {$REGION ' Setup progress '}

         if selectedOnly then
         begin
           logTotal_CheckedProfiles := 1;
           logTotal_ProfileCount     := 1;
         end else
         begin
           Node :=  VirtualStringTree1.GetFirstLevel(1);
           while Assigned(Node) do
           begin
             if (Node.CheckState = csCheckedNormal) and VirtualStringTree1.IsVisible[Node] then Inc(logTotal_CheckedProfiles);
             inc(logTotal_ProfileCount);
             Node := VirtualStringTree1.GetNextLevel(Node, 1);
           end;
         end;

         RzProgressBar2.TotalParts := logTotal_CheckedProfiles;
         RzProgressBar2.PartsComplete := 0;

         TThread.Synchronize(nil,
                    procedure
                    begin
                       RzStatusPane3.Caption := 'processing ...';
                       ProgressDlgVisible(True);
                    end);

       {$ENDREGION}

       logProfileNo                       := 0;
       logTotal_FailedProfiles            := 0;
       logTotal_ProcessedFileCount        := 0;
       logTotal_OptimizedFilesSizeBefore  := 0;
       logTotal_OptimizedFilesSizeAfter   := 0;
       logTotal_OptimizedFileCount        := 0;

       {$REGION ' log '}
         if ShowLog then
         TThread.Synchronize(TThread.Current, procedure
         begin
           VirtualStringTree2.BeginUpdate;

            if selectedOnly then
             logNodeStart := LogAdd(nil,
                                   'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                                   'selected profile',
                                   Format('Processed %s of %s, Optimized files: %s,  Size before: %s, Size after: %s', ['','','','',''])
                                    )
             else
             logNodeStart := LogAdd(nil,
                                   'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                                   Format('Enabled profiles: %s of %s', [logTotal_CheckedProfiles.ToString, logTotal_ProfileCount.ToString]),
                                   Format('Processed %s of %s, Optimized files: %s, Size before: %s, Size after: %s', ['','','','',''])
                                    );

           VirtualStringTree2.EndUpdate;
         end);
       {$ENDREGION}

     // Enum Processing
     if selectedOnly
     then Node := VirtualStringTree1.FocusedNode
     else Node := VirtualStringTree1.GetFirstLevel(1);

     while Assigned(Node) do
     begin
      if not (Node.CheckState.IsChecked or selectedOnly) then goto Skipz;
      if not VirtualStringTree1.IsVisible[Node] then goto Skipz;

      var ItemNodeData: PItemNodeData;
      ItemNodeData := VirtualStringTree1.GetNodeData(Node);

      if not DirectoryExists( IncludeTrailingPathDelimiter( ExpandEnvironmentPath(ItemNodeData^.v_ProfileName) ) ) then  // Проверяем существование профиля
      begin                                                                                                              // Если профиль не найден то:
       {$REGION ' Действие если профиль отсутствует '}
        inc(logTotal_FailedProfiles);

        if ShowLog then
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

        TThread.Synchronize(TThread.Current, procedure begin  RzProgressBar2.IncPartsByOne; end);

       Goto Skipz;
       {$ENDREGION}
      end;

       inc(logProfileNo);

      {$REGION ' Подготовка к оптимизации профиля '}
        // Reset
        profile_FilesCount                := 0;
        profile_ProcessedFiles            := 0;
        profile_OptimizedFilesSizeBefore  := 0;
        profile_OptimizedFilesSizeAfter   := 0;
        Profile_OptimizedFilesCount       := 0;
        profile_SQLiteFiles               := 0;

        if ShowLog then
        TThread.Synchronize(TThread.Current, procedure
        begin
           VirtualStringTree2.BeginUpdate;
           logNodeProfile := LogAdd(logNodeStart,
                                    Format('#%s Profile (%s)', [logProfileNo.ToString,
                                                                AppIndexToName(ItemNodeData^.h_AppIndex)]),
                                    ItemNodeData^.v_ProfileName,
                                    '-'
                                    );
           VirtualStringTree2.EndUpdate;
        end);

        {
        profile_CacheIndex := APOCache.GetIndexByPathName( ItemNodeData^.v_ProfileName );

        var IsNewCacheEntry: Boolean := false;
        if profile_CacheIndex = -1 then
        begin
          profile_CacheIndex := APOCache.AddProfile( ItemNodeData^.v_ProfileName);
          IsNewCacheEntry := True;
        end else
        begin
          IsNewCacheEntry := ( Length( APOCache.CacheRecArray[profile_CacheIndex].sqlfiles ) +
                             Length( APOCache.CacheRecArray[profile_CacheIndex].sqlfilessz ) +
                             Length( APOCache.CacheRecArray[profile_CacheIndex].nonsqlfiles ) ) = 0;
        end;
          }

         // Profile index in cache
         profile_CacheIndex := APOCache.GetIndexByPathName( ItemNodeData^.v_ProfileName );                               // Получаем индекс профиля в кеше, если профиля нету то результат -1

         // Is new profile ?
         IsNewCacheEntry:= profile_CacheIndex = -1;                                                        // Установка флага новизны кеша на основе его (профиля в кеше) индекса
         if profile_CacheIndex = -1                                                                                      // Если в кеше нету профиля то
         then profile_CacheIndex := APOCache.AddProfile( ItemNodeData^.v_ProfileName)                                    // Создаём в кеше новый профиль и получаем его индекс
         else IsNewCacheEntry    := ( Length( APOCache.CacheRecArray[profile_CacheIndex].sqlfiles ) +                    // Если профиль в кеше есть но пустой, то ставим флаг новизны кеша
                                      Length( APOCache.CacheRecArray[profile_CacheIndex].sqlfilessz ) +
                                      Length( APOCache.CacheRecArray[profile_CacheIndex].nonsqlfiles ) ) = 0;


        if IsNewCacheEntry then
        begin
            if IsAppIndexFF( ItemNodeData^.h_AppIndex )
            then MaskArray := ['*.sqlite', '*.db']
            else MaskArray := ['*.*','*'];

            // Get profile files
            pFileList := ScannDirectory(
                                         ExpandEnvironmentPath(ItemNodeData^.v_ProfileName),
                                         MaskArray,
                                         CNST_MIN_FILE_SIZE,
                                         CNST_MAX_SEARCH_DEPTH
                                        );
        end else
        begin
          //Prepare pFileList from Cache
          var Rec: TSearchRec;
          pFileList := TList<TSearchRec>.Create;
          for I := 0 to High(APOCache.CacheRecArray[profile_CacheIndex].sqlfiles) do
          begin
             tmpFileName := APOCache.CacheRecArray[profile_CacheIndex].sqlfiles[i];
             if not FileExists(tmpFileName) then Continue;
             rec.Size := System.IOUtils.TFile.GetSize( tmpFileName );
             inc(profile_SQLiteFiles);
             if not (rec.Size >= APOCache.CacheRecArray[profile_CacheIndex].sqlfilessz[i]+CNST_CACHE_IGNOREIFLESSTHAN )
             then Continue;
             rec.Name := tmpFileName;
             pFileList.Add( rec );
          end;
        end;

         profile_FilesCount := pFileList.Count;

        // Setup Profile progress
         TThread.Synchronize(TThread.Current, procedure
         begin
              RzProgressBar1.PartsComplete := 0;
              RzProgressBar1.TotalParts := profile_FilesCount;
         end);
      {$ENDREGION}

      {$REGION ' Oптимизация '}
       var tmpFileSizeAfter : Int64;

       {$REGION ' ЕСЛИ НЕкешированный профиль '}
        //profile_CacheFileIndex := -1;  // На случай если IsNewCacheEntry = True
        if IsNewCacheEntry then
        For i := 0 to profile_FilesCount-1 do
        begin
          if CancelOptProc then Break;
          tmpFileName := pFileList[i].Name ;

            if IsSQLiteFile(tmpFileName) then                                                                            // Проверяем есть-ли у файла валидная сигнатура
            begin                                                                                                        // Если у файла валидная сигнатура
              SQLiteOptimizeFile( tmpFileName );                                                                         // Оптимизируем файл
              tmpFileSizeAfter := System.IOUtils.TFile.GetSize( tmpFileName );                                           // Получаем размер файла после оптимизации
              inc(profile_SQLiteFiles);
              if tmpFileSizeAfter < pFileList[i].Size then                                                               // Если оптимизация дала результат
              begin
                inc(Profile_OptimizedFilesCount);                                                                        // инкремент кол-во оптимизированных файлов
                inc(Profile_OptimizedFilesSizeBefore, pFileList[i].Size);                                                // общий размер профиля до
                inc(Profile_OptimizedFilesSizeAfter, tmpFileSizeAfter);                                                  // общий размер профиля после

                APOCache.CacheRecArray[profile_CacheIndex].addfile(tmpFileName, tmpFileSizeAfter, True);             // Добавление в Кэш нового файла

                if ShowLog then
                TThread.Synchronize(TThread.Current, procedure
                begin
                  LogAdd(LogNodeProfile,                                                                                 // Запись в лог
                         Format('#%d %s',[ Profile_OptimizedFilesCount, ExtractFileName(tmpFileName) ]),                 // #1 FileName.Ext
                         DeletePartPath(tmpFileName, Length(ItemNodeData^.v_ProfileName) ),                              // \Dir\FileName.Ext
                         Format( 'before: %s, after: %s', [ FormatByteSize(pFileList[i].Size),                           // before: 100 MB, after 50 MB
                                                            FormatByteSize(tmpFileSizeAfter) ])
                         );
                end);
              end
              else
               APOCache.CacheRecArray[profile_CacheIndex].addfile(tmpFileName, pFileList[i].Size, True);             // Добавление в Кэш нового файла
            end
            else // Если у файла НЕвалидная сигнатура
               APOCache.CacheRecArray[profile_CacheIndex].addfile(tmpFileName, 0, False);              // Добавление в Кэш нового файла

          inc(profile_ProcessedFiles); // инкремент кол-во обработанных файлов

          TThread.Synchronize(TThread.Current, procedure begin RzProgressBar1.IncPartsByOne; end);                       // *********** Progress bar Profile ********** //
        end;
       {$ENDREGION}

       {$REGION ' ИНАЧЕ кешированный профиль '}
         if (NOT IsNewCacheEntry) then                                                                                   // Если это кешированный профиль
         For i := 0 to profile_FilesCount-1 do                                                                           // То применяем быструю оптимизацию
         begin
           if CancelOptProc then Break;
           tmpFileName := pFileList[i].Name ;

           // inc(profile_SQLiteFiles);
           // Проверки сигнатуры нету, считаем что она валидная (для скорости)
           SQLiteOptimizeFile( tmpFileName );                                                                            // Оптимизируем файл
           tmpFileSizeAfter := System.IOUtils.TFile.GetSize( tmpFileName );                                              // Получаем размер файла после оптимизации

           if tmpFileSizeAfter < pFileList[i].Size then                                                                  // Если оптимизация дала результат
           begin
             inc(Profile_OptimizedFilesCount);                                                                           // инкремент кол-во оптимизированных файлов
             inc(Profile_OptimizedFilesSizeBefore, pFileList[i].Size);                                                   // общий размер профиля до
             inc(Profile_OptimizedFilesSizeAfter, tmpFileSizeAfter);                                                     // общий размер профиля после

             APOCache.CacheRecArray[profile_CacheIndex].UpdateFileByName(tmpFileName, tmpFileSizeAfter, True);                 // Обновляем файл в кеше

             if ShowLog then
             TThread.Synchronize(TThread.Current, procedure
             begin
                LogAdd(LogNodeProfile,                                                                                   // Запись в лог
                       Format('#%d %s',[ Profile_OptimizedFilesCount, ExtractFileName(tmpFileName) ]),                   // #1 FileName.Ext
                       DeletePartPath(tmpFileName, Length(ItemNodeData^.v_ProfileName) ),                                // \Dir\FileName.Ext
                       Format( 'before: %s, after: %s', [ FormatByteSize(pFileList[i].Size),                             // before: 100 MB, after 50 MB
                                                          FormatByteSize(tmpFileSizeAfter) ])
                       );
             end);
           end;
           inc(profile_ProcessedFiles);                                                                                  // инкремент кол-во обработанных файлов
           TThread.Synchronize(TThread.Current, procedure begin RzProgressBar1.IncPartsByOne; end);                      // *********** Progress bar Profile ********** //
         end;
       {$ENDREGION}

      {$ENDREGION}

      {$REGION ' Конец оптимизации профиля '}

       APOCache.CacheRecArray[profile_CacheIndex].ClearTmpFilesCache;
       var ProfileLastDT: TDateTime  :=  Now;                      // Last update DateTime

       if not CancelOptProc then
       begin
         APOCache.CacheRecArray[profile_CacheIndex].lastoptdate := ProfileLastDT;                                        // Записываем в кеш дату конца оптимизации
         Inc(APOCache.CacheRecArray[profile_CacheIndex].optimizations);                                                  // Инкремент каунтера оптимизаций в кэше
         APOCache.CacheRecArray[profile_CacheIndex].Cancelled := False;
       end else
       begin
         APOCache.CacheRecArray[profile_CacheIndex].SetProfileCancelled(IsNewCacheEntry) ;                               // Если был отменен процессинг нового профиля, то очистить его кеш
       end;

       pFileList.Free;                                                                                                   // Освобождаем список файлов профиля

       // *********** VST ********** //
       ItemNodeData^.v_SizeBefore   := FormatByteSize( Profile_OptimizedFilesSizeBefore );                               // VST Before
       ItemNodeData^.v_SizeAfter    := FormatByteSize( Profile_OptimizedFilesSizeAfter );                                // VST After
       ItemNodeData^.v_FilesCount   := profile_SQLiteFiles.ToString + ' \ ' + Profile_OptimizedFilesCount.ToString ;  // Всего SQL файлов  \ Оптимизированно
       ItemNodeData^.h_RateProgress := CalcRate(Profile_OptimizedFilesSizeBefore, Profile_OptimizedFilesSizeAfter );     // VST ProgressBar
       ItemNodeData^.v_RateStr      := ItemNodeData^.h_RateProgress.ToString + '%';                                      // VST ProgressBar Caption

       if not CancelOptProc
       then ItemNodeData^.v_LastProcDate := 'Today at: ' + FormatDateTime('hh:nn', ProfileLastDT)                             // VST Date
       else ItemNodeData^.v_LastProcDate :=  'Cancelled at: ' + FormatDateTime('hh:nn', ProfileLastDT);

       if ShowLog then
       begin
         // *********** Total Counter ********** //                                                                        // Total Counters
         inc(logTotal_ProcessedFileCount,           Profile_ProcessedFiles);                                               // Total Files Processed
         inc(logTotal_OptimizedFilesSizeBefore,     Profile_OptimizedFilesSizeBefore);                                     // Total Optimized Files Size Before
         inc(logTotal_OptimizedFilesSizeAfter,      Profile_OptimizedFilesSizeAfter);                                      // Total Optimized Files Size After
         inc(logTotal_OptimizedFileCount,           Profile_OptimizedFilesCount);                                          // Total files optimized

         TThread.Synchronize(TThread.Current, procedure
         begin
           VirtualStringTree2.BeginUpdate;
           LogEdit(logNodeProfile,
                    Format('#%s Profile (%s)', [logProfileNo.ToString, AppIndexToName(ItemNodeData^.h_AppIndex)]),         // #1 Profile (FireFox)
                    ItemNodeData^.v_ProfileName,                                                                           // c:\profile\path\
                    Format('Processed: %s, Optimized: %s, Size before: %s, Size after: %s',                                // Optimized files: 2, Size before: 3 mb, Size after: 1 mb
                                   [Profile_ProcessedFiles.ToString,
                                    Profile_OptimizedFilesCount.ToString,
                                    FormatByteSize( Profile_OptimizedFilesSizeBefore ),
                                    FormatByteSize( Profile_OptimizedFilesSizeAfter )
                                    ])
                           );
           VirtualStringTree2.EndUpdate;
         end);

       end;
       TThread.Synchronize(TThread.Current, procedure begin RzProgressBar2.IncPartsByOne; end);                          // *********** Progress bar overall (if Optimize Checked) ********** //

      {$ENDREGION}

       Skipz:
        if CancelOptProc then Break;
        if selectedOnly then Node := nil else Node := VirtualStringTree1.GetNextLevel(Node, 1);
     end;

   finally
      {$REGION ' Общая финализация '}
       LogTotalStopwatch.Stop;
       LogTotalElapsed := LogTotalStopwatch.Elapsed;
       ElapsedTimeStr  := LogTotalElapsed.TotalSeconds.ToString(ffNumber, 4, 2);


        if ShowLog then
        TThread.Synchronize(TThread.Current, procedure
        begin
         VirtualStringTree2.BeginUpdate;
           if not CancelOptProc then
           LogEdit(LogNodeStart,
                       '',                                                                                                  // 'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                       '',                                                                                                  // Format('Enabled profiles: %s of %s', [TP.ToString, AP.ToString]),
                       Format( 'Completed in: ~%s sec. Profiles done: %s of %s. '+
                               'Files processed: %s, optimized: %s. Total size before: %s, after: %s',
                              [
                              ElapsedTimeStr,                                                                               // Completed in: ~%s sec
                              (logTotal_CheckedProfiles-logTotal_FailedProfiles).ToString,                                  // Profiles done: %s
                              logTotal_CheckedProfiles.ToString,                                                            // of %s.
                              logTotal_ProcessedFileCount.ToString,                                                         // Files processed: %s
                              logTotal_OptimizedFileCount.ToString,                                                         // optimized: %s.
                              FormatByteSize( logTotal_OptimizedFilesSizeBefore),                                           // Total size before: %s
                              FormatByteSize( logTotal_OptimizedFilesSizeAfter)                                             // after: %s'
                              ]
                             )
                  )
           else
           LogEdit(LogNodeStart,
                     '',                                                                                                    // 'Start: ' + FormatDateTime('[hh:mmm:ss]', now),
                     '',                                                                                                    // Format('Enabled profiles: %s of %s', [TP.ToString, AP.ToString]),
                     Format( 'Cancelled after: ~%s sec. Profiles done: %s of %s. '+
                             'Files processed: %s, optimized: %s. Total size before: %s, after: %s',
                            [
                            ElapsedTimeStr,                                                                                 // Completed in: ~%s sec
                            (logTotal_CheckedProfiles-logTotal_FailedProfiles).ToString,                                    // Profiles done: %s
                            logTotal_CheckedProfiles.ToString,                                                              // of %s.
                            logTotal_ProcessedFileCount.ToString,                                                           // Files processed: %s
                            logTotal_OptimizedFileCount.ToString,                                                           // optimized: %s.
                            FormatByteSize( logTotal_OptimizedFilesSizeBefore),                                             // Total size before: %s
                            FormatByteSize( logTotal_OptimizedFilesSizeAfter)                                               // after: %s'
                            ]
                           )
                );
         VirtualStringTree2.EndUpdate;
        end);
      {$ENDREGION}
   end;
    AfterProcOptimization(ElapsedTimeStr);
  end);
 {$ENDREGION}

  aTask.Start;
end;

{$ENDREGION}

{$REGION ' pop 2 + '}

procedure TFormMain.updateButtonsState;

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

  var checked_profile : boolean := VSTHasCheckedNodes;
  Action36.Enabled := checked_profile; // Optimize checked
  Action16.Enabled := checked_profile;

  var profile_selected : boolean := False;
  if Assigned(VirtualStringTree1.FocusedNode)
  then
   profile_selected :=
       (VirtualStringTree1.RootNodeCount > 0 ) and
       (VirtualStringTree1.GetNodeLevel(VirtualStringTree1.FocusedNode) = 1) ;

  Action35.Enabled := profile_selected;  // Почемуто надо вызвать два раза
  Action17.Enabled := profile_selected;  // Почемуто надо вызвать два раза
  Action17.Enabled := profile_selected;  // Почемуто надо вызвать два раза

  Action31.Enabled := profile_selected;
  Action32.Enabled := profile_selected;


  Action40.Enabled := profile_selected; //edit
  Action9.Enabled  := profile_selected; //edit

  Action41.Enabled := profile_selected; //delete
  Action10.Enabled := profile_selected; //delete

  Action44.Enabled := profile_selected; //copy path
  Action19.Enabled := profile_selected; //copy path

  Action45.Enabled := profile_selected; //open path
  Action18.Enabled := profile_selected; //open path

  Action13.Enabled := profile_selected;  //hide
  Action14.Enabled := profile_selected;  //show

  Action11.Enabled := (VirtualStringTree1.RootNodeCount > 0 );     //check all
  Action42.Enabled := (VirtualStringTree1.RootNodeCount > 0 );

  Action12.Enabled := (VirtualStringTree1.RootNodeCount > 0 );     //uncheck all
  Action43.Enabled := (VirtualStringTree1.RootNodeCount > 0 );
end;

{$ENDREGION}



{$REGION ' VST events + '}
procedure TFormMain.VirtualStringTree1BeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
var
  ItemNodeData: PItemNodeData;
  LDetails: TThemedElementDetails;
begin
  if Column <> VST_RATE_COLUMN_INDEX then Exit;
  if Sender.GetNodeLevel(Node) = 0 then  Exit;

  ItemNodeData := Sender.GetNodeData(Node);

  // ***********************************************************************
  // if (toThemeAware in VirtualStringTree1.TreeOptions.PaintOptions) then
  // ***********************************************************************
  if Assigned(ItemNodeData) then
  begin
    InflateRect(CellRect, -1, -1);
    LDetails := StyleServices.GetElementDetails(tpBar);
    StyleServices.DrawElement(TargetCanvas.Handle, LDetails, CellRect, nil);
    InflateRect(CellRect, -2, -2);
    CellRect.Right := CellRect.Left + Trunc(RectWidth(CellRect) * ItemNodeData^.h_RateProgress / 100);
    LDetails := StyleServices.GetElementDetails(tpChunk);
    StyleServices.DrawElement(TargetCanvas.Handle, LDetails, CellRect, nil);
  end;
end;

procedure TFormMain.VirtualStringTree1Checked(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  updateButtonsState;

  if not Assigned(Node) then Exit;
  if Sender.GetNodeLevel(Node) = 0 then Exit;

  var ItemNodeData: PItemNodeData;
  var pIndex: integer;

  ItemNodeData := VirtualStringTree1.GetNodeData(Node);
  pIndex := APOSettings.GetProfileIndex( ItemNodeData^.v_ProfileName );

  APOSettings.g_profiles[pIndex].p_optimizationenabled := Sender.CheckState[Node] in [csCheckedPressed, csCheckedNormal] ;

end;

procedure TFormMain.VirtualStringTree1DragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState;
  State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
begin
     Accept := True;
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
    ImageIndex := AppImageIndexFromIndex(ItemNodeData^.h_AppIndex); // AppImageIndexFromType( ItemNodeData^.h_AppIndex );

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

      VST_OPTIMIZED_COLUMN_INDEX  : CellText := ItemNodeData^.v_LastProcDate;
    end;
end;

procedure TFormMain.VirtualStringTree1NodeClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
begin
 updateButtonsState;
end;

{$ENDREGION}

{$REGION ' LOG, VST + '}

procedure TFormMain.Action28Update(Sender: TObject);
begin
PopupActionBar2Popup(nil);
end;

procedure TFormMain.Action29Update(Sender: TObject);
begin
PopupActionBar2Popup(nil);
end;

procedure TFormMain.Action30Execute(Sender: TObject);
begin
//
end;

procedure TFormMain.PopupActionBar2Popup(Sender: TObject);
begin
  //
  Action29.Enabled := False;
  Action28.Enabled := False;
  Action28.Caption := LOG_COPY_BTN_CAPTION; //'Copy';
  Action29.Caption := LOG_OPEN_BTN_CAPTION; //'Open';

  if VirtualStringTree2.FocusedNode = nil then Exit;
  if VirtualStringTree2.RootNodeCount = 0 then Exit;

  Action28.Enabled := True;

  var gLevel: integer := VirtualStringTree2.GetNodeLevel( VirtualStringTree2.FocusedNode )  ;
  Action29.Enabled := gLevel in [2, 1];
  case gLevel of
    2: begin
        Action29.Caption := LOG_OPEN_SELFILE_IN_EXPLORER_BTN_CAPTION; // LOG_OPEN_SELFILE_IN_EXPLORER_BTN_CAPTION = 'Open selected file in explorer'
        Action28.Caption := LOG_COPY_SELFILE_BTN_CAPTION; // LOG_COPY_SELFILE_BTN_CAPTION = 'Copy selected file';
       end;

    1: begin
        Action29.Caption := LOG_OPEN_SELPATH_IN_EXPLORER_BTN_CAPTION; //= 'Open selected path in explorer';
        Action28.Caption := LOG_COPY_PROFILE_FILES_BTN_CAPTION; //= 'Copy profile file(s)';
       end;

    0: Action28.Caption := LOG_COPY_PROFILES_AND_FILES;   // LOG_COPY_PROFILES_AND_FILES = 'Copy profile(s) and files';
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
   ChangeLogpanelVisibility;
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



{$REGION ' --- '}
//  System.IOUtils.TFile.AppendAllText( 'Log.txt', '.......' + #13#10 ) ;
{$ENDREGION}



end.
