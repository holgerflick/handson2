unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, Vcl.ComCtrls,
  AdvDateTimePicker, Vcl.DBCtrls, Vcl.ExtCtrls, Modules.Database,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps,
  VCL.TMSFNCGoogleMaps, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    cbStates: TDBLookupComboBox;
    dpDate: TAdvDateTimePicker;
    btnQuery: TAdvGlowButton;
    Map: TTMSFNCGoogleMaps;
    dsStates: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowIncidents( ADate: TDate;
      AStateCode: String );
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  Flix.Utils.Maps,
  VCL.TMSFNCMapsCommonTypes;

procedure TFrmMain.btnQueryClick(Sender: TObject);
begin
  ShowIncidents( dpDate.Date, cbStates.KeyValue );
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  var LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;


  dpDate.MinDate := DBController.DateFirst;
  dpDate.MaxDate := DBController.DateLast;
end;

procedure TFrmMain.ShowIncidents(ADate: TDate; AStateCode: String);
var
  lFormat: TFormatSettings;
  lDateStr: String;

  lQuIncidents: TFDQuery;

  lRect: TTMSFNCMapsRectangle;

  lCoordS,
  lCoordE : TTMSFNCMapsCoordinateRec;

  lStartLat,
  lStartLon,
  lEndLat,
  lEndLon : Double;

  lCluster : TTMSFNCGoogleMapsCluster;
  lMarker : TTMSFNCGoogleMapsMarker;

  lSeverity: Integer;

begin
  lFormat := TFormatSettings.Create;
  lFormat.ShortDateFormat := 'yyyy-mm-dd';

  lDateStr := DateToStr( ADate, lFormat );

  lQuIncidents := TFDQuery.Create(nil);
  try
    lQuIncidents.Connection := DBController.Connection;
    lQuIncidents.SQL.Text := TSQLStatements.GetIncidents;

    lQuIncidents.ParamByName('date').AsString := lDateStr;
    lQuIncidents.ParamByName('code').AsString := AStateCode;
    lQuIncidents.Open;

    if lQuIncidents.RecordCount > 0 then
    begin
      Map.BeginUpdate;

      try
        Map.ClearMarkers;
        Map.ClearRectangles;
        Map.ClearClusters;

        lCluster := Map.Clusters.Add;

        while not lQuIncidents.Eof do
        begin
          lStartLat := lQuIncidents.FieldByName('start_lat').AsFloat;
          lStartLon := lQuIncidents.FieldByName('start_lng').AsFloat;
          lEndLat := lQuIncidents.FieldByName('end_lat').AsFloat;
          lEndLon := lQuIncidents.FieldByName('end_lng').AsFloat;

          lCoordS := CreateCoordinate( lStartLat, lStartLon );
          lCoordE := CreateCoordinate( lEndLat, lEndLon );

          lMarker := Map.AddMarker(lCoordS) as TTMSFNCGoogleMapsMarker;
          lMarker.Cluster := lCluster;
          lMarker.DataInteger := lQuIncidents.FieldByName('id').AsInteger;

          if (lCoordE.Longitude <> 0) and (lCoordE.Latitude <> 0) then
          begin
            lRect := Map.AddRectangle(
              CreateBounds( lCoordS, lCoordE )
              );

            lSeverity := lQuIncidents.FieldByName('severity').AsInteger;

            case lSeverity of
             1: lRect.FillColor := clGreen;
             2: lRect.FillColor := clOlive;
             3: lRect.FillColor := clYellow;
             4: lRect.FillColor := clRed;
             5: lRect.FillColor := clPurple;
             else
               lRect.FillColor := clWhite;
            end;

            lRect.FillOpacity := 0.5;
          end;

          lQuIncidents.Next;
        end;

        Map.ZoomToBounds( Map.Markers.ToCoordinateArray );

      finally
        Map.EndUpdate;
      end;
    end
    else
    begin
      MessageDlg('No accidents recorded for selected state on that day.',
        mtInformation, [mbOK], 0 );
    end;
  finally
    lQuIncidents.Free;
  end;

end;

end.
