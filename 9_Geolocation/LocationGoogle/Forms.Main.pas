unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCCustomComponent, VCL.TMSFNCCloudBase,
  VCL.TMSFNCLocation, Vcl.StdCtrls, AdvEdit, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps;

type
  TFrmMain = class(TForm)
    Location: TTMSFNCLocation;
    btnLookup: TButton;
    Map: TTMSFNCMaps;
    txtLatitude: TAdvEdit;
    txtLongitude: TAdvEdit;
    procedure btnLookupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LocationGetLocation(Sender: TObject; const ARequest: TTMSFNCLocationRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnLookupClick(Sender: TObject);
begin
  Location.GetLocation();
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Constraints.MinHeight := ClientHeight;
  Constraints.MinWidth := ClientWidth;
end;

procedure TFrmMain.LocationGetLocation(Sender: TObject; const ARequest: TTMSFNCLocationRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if ARequestResult.Success then
  begin
    txtLatitude.Text := Format( '%.4f', [ARequest.Coordinate.Latitude]);
    txtLongitude.Text := Format( '%.4f', [ARequest.Coordinate.Longitude]);

    Map.BeginUpdate;
    try
      Map.SetCenterCoordinate(ARequest.Coordinate.ToRec);
      Map.ClearMarkers;
      Map.AddMarker(ARequest.Coordinate.ToRec);
      Map.SetZoomLevel(10);
    finally
      Map.EndUpdate;
    end;
  end;
end;

end.
