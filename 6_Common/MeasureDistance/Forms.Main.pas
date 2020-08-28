unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCMaps;
    txtDistance: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure MapMapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);

  private
    { Private declarations }
    LPlaces: TTMSFNCMapsCoordinateRecArray;

    procedure AddPlace( ACoord: TTMSFNCMapsCoordinate );
    procedure Measure;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses Flix.Utils.Maps, IOUtils;


procedure TFrmMain.AddPlace(ACoord: TTMSFNCMapsCoordinate);
begin
  LPlaces[1] := LPlaces[0];
  LPlaces[0] := ACoord.ToRec;

  Measure;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  LKeys: TServiceAPIKeys;

begin
  SetLength( LPlaces, 2 );
  LPlaces[0] := EmptyCoordinate;
  LPlaces[1] := EmptyCoordinate;

  LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;

end;

procedure TFrmMain.MapMapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  AddPlace( AEventData.Coordinate );
end;

procedure TFrmMain.Measure;
var
 LDistance : Double;

begin
  Map.BeginUpdate;
  try
    // clear markers and polylines
    Map.ClearMarkers;

    // if index 0 has content
    // ...add marker
    if LPlaces[0].Longitude <> 0 then
    begin
      Map.AddMarker(LPlaces[0]);
    end;

    // if index 1 has content
    // ... add marker
    if LPlaces[1].Longitude <> 0 then
    begin
      Map.AddMarker(LPlaces[1]);
    end;

    // if both elements have a coordinate
    if (LPlaces[0].Longitude <> 0) AND
       (LPlaces[1].Longitude <> 0 ) then
    begin
      // calculate distance
      LDistance := MeasureDistance(LPlaces[0], LPlaces[1]);

      // output distance
      txtDistance.Text := Format( '%f km, %f m',
        [
          LDistance / 1000,
          LDistance
          ]
          );
    end
    else
    begin
      // clear distance
      txtDistance.Text := '';
    end;
  finally
    // update map display
    Map.EndUpdate;
  end;
end;

end.
