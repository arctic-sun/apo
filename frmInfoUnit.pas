unit frmInfoUnit;

interface


uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,

  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  UtilsUnit,
  ShellApi,
  SVGIconImage;

type
  TfrmInfo = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit4: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    SVGIconImage1: TSVGIconImage;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation


{$R *.dfm}

procedure TfrmInfo.Button1Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://github.com/arctic-sun/apo';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmInfo.FormShow(Sender: TObject);
begin
 Label2.Caption := 'SQLite: ' + FileVersion(sqlite3_lib);
 Label1.Caption := Format( 'Arctic Profile Optimizer: %s alpha ( %s )', [ FileVersion(paramstr(0)) , '01/12/2022' ]  ) ;
 ActiveControl  := Button1;
end;

end.
