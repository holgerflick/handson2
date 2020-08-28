unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, Vcl.StdCtrls, AdvEdit, AdvMemo, AdvGlowButton, VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudBase, VCL.TMSFNCDirections, VCL.TMSFNCGeocoding, Vcl.ExtCtrls, AdvSplitter,
  AdvStyleIF, AdvAppStyler;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCMaps;
    Directions: TTMSFNCDirections;
    Geocoding: TTMSFNCGeocoding;
    Panel1: TPanel;
    txtInfo: TAdvMemo;
    btnCosts: TAdvGlowButton;
    btnReport: TAdvGlowButton;
    txtCustomer: TAdvEdit;
    Splitter: TAdvSplitter;
    FormStyler: TAdvFormStyler;
    dlgSave: TFileSaveDialog;
    procedure btnCostsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GeocodingGetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure DirectionsGetDirections(Sender: TObject; const ARequest: TTMSFNCDirectionsRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure btnReportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  strict private
    { Private declarations }
    FCustomerCoords,
    FHomeCoords: TTMSFNCMapsCoordinateRec;

    procedure AddPolyline( const ACoords: TTMSFNCMapsCoordinateRecArray );
    procedure AddStepsToReport( const ASteps: TTMSFNCDirectionsSteps );

    procedure AddInfo( AText: String; ASpace : Boolean = False);
    procedure AddReportToMemo;

    procedure FocusMapOnRoute;

    procedure GeocodeHome;
    procedure GeoCodeCustomer;

    procedure InitReport;

    procedure SetHomeCoords(const ACoord: TTMSFNCMapsCoordinateRec);
    procedure SetCustomerCoords( const ACoord: TTMSFNCMapsCoordinateRec );

    procedure UpdateRoute;

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  IOUtils,
  Modules.Reporting,
  Flix.Utils.Maps;

const
  ADDR_HOME = 'Roeselarestraat 180, 8560 Wevelgem, Belgium';


procedure TFrmMain.AddInfo(AText: String; ASpace : Boolean = False);
begin
  txtInfo.Lines.Add( AText );
  if ASpace then
  begin
    txtInfo.Lines.Add('');
  end;
end;

procedure TFrmMain.AddPolyline(const ACoords: TTMSFNCMapsCoordinateRecArray);
var
  LPoly : TTMSFNCMapsPolyline;

begin
  LPoly := Map.AddPolyline( ACoords );
  LPoly.StrokeColor := clRed;
  LPoly.StrokeOpacity := 0.5;
  LPoly.StrokeWidth := 3;
end;

procedure TFrmMain.AddReportToMemo;
begin
  AddInfo( Format( 'Distance: %f km',
    [ Reporting.TotalDistance/1000 ] ) );
  AddInfo( Format( 'Duration: %f minutes',
    [ Reporting.TotalDuration/60 ] ), True );

  AddInfo( '  (duration charged in half hour intervals)', True);

  AddInfo( Format( 'Cost time (%3d units for %6.2m) : %8.2m',
    [ Reporting.HalfHours, Reporting.CostHalfHour,
      Reporting.CostDuration ] ) );
  AddInfo( Format( 'Cost distance (%3d km for %6.2m): %8.2m',
    [ Reporting.TotalDistanceKm, Reporting.RatePerKm,
      Reporting.CostDistance ] ) );
  AddInfo( '------------------------------------------------------' );
  AddInfo( Format( 'Total cost                       : %8.2m',
    [ Reporting.CostDistance +
      Reporting.CostDuration ] ) );
end;

procedure TFrmMain.AddStepsToReport( const ASteps: TTMSFNCDirectionsSteps );
var
  s: Integer;
  LInstr: String;
  LStep: TTMSFNCDirectionsStep;

begin

  for s := 0 to ASteps.Count -1 do
  begin
    LStep := ASteps[s];

    LInstr := TTMSFNCUtils.HTMLStrip(
      LStep.Instructions.Replace('<div','. <div' )
      );

    Reporting.AddStep(s+1, LInstr, LStep.Distance, LStep.Duration);
  end;
end;

procedure TFrmMain.btnCostsClick(Sender: TObject);
begin
  GeocodeCustomer;
end;

procedure TFrmMain.btnReportClick(Sender: TObject);
var
  LMem: TMemoryStream;

begin
  if dlgSave.Execute then
  begin
    LMem := Reporting.AsPDF;
    if Assigned( LMem ) then
    begin
      LMem.SaveToFile(dlgSave.FileName);
      TTMSFNCUtils.OpenFile(dlgSave.FileName);
      LMem.Free;
    end;
  end;
end;

procedure TFrmMain.DirectionsGetDirections(
  Sender: TObject;
  const ARequest: TTMSFNCDirectionsRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  LItem: TTMSFNCDirectionsItem;

begin
  if ARequestResult.Success then
  begin
    Map.BeginUpdate;
    try
      InitReport;

      // iterate all routes
      if ARequest.Items.Count >0 then
      begin
        LItem := ARequest.Items[0];

        // draw polyline
        AddPolyline( LItem.Coordinates.ToArray );

        // add info to report
        AddStepsToReport( LItem.Steps );

        // update memo
        AddReportToMemo;

        // focus map
        FocusMapOnRoute;

        // update GUI
        btnReport.Enabled := True;
      end;
    finally
      Map.EndUpdate;
    end;
  end;
end;

procedure TFrmMain.FocusMapOnRoute;
begin
  // zoom map to area showing origin and destination
  Map.ZoomToBounds(Map.Polylines.ToCoordinateArray);

  // add marker for origin
  Map.Markers.Clear;
  Map.AddMarker( FHomeCoords, 'Start' );

  // add marker for destination
  Map.AddMarker( FCustomerCoords, 'Destination' );
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  LKeys: TServiceAPIKeys;

begin
  LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
    Directions.APIKey := LKeys.GetKey( msGoogleMaps );
    Geocoding.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  txtInfo.Lines.Clear;
  btnReport.Enabled := False;

  GeocodeHome;
end;

procedure TFrmMain.GeoCodeCustomer;
begin
  Geocoding.GetGeocoding( txtCustomer.Text, nil, 'Customer' );
end;

procedure TFrmMain.GeocodeHome;
begin
  Geocoding.GetGeocoding( ADDR_HOME, nil, 'Home' );
end;

procedure TFrmMain.GeocodingGetGeocoding(
  Sender: TObject;
  const ARequest: TTMSFNCGeocodingRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  LItem: TTMSFNCGeocodingItem;
  i : Integer;
begin
  if ARequestResult.Success then
  begin
    for i := 0 to ARequest.Items.Count -1 do
    begin
      LItem := ARequest.Items[i];

      if ARequest.ID = 'Home' then
      begin
        SetHomeCoords( LItem.Coordinate.ToRec );
      end;

      if ARequest.ID = 'Customer' then
      begin
        SetCustomerCoords( LItem.Coordinate.ToRec );

        UpdateRoute;
      end;
    end;
  end;
end;

procedure TFrmMain.InitReport;
begin
  Reporting.Clear;
  Reporting.CustomerAddress := txtCustomer.Text;
end;

procedure TFrmMain.SetCustomerCoords(const ACoord: TTMSFNCMapsCoordinateRec);
begin
  // coordinates for customer address
  FCustomerCoords := ACoord;

  AddInfo(  Format(
    'Customer coordinates determined (%f|%f)',
    [ FCustomerCoords.Latitude, FCustomerCoords.Longitude ] ), True
    );
end;

procedure TFrmMain.SetHomeCoords(const ACoord: TTMSFNCMapsCoordinateRec);
begin
  // coordinates for home address
  FHomeCoords := ACoord;

  AddInfo(  Format(
    'Home coordinates determined (%f|%f)',
    [ FHomeCoords.Latitude, FHomeCoords.Longitude ] ), True
    );
end;

procedure TFrmMain.UpdateRoute;
begin
  if ( FHomeCoords.Longitude <> 0 ) AND
    ( FCustomerCoords.Longitude <> 0 ) then
  begin
    Directions.DirectionsRequests.Clear;
    Directions.GetDirections(FHomeCoords, FCustomerCoords );
  end;
end;

end.
