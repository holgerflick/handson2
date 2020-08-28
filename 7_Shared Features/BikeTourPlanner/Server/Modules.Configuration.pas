unit Modules.Configuration;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, AdvTypes, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, AdvStyleIF, AdvAppStyler;

type
  TConfiguration = class(TDataModule)
    SVGCollection: TAdvSVGImageCollection;
    Glyphs: TVirtualImageList;
    AppStyler: TAdvAppStyler;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FURI: String;
    FFolderName: String;

    { Private declarations }

    procedure LoadFromReg;
    procedure SaveToReg;
  public
    { Public declarations }

    property URI: String read FURI write FURI;
    property FolderName: String read FFolderName write FFolderName;
  end;

var
  Configuration: TConfiguration;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Windows,
  Registry;

const
  KEY = 'Software\FlixEngineering\BikeTour';

{ TConfiguration }

procedure TConfiguration.DataModuleCreate(Sender: TObject);
begin
  LoadFromReg;
end;

procedure TConfiguration.DataModuleDestroy(Sender: TObject);
begin
  SaveToReg;
end;

procedure TConfiguration.LoadFromReg;
var
  LReg: TRegistry;

begin
  LReg := TRegistry.Create;
  try
    LReg.RootKey := HKEY_CURRENT_USER;

    if LReg.OpenKey( KEY, False ) then
    begin
      URI := LReg.ReadString('URI');
      FolderName := LReg.ReadString('FolderName');
    end;

  finally
    LReg.Free;
  end;
end;

procedure TConfiguration.SaveToReg;
var
  LReg : TRegistry;

begin
  LReg := TRegistry.Create;
  try
    LReg.RootKey := HKEY_CURRENT_USER;

    if LReg.OpenKey( KEY, True ) then
    begin
      LReg.WriteString('URI', FURI);
      LReg.WriteString('FolderName', FFolderName);

      LReg.CloseKey;
    end;
  finally
    LReg.Free;
  end;
end;


end.
