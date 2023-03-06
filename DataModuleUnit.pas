unit DataModuleUnit;

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,

  Vcl.ImgList,
  Vcl.Controls,
  Vcl.BaseImageCollection,
  Vcl.VirtualImageList,
  Vcl.Dialogs,

  SVGIconImageListBase,
  SVGIconImageList,
  SVGIconImageCollection,
  SVGIconVirtualImageList;

type
  TDataModule1 = class(TDataModule)
    SVGIconVirtualImageList2: TSVGIconVirtualImageList;
    SVGIconImageCollection2: TSVGIconImageCollection;
    SVGIconVirtualImageList4: TSVGIconVirtualImageList;
    SVGIconImageCollection4: TSVGIconImageCollection;
    SVGIconVirtualImageList5: TSVGIconVirtualImageList;
    SVGIconImageCollection5: TSVGIconImageCollection;
    TaskDialog1: TTaskDialog;
    TaskDialog2: TTaskDialog;
    TaskDialog3: TTaskDialog;
    TaskDialog4: TTaskDialog;
    TaskDialog5: TTaskDialog;
    TaskDialog6: TTaskDialog;
    SVGIconVirtualImageList1: TSVGIconVirtualImageList;
    SVGIconImageCollection1: TSVGIconImageCollection;
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
