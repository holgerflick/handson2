unit Modules.Resources;

interface

uses
  System.SysUtils, System.Classes, AdvStyleIF, Vcl.BaseImageCollection, AdvTypes, AdvAppStyler;

type
  TResources = class(TDataModule)
    AppStyler: TAdvAppStyler;
    CollectionImages: TAdvSVGImageCollection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Resources: TResources;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
