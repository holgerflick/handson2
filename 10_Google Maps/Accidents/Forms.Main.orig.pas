unit Forms.Main.orig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, AdvSmoothEdit, AdvSmoothEditButton,
  AdvSmoothDatePicker, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, AdvUtil, AdvSplitter,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, Vcl.DBCtrls, AdvGlowButton, Vcl.ComCtrls,
  AdvDateTimePicker, VCL.TMSFNCGoogleMaps, Modules.Database;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    cbStates: TDBLookupComboBox;
    dsStates: TDataSource;
    btnShowIncidents: TAdvGlowButton;
    dpDate: TAdvDateTimePicker;
    Map: TTMSFNCGoogleMaps;
    procedure FormCreate(Sender: TObject);
    procedure btnShowIncidentsClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowIncidents( ADate: TDate );

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnShowIncidentsClick(Sender: TObject);
begin
  ShowIncidents( dpDate.Date );
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  dpDate.Date := EncodeDate( 2017,11,4 );

  dpDate.MinDate := DBController.DateFirst;
  dpDate.MaxDate := DBController.DateLast;
end;

procedure TFrmMain.ShowIncidents(ADate: TDate);
var
  lDateStr: String;
  lFormat: TFormatSettings;

  lRect: TTMSFNCMapsRectangle;

  lCoordS,
  lCoordE : TTMSFNCMapsCoordinateRec;

  lStartLat,
  lStartLon,
  lEndLat,
  lEndLon: Double;

  lMarker: TTMSFNCGoogleMapsMarker;

  lQuIncidents: TFDQuery;

begin
  lFormat := TFormatSettings.Create;
  lFormat.ShortDateFormat := 'yyyy-mm-dd';

  lDateStr := DateToStr( dpDate.Date, lFormat );

  lQuIncidents := TFDQuery.Create(nil);
  try
    lQuIncidents.Connection := DBController.Connection;
    lQuIncidents.SQL.Text := TSQLStatements.GetIncidents;

    lQuIncidents.ParamByName('date').AsString := lDateStr;
    lQuIncidents.ParamByName('code').AsString := cbStates.KeyValue;
    lQuIncidents.Open;

    if lQuIncidents.RecordCount > 0 then
    begin
      Map.BeginUpdate;

      Map.Markers.Clear;
      Map.Rectangles.Clear;

      Map.Clusters.Clear;
      var lCluster := Map.Clusters.Add;

      try
        while not lQuIncidents.Eof do
        begin
          lStartLat := lQuIncidents.FieldByName('start_lat').AsFloat;
          lStartLon := lQuIncidents.FieldByName('start_lng').AsFloat;

          lEndLat := lQuIncidents.FieldByName('end_lat').AsFloat;
          lEndLon := lQuIncidents.FieldByName('end_lng').AsFloat;

          lCoordS := CreateCoordinate(lStartLat, lStartLon);
          lCoordE := CreateCoordinate(lEndLat, lEndLon);

          lMarker := Map.AddMarker(lCoordS) as TTMSFNCGoogleMapsMarker;
          lMarker.Cluster := lCluster;
          lMarker.DataInteger := lQuIncidents.FieldByName('id').AsInteger;

          if (lEndLat<>0) AND ( lEndLon <> 0) then
          begin
            // use a rectangle
            lRect := Map.AddRectangle(
              CreateBounds( lCoordS, lCoordE  )
              );

            var lSeverity := lQuIncidents.FieldByName('severity').AsInteger;

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
      finally
        if Map.Markers.Count > 0 then
        begin
          Map.ZoomToBounds(Map.Markers.ToCoordinateArray);
        end;

        Map.EndUpdate;
      end;
    end
    else
    begin
      MessageDlg( 'No accidents recorded for selected state on that day.',
        mtInformation, [mbOK],0);
    end;

  finally
    lQuIncidents.Free;
  end;
end;

end.
