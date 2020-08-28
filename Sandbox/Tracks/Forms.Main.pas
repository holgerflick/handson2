unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, AdvGlowButton, Modules.Database, System.Generics.Collections, Classes.StormTrack;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    cbYears: TDBLookupComboBox;
    cbStorms: TDBLookupComboBox;
    btnShow: TAdvGlowButton;
    dsYears: TDataSource;
    dsNames: TDataSource;
    Map: TTMSFNCMaps;
    procedure cbYearsClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FTrack: TObjectList<TStormTrack>;
    FDbController: TDbController;

    procedure ShowTrack( AId: String );
    function ColorForSpeed( ASpeed: Integer ):TColor;
  public
    { Public declarations }
    property DbController: TDbController read FDbController write FDbController;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}


procedure TFrmMain.btnShowClick(Sender: TObject);
begin
  ShowTrack( cbStorms.KeyValue );
end;

procedure TFrmMain.cbYearsClick(Sender: TObject);
begin
  DbController.OpenStorms( cbYears.KeyValue );
end;

function TFrmMain.ColorForSpeed(ASpeed: Integer): TColor;
begin
  if ASpeed >= 157 then
  begin
    Result := RGB(255,96,96);
  end
  else
  begin
    if ASpeed >= 130 then
    begin
      Result := RGB( 255, 143, 32 );
    end
    else
    begin
      if ASpeed >= 111 then
      begin
        Result := RGB( 255, 193, 64 );
      end
      else
      begin
        if ASpeed >= 96 then
        begin
          Result := RGB( 255, 231, 117 );
        end
        else
        begin
          if ASpeed >= 74 then
          begin
            Result := RGB( 255,255,204);
          end
          else
          begin
            Result := RGB(200,253,253);
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FTrack := TObjectList<TStormTrack>.Create;
  FDbController := TDbController.Create(nil);
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FTrack.Free;
  FDbController.Free;
end;

procedure TFrmMain.ShowTrack(AId: String);
var
  LPoly: TTMSFNCMapsPolyline;
  LCoords: TTMSFNCMapsCoordinateRecArray;
  LTrackItem: TStormTrack;
  LLastColor,
  LColor: TColor;
  LSpeed:Integer;

begin
  // just coordinates
  FTrack.Clear;
  DbController.GetTrack( AId, FTrack );

  Map.BeginUpdate;
  try
    Map.Clear;

    SetLength( LCoords, 2 );

    LCoords[0].Latitude := 0;
    LCoords[0].Longitude := 0;

    LLastColor := RGB(200,253,253);

    for LTrackItem in FTrack do
    begin
      LCoords[1].Latitude := LCoords[0].Latitude;
      LCoords[1].Longitude := LCoords[0].Longitude;

      LCoords[0].Latitude := LTrackItem.Latitude;
      LCoords[0].Longitude := LTrackItem.Longitude;


      if (LCoords[1].Longitude <> 0) AND (LCoords[1].Latitude <> 0) then
      begin
        LPoly := Map.AddPolyline(LCoords, False);
        LSpeed := LTrackItem.Wind;

        if LSpeed > 0 then
        begin
          LColor := ColorForSpeed( LSpeed );
        end
        else
        begin
          LColor := LLastColor;
        end;

        LPoly.StrokeColor := LColor;
        LPoly.StrokeOpacity := 1;
        LPoly.StrokeWidth := 5;
        LPoly.DataObject := LTrackItem;

        LLastColor := LColor;
      end;
    end;

    Map.ZoomToBounds( CreateBounds( Map.Polylines.ToCoordinateArray ) );
  finally
    Map.EndUpdate;
  end;
end;



end.
