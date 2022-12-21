unit frmAddProfileUnit;

interface

uses
  DataModuleUnit,
  UtilsUnit,

  Winapi.Windows,
  Winapi.Messages,
  Clipbrd,

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

  Vcl.Buttons
  ;

type
  TAddProfileDlgForm = class(TForm)
    ComboBoxEx1: TComboBoxEx;
    Edit1: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    FileOpenDialog1: TFileOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    function GetProfileDirectory: string;
    function GetProfileAppType: Integer;
  public
    { Public declarations }
    property  ProfileDirectory : string read GetProfileDirectory;
    property  ProfileAppType : Integer read GetProfileAppType;
  end;

var
  AddProfileDlgForm: TAddProfileDlgForm;

implementation

{$R *.dfm}




function GetAppNameFromOrdIndex(const inx: integer):string;
begin
  case inx of
    0 : result :=  'Undefined profiles';
    1 : result :=  'FireFox';
    2 : result :=  'PaleMoon';
    3 : result :=  'Thunderbird';
    4 : result :=  'SeaMonkey';
    5 : result :=  'SlimBrowser';
    6 : result :=  'Basilisk';
    7 : result :=  'IceDragon';
    8 : result :=  'WaterFox';
    9 : result :=  'Yandex';
    10: result :=  'Chrome';
    11: result :=  'Chromium';
    12: result :=  'Slimjet';
    13: result :=  'Brave';
    14: result :=  'Atom';
    15: result :=  'Cent Browser';
    16: result :=  'Dragon';
    17: result :=  'Twinkstar';
    18: result :=  'UR Browser';
    19: result :=  'Maxthon';
    20: result :=  'Decentr';
    21: result :=  'iTop Private Browser';
    22: result :=  'Edge';
    23: result :=  'Vivaldi';
   // 24: result :=  'Basilisk(chromium)';
    24: result :=  'QQBrowser';
    25: result :=  'Viber';
    26: result :=  'Opera';
    27: Result :=  '360ChromeX';
    28: Result :=  '360安全浏览器';

  end;
end;

function GetAppIndexFromOrdIndex(const inx: integer):integer;
begin
  case inx of
    0  : result := 0;   // 'Undefined profiles';
    1  : result := 100; // 'FireFox';
    2  : result := 101; // 'PaleMoon';
    3  : result := 102; // 'Thunderbird';
    4  : result := 103; // 'SeaMonkey';
    5  : result := 104; // 'SlimBrowser';
    6  : result := 105; // 'Basilisk';
    7  : result := 106; // 'IceDragon';
    8  : result := 107; // 'WaterFox';
    9  : result := 200; // 'Yandex';
    10 : result := 201; // 'Chrome';
    11 : result := 202; // 'Chromium';
    12 : result := 203; // 'Slimjet';
    13 : result := 204; // 'Brave';
    14 : result := 205; // 'Atom';
    15 : result := 206; // 'Cent Browser';
    16 : result := 207; // 'Dragon';
    17 : result := 208; // 'Twinkstar';
    18 : result := 209; // 'UR Browser';
    19 : result := 210; // 'Maxthon';
    20 : result := 211; // 'Decentr';
    21 : result := 212; // 'iTop Private Browser';
    22 : result := 213; // 'Edge';
    23 : result := 214; // 'Vivaldi';
   // 24 : result := 215; // 'Basilisk(chromium)';
    24 : result := 215; // 'QQBrowser';
    25 : result := 300; // 'Viber';
    26 : result := 400; // 'Opera';
    27 : Result := 216; // '360ChromeX';
    28 : Result := 217; //'360安全浏览器';
  end;

end;


function TAddProfileDlgForm.GetProfileDirectory: string;
begin
  Result := Trim(Edit1.Text);
end;

function TAddProfileDlgForm.GetProfileAppType: Integer;
begin
  Result := GetAppIndexFromOrdIndex(ComboBoxEx1.ItemIndex);
end;

procedure TAddProfileDlgForm.Edit1Change(Sender: TObject);
begin
  Button2.Enabled := String(Trim(Edit1.Text)).Length > 0;
end;

procedure TAddProfileDlgForm.FormCreate(Sender: TObject);
var
  I: Integer;
  appImgIndex: Integer;
  appName: string;
begin
   for I := 0 to 28 do
   begin
      appName:=  GetAppNameFromOrdIndex(I);
      appImgIndex:=  AppImageIndexFromType( GetAppIndexFromOrdIndex(I) );
      ComboBoxEx1.ItemsEx.AddItem( appName, appImgIndex, appImgIndex, appImgIndex, 0, nil );
   end;
   ComboBoxEx1.ItemIndex := 0;
end;

procedure TAddProfileDlgForm.FormShow(Sender: TObject);
begin
  ActiveControl := Button2;
  Button2.Enabled := String(Trim(Edit1.Text)).Length > 0;
end;

procedure TAddProfileDlgForm.SpeedButton1Click(Sender: TObject);
begin
  if not FileOpenDialog1.Execute then exit;
  Edit1.Text := FileOpenDialog1.FileName;
end;

procedure TAddProfileDlgForm.SpeedButton2Click(Sender: TObject);
begin
   if Clipbrd.Clipboard.AsText.Length > 0 then Edit1.SelectAll;  // for Undo
   Edit1.PasteFromClipboard;
end;

end.
