unit frmAddProfileUnit;

interface

uses
  DataModuleUnit,
  UtilsUnit,

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

  RzButton,
  RzPanel,
  RzDlgBtn;

type
  TAddProfileDlgForm = class(TForm)
    ComboBoxEx1: TComboBoxEx;
    Edit1: TEdit;
    Panel1: TPanel;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzDialogButtons1: TRzDialogButtons;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddProfileDlgForm: TAddProfileDlgForm;

implementation

{$R *.dfm}

procedure TAddProfileDlgForm.FormCreate(Sender: TObject);
var
  I: Integer;
  appType: Integer;
  appName: string;
begin

   for I := 0 to ChromiumBasedAppCount-1 do
   begin
    SetAppNameAndType( i, ENGINE_CHROMIUM,  appType, appName);
    appType := AppImageIndexFromType(appType);
    ComboBoxEx1.ItemsEx.AddItem( appName, appType, appType, appType, 0, nil );
   end;

   for I := 0 to  MozillaBasedAppCount-1 do
   begin
    SetAppNameAndType( i, ENGINE_MOZILLA,  appType, appName);
    appType := AppImageIndexFromType(appType);
    ComboBoxEx1.ItemsEx.AddItem( appName, appType, appType, appType, 0, nil );
   end;

   SetAppNameAndType(0, ENGINE_UNKNOWN, appType, appName);
   appType := AppImageIndexFromType(appType);
   ComboBoxEx1.ItemsEx.AddItem( appName, appType, appType, appType, 0, nil );

   SetAppNameAndType(0, ENGINE_OPERA, appType, appName);
   appType := AppImageIndexFromType(appType);
   ComboBoxEx1.ItemsEx.AddItem( appName, appType, appType, appType, 0, nil );

   ComboBoxEx1.ItemsEx.AddItem( 'Undefined profiles', 25, 25, 25, 0, nil );

   ComboBoxEx1.ItemIndex := ComboBoxEx1.Items.Count-1;
end;

end.
