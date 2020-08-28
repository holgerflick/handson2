unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCMaps;
    procedure MapMapInitialized(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses IOUtils, Flix.Utils.Maps;


procedure TFrmMain.FormCreate(Sender: TObject);
var
  LKeys: TServiceAPIKeys;

begin
  LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;
end;

procedure TFrmMain.MapMapInitialized(Sender: TObject);
var
  LFlight,
  LDUS: TTMSFNCMapsCoordinateRec;

  LBounds: TTMSFNCMapsBoundsRec;
  LArr: TTMSFNCMapsCoordinateRecArray;

  LPoly : TTMSFNCMapsPolyline;

begin
  // coordinate for DUS airport
  LDUS :=  CreateCoordinate( 51.289498, 6.769091 );

  // calculate coordinate 170 km northwest
  LFlight := CalculateCoordinate(LDUS, 315, 170000 );

  // add marker for airport
  Map.AddMarker(LDUS);

  // add marker for destination
  Map.AddMarker(LFlight);

  // create bounds for zoom
  LBounds := CreateBounds( LDUS, LFlight );
  Map.ZoomToBounds( LBounds );

  // add coordinates to array
  SetLength( LArr, 2 );
  LArr[0] := LDUS;
  LArr[1] := LFlight;

  // add line (see geometric shapes)
  LPoly := Map.AddPolyline( LArr );
  LPoly.StrokeColor := clBlue;
  LPoly.StrokeWidth := 3;
  LPoly.StrokeOpacity := 0.3;
end;

end.
