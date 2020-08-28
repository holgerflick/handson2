unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps,
  VCL.TMSFNCGoogleMaps;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCGoogleMaps;
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

uses VCL.TMSFNCMapsCommonTypes, Flix.Utils.Maps, IOUtils;

{$R *.dfm}

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
  pl: TTMSFNCMapsPolygon;
  i: Integer;
  LPoly : TTMSFNCMapsPolyline;
  LCoord: TTMSFNCMapsCoordinate;

begin
  Map.BeginUpdate;

  try
    // load gpx file
    Map.LoadGPXFromFile('..\resources\trips\Trip_C.gpx',True,True);


    // iterate all polylines and change their stroke
    for i := 0 to Map.Polylines.Count -1 do
    begin
      LPoly := Map.Polylines[i];
      LPoly.StrokeColor := clBlue;
      LPoly.StrokeOpacity := 0.5;
      LPoly.StrokeWidth := 5;
    end;

    // add marker for start
    LCoord := LPoly.Coordinates[0].Coordinate;
    Map.AddMarker(LCoord.ToRec, 'Start');

    // add marker for end
    LCoord := LPoly.Coordinates[ LPoly.Coordinates.Count-1 ].Coordinate;
    Map.AddMarker(LCoord.ToRec, 'Finish');

  finally
    Map.EndUpdate;
  end;
end;

end.
