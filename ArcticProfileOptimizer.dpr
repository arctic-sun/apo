program ArcticProfileOptimizer;
 {-$DEFINE DEBUGMODE}
uses
  Vcl.Forms,
  SysUtils,
  System.IOUtils,
  frmMain in 'frmMain.pas' {FormMain},
  Vcl.Themes,
  Vcl.Styles,
  frmInfoUnit in 'frmInfoUnit.pas' {frmInfo},
  frmSettingsUnit in 'frmSettingsUnit.pas' {frmSettings},
  UtilsUnit in 'UtilsUnit.pas',
  frmAddProfileUnit in 'frmAddProfileUnit.pas' {AddProfileDlgForm},
  DataModuleUnit in 'DataModuleUnit.pas' {DataModule1: TDataModule},
  BatScriptUnt in 'BatScriptUnt.pas',
  aConstUnit in 'aConstUnit.pas';

{$R *.res}

function GetAppSettingsPath: string;
begin
  if APO_Portable then
   Result := IncludeTrailingPathDelimiter( ExtractFilePath( paramStr(0) ) ) + APP_PORTABLE_SETTINGS_PATH
  else
   Result := GetEnvironmentVariable('USERPROFILE') + APP_SETTINGS_PATH ;
end;

function GetSkinIndex:Integer;
var s, tmp_str: string;
    str_items : TArray<string>;
begin
    tmp_str := GetAppSettingsPath;// GetEnvironmentVariable('USERPROFILE') + APP_SETTINGS_PATH ;
    Result := 0;
    if not FileExists(tmp_str + APP_SETTINGS_FILENAME) then exit;
    s := System.IOUtils.TFile.ReadAllText(tmp_str+ APP_SETTINGS_FILENAME, TEncoding.ANSI );
    str_items := s.Split([',']);
    if Length(str_items)>10 then
    Result := StrToIntDef(str_items[10], 0);
end;


begin
  {$IFDEF DEBUGMODE}
   ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
 (*
  if System.SysUtils.TOSVersion.Architecture in
   {$IFDEF WIN32} [arARM64, arIntelX64] {$ELSE} [arIntelX86, arARM32] {$IFEND}
  then
  begin
    {$IFDEF WIN32}
      MessageDlg('You are using 32-bit Windows, please use the 32-bit version of the Arctic Profile Optimizer', mtInformation, [mbOk], 0, mbOk);
    {$ELSE}
      MessageDlg('You are using 64-bit Windows, please use the 64-bit version of the Arctic Profile Optimizer', mtInformation, [mbOk], 0, mbOk);
    {$IFEND}
    Halt(0);
  end;
  *)

  Application.Initialize;
  Application.MainFormOnTaskbar := True;



  settings_ThemeStyle := GetSkinIndex;
  if settings_ThemeStyle  = 0 then
    TStyleManager.TrySetStyle('Windows11 Modern Dark')
  else
    TStyleManager.TrySetStyle('Windows11 Modern Light');

        { }

  Application.CreateForm(TFormMain, FormMain);
  ApplyTheme;

 // Application.CreateForm(TfrmInfo, frmInfo);
 // Application.CreateForm(TfrmSettings, frmSettings);
 // Application.CreateForm(TAddProfileDlgForm, AddProfileDlgForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
