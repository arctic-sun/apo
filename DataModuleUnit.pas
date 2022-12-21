unit DataModuleUnit;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls, SVGIconImageListBase, SVGIconImageList,
  Vcl.BaseImageCollection, SVGIconImageCollection, Vcl.VirtualImageList, SVGIconVirtualImageList;

type
  TDataModule1 = class(TDataModule)
    SVGIconVirtualImageList1: TSVGIconVirtualImageList;
    SVGIconImageCollection1: TSVGIconImageCollection;
    SVGIconVirtualImageList2: TSVGIconVirtualImageList;
    SVGIconImageCollection2: TSVGIconImageCollection;
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
