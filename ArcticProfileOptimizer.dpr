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
  aConstUnit in 'aConstUnit.pas',
  aGlobalsUnit in 'aGlobalsUnit.pas';

{$R *.res}

begin
  {$IFDEF DEBUGMODE}
   ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  IsPortable;

  settings_ThemeStyle := GetSkinIndex;
  if settings_ThemeStyle  = 0 then
    TStyleManager.TrySetStyle('Windows11 Modern Dark')
  else
    TStyleManager.TrySetStyle('Windows11 Modern Light');

  Application.CreateForm(TFormMain, FormMain);
  ApplyTheme;

 // Application.CreateForm(TfrmInfo, frmInfo);
 // Application.CreateForm(TfrmSettings, frmSettings);
 // Application.CreateForm(TAddProfileDlgForm, AddProfileDlgForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;

end.
