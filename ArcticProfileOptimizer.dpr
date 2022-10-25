program ArcticProfileOptimizer;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {FormMain},
  Vcl.Themes,
  Vcl.Styles,
  frmInfoUnit in 'frmInfoUnit.pas' {frmInfo},
  frmSettingsUnit in 'frmSettingsUnit.pas' {frmSettings},
  UtilsUnit in 'UtilsUnit.pas';

{$R *.res}

begin
  // ReportMemoryLeaksOnShutdown := True;

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
  TStyleManager.TrySetStyle('Windows11 Modern Dark');
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TfrmInfo, frmInfo);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.Run;
end.
