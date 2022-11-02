unit DataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls, SVGIconImageListBase, SVGIconImageList;

type
  TDataModule1 = class(TDataModule)
    SVGIconImageList2: TSVGIconImageList;
    SVGIconImageList1: TSVGIconImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
