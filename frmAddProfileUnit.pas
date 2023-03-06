unit frmAddProfileUnit;

interface

uses
  DataModuleUnit,

  aBrowsersUnit,

  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Clipbrd,
  Vcl.Buttons,
  Vcl.WinXCtrls,

  RzButton,
  RzPanel
  ;

type
  TAddProfileDlgForm = class(TForm)
    appid_ComboBoxEx: TComboBoxEx;
    profilepath_Edit: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    FileOpenDialog1: TFileOpenDialog;
    Panel7: TPanel;
    Panel3: TPanel;
    ToggleSwitch1: TToggleSwitch;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure profilepath_EditChange(Sender: TObject);
  private
    { Private declarations }
    ch : integer;
    FAppIndex   : Integer;
    function GetProfileDirectory: string;
    function GetProfileAppType: Integer;
  public
    { Public declarations }
    property  ProfileDirectory : string  read GetProfileDirectory;
    property  ProfileAppType   : Integer read GetProfileAppType write FAppIndex default 0;
  end;

var
  AddProfileDlgForm: TAddProfileDlgForm;

implementation

{$R *.dfm}


function AppIndexToComboIndex(aIndex: integer):Integer;
var
  I: Integer;
begin
  for I := 0 to 28 do
   if CONST_AppInfoArray[i].A = aIndex then Exit( i );

   Exit(-1);
end;


function TAddProfileDlgForm.GetProfileDirectory: string;
begin
  Result := Trim(profilepath_Edit.Text);
end;

function TAddProfileDlgForm.GetProfileAppType: Integer;
begin
  Result := CONST_AppInfoArray[appid_ComboBoxEx.ItemIndex].A ;
end;

procedure TAddProfileDlgForm.profilepath_EditChange(Sender: TObject);
begin
  Button2.Enabled := String(Trim(profilepath_Edit.Text)).Length > 0;
end;

procedure TAddProfileDlgForm.FormCreate(Sender: TObject);
var
  I: Integer;
  appImgIndex: Integer;
  appName: string;
begin
   for I := 0 to 28 do
   begin
      appImgIndex := CONST_AppInfoArray[i].I ;
      appName     := CONST_AppInfoArray[i].N ;

      appid_ComboBoxEx.ItemsEx.AddItem( appName, appImgIndex, appImgIndex, appImgIndex, 0, nil );
   end;
   appid_ComboBoxEx.ItemIndex := 0;

end;

procedure TAddProfileDlgForm.FormShow(Sender: TObject);
begin
  ActiveControl := Button2;
  Button2.Enabled := String(Trim(profilepath_Edit.Text)).Length > 0;

  appid_ComboBoxEx.ItemIndex := AppIndexToComboIndex( FAppIndex );
end;

procedure TAddProfileDlgForm.SpeedButton1Click(Sender: TObject);
begin
  if not FileOpenDialog1.Execute then exit;
  profilepath_Edit.Text := FileOpenDialog1.FileName;
end;

procedure TAddProfileDlgForm.SpeedButton2Click(Sender: TObject);
begin
   if Vcl.Clipbrd.Clipboard.AsText.Length > 0 then profilepath_Edit.SelectAll;  // for Undo
   profilepath_Edit.PasteFromClipboard;
end;

end.
