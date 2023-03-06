program ArcticProfileOptimizer;
 {.$DEFINE DEBUGMODE}

uses
  Vcl.Forms,
  SysUtils,
  Vcl.Themes,
  Vcl.Styles,
  frmMain in 'frmMain.pas' {FormMain},
  frmInfoUnit in 'frmInfoUnit.pas' {frmInfo},
  frmAddProfileUnit in 'frmAddProfileUnit.pas' {AddProfileDlgForm},
  DataModuleUnit in 'DataModuleUnit.pas' {DataModule1: TDataModule},
  aSQLUtilsUnit in 'aSQLUtilsUnit.pas',
  BatScriptUnt in 'BatScriptUnt.pas',
  aConstUnit in 'aConstUnit.pas',
  aGlobalsUnit in 'aGlobalsUnit.pas',
  aCacheUnit in 'aCacheUnit.pas',
  aConfigUnit in 'aConfigUnit.pas',
  aSettingsUnit in 'aSettingsUnit.pas',
  aBrowsersUnit in 'aBrowsersUnit.pas',
  aUtilsUnit in 'aUtilsUnit.pas',
  aLangUnit in 'aLangUnit.pas',
  frmSettingsUnit in 'frmSettingsUnit.pas' {frmSettings};

{$R *.res}

begin
  {$IFDEF DEBUGMODE}
   ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  IsPortable;

  JSONSettingsLoad := APOSettings.LoadFromJSONFile( GetAppSettingsPath + APP_JSETTINGS_V1 );

  ApplyDefaultSettings;
  if JSONSettingsLoad then ReadGlobalSettings(APOSettings);



  if GLOBAL_ui_theme = 0
  then TStyleManager.TrySetStyle('Windows11 Modern Dark')
  else TStyleManager.TrySetStyle('Windows11 Modern Light');

  Application.CreateForm(TFormMain, FormMain);
 // Application.CreateForm(TfrmHelpMsgPop, frmHelpMsgPop);
  Application.CreateForm(TDataModule1, DataModule1);
  ApplyTheme;

 // Application.CreateForm(TfrmInfo, frmInfo);
 // Application.CreateForm(TfrmSettings, frmSettings);
 // Application.CreateForm(TAddProfileDlgForm, AddProfileDlgForm);


  Application.Run;

end.
