unit frmHelpMsgPopUnit;

interface

uses
  aGlobalsUnit,
  aLangUnit,
  aUtilsUnit,

  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls, Vcl.ComCtrls, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,  Vcl.Graphics,
  Vcl.Dialogs;

type
  TfrmHelpMsgPop = class(TForm)
    Memo1: TMemo;
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure AssignHintWndText(inx: integer);
  end;

var
  frmHelpMsgPop: TfrmHelpMsgPop;

implementation

{$R *.dfm}


procedure TfrmHelpMsgPop.AssignHintWndText(inx: integer);
begin
   case TextPosIndex(GLOBAL_ui_language, ['Eng', 'Rus'])  of
     0 : frmHelpMsgPop.Memo1.Text  :=  en_lang_array[Inx] ;
     1 : frmHelpMsgPop.Memo1.Text  :=  ru_lang_array[Inx] ;
   end;
end;



procedure TfrmHelpMsgPop.FormDeactivate(Sender: TObject);
begin
 Close;
end;

end.
