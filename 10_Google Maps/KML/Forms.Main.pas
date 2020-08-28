unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, Vcl.ExtCtrls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, VCL.TMSFNCGoogleMaps, Vcl.StdCtrls, AdvEdit, AdvGlowButton;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCGoogleMaps;
    Panel1: TPanel;
    btnDisplay: TAdvGlowButton;
    txtURL: TAdvEdit;
    procedure FormCreate(Sender: TObject);
    procedure MapMapInitialized(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);

  private
    { Private declarations }
    procedure LoadKML;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses IOUtils, Flix.Utils.Maps, TMSFNCMapsCommonTypes, ClipBrd ;

const
  DEFAULT_URL = 'http://webcore.flixengineering.com/data/13_Colonies.kml';


procedure TFrmMain.btnDisplayClick(Sender: TObject);
begin
  LoadKML;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  var LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;

  // set default coordinates to the Golden Gate Bridge
  Map.Options.DefaultLatitude := 37.819722;
  Map.Options.DefaultLongitude := -122.478611;

  txtURL.Text := DEFAULT_URL;
  btnDisplay.Enabled := False;

end;

procedure TFrmMain.LoadKML;
begin
  Map.KMLLayers.Clear;
  Map.AddKMLLayer(txtURL.Text, True );
end;

procedure TFrmMain.MapMapInitialized(Sender: TObject);
var
  LCoord: TTMSFNCMapsCoordinate;

begin
  btnDisplay.Enabled := True;
end;


end.
