unit frmSettingsUnit;

interface

uses

  DataModuleUnit,

  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Classes,

  Vcl.Dialogs,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  Vcl.ComCtrls,
  Vcl.Samples.Spin,

  RzPanel,
  RzCmboBx,
  RzButton,
  Vcl.Menus

  ;

type
  TfrmSettings = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ComboBox_ui_theme: TComboBox;
    RzGroupBox4: TRzGroupBox;
    Button3: TButton;
    RzGroupBox5: TRzGroupBox;
    RzGroupBox6: TRzGroupBox;
    SpinEdit_ui_font_size: TSpinEdit;
    FontComboBox_ui_font_name: TRzFontComboBox;
    RzGroupBox10: TRzGroupBox;
    ToggleSwitch9: TToggleSwitch;
    Panel8: TPanel;
    RzGroupBox7: TRzGroupBox;
    ComboBox_ui_language: TComboBox;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

uses
     aGlobalsUnit,
     aUtilsUnit
     ;

{$R *.dfm}

{
  var P: TPoint;
   P :=  TRzToolButton(Sender).ClientToScreen(Point(0, TRzToolButton(Sender).Height)) ;
   frmHelpMsgPop.Show;
   frmHelpMsgPop.SetBounds(P.X, P.Y, frmHelpMsgPop.Width, frmHelpMsgPop.Height);

}

procedure TfrmSettings.Button3Click(Sender: TObject);
begin
  if MessageDlgCenter('Are you sure you want to clear the cache?', mtConfirmation, [mbYes, mbNo]) =  mrNo then  Exit;

  MessageDlgCenter('Cache cleared', mtInformation, [mbOK]);
  APOCache.ClearCache;
end;

procedure TfrmSettings.FormShow(Sender: TObject);
begin
 ActiveControl := Button2;
 Panel8.Left := (ClientWidth - Panel8.Width) div 2;
end;

end.
