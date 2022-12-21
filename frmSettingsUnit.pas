unit frmSettingsUnit;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
 // System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,

  RzPanel

  ;

type
  TfrmSettings = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ToggleSwitch1: TToggleSwitch;
    ToggleSwitch2: TToggleSwitch;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ToggleSwitch3: TToggleSwitch;
    Label7: TLabel;
    ToggleSwitch4: TToggleSwitch;
    Label8: TLabel;
    ToggleSwitch5: TToggleSwitch;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    ToggleSwitch6: TToggleSwitch;
    Label9: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label10: TLabel;
    ToggleSwitch7: TToggleSwitch;
    ComboBox2: TComboBox;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

{$R *.dfm}

{
https://www.sqlite.org/tempfiles.html
Write-ahead Log (WAL) files
Shared-Memory Files
}


procedure TfrmSettings.FormShow(Sender: TObject);
begin
 ActiveControl := Button2;
end;

end.
