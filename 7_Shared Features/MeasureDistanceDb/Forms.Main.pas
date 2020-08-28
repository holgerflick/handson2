unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, Vcl.StdCtrls, AdvUtil, Vcl.ExtCtrls, AdvSplitter, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, AdvCombo, AdvDBComboBox,  AdvDBLookupComboBox, Data.DB, Vcl.DBCtrls;

type
  TFrmMain = class(TForm)
    panTop: TPanel;
    panBottom: TPanel;
    Map: TTMSFNCMaps;
    Grid: TAdvStringGrid;
    AdvSplitter1: TAdvSplitter;
    dsClubs: TDataSource;
    cbClubs: TDBLookupComboBox;
    cbRacers: TDBLookupComboBox;
    dsRacers: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbClubsClick(Sender: TObject);
    procedure cbRacersClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);


  private
    { Private declarations }
    procedure UpdateDistances;
    procedure DisplayFlight( AOrig, ADest : TTMSFNCMapsCoordinateRec );

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses Flix.Utils.Maps, IOUtils, Modules.Data;

procedure TFrmMain.cbClubsClick(Sender: TObject);
begin
  // when club is selected update list of racers
  DBController.OpenRacers(cbClubs.KeyValue);
end;

procedure TFrmMain.cbRacersClick(Sender: TObject);
begin
  // when racer is selected, update grid
  UpdateDistances;
end;

procedure TFrmMain.DisplayFlight(AOrig, ADest: TTMSFNCMapsCoordinateRec);
var
   LArray: TTMSFNCMapsCoordinateRecArray;

begin
  // clear all previous elements
  Map.Clear;

  // add markers
  Map.AddMarker( AOrig );
  Map.AddMarker( ADest );

  // zoom to area of interest
  Map.ZoomToBounds(
    CreateBounds( Map.Markers.ToCoordinateArray )
  );

  // create array for line
  SetLength( LArray, 2 );
  LArray[0] := AOrig;
  LArray[1] := ADest;

  // add line and set stroke
  var LItem := Map.AddPolyline( LArray );
  LItem.StrokeColor := clRed;
  LItem.StrokeOpacity := 0.3;
  LItem.StrokeWidth := 4;
end;

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

procedure TFrmMain.GridDblClick(Sender: TObject);
var
  LRow: Integer;
  LRacers : TDataSet;
  LLocCoord,
  LLoftCoord : TTMSFNCMapsCoordinateRec;

begin
  // only if row is selected
  if Grid.SelectedRowCount > 0 then
  begin
    // get dataset with racers
    LRacers := DBController.Racers;

    // get index of row
    LRow := Grid.SelectedRow[0];

    // get coordinates of loft
    LLoftCoord := CreateCoordinate(
      LRacers.FieldByName('Lat').AsFloat,
      LRacers.FieldByName('Lon').AsFloat
    );

    // get coordinates of location
    // from hidden columns
    LLocCoord :=  CreateCoordinate(
       Grid.AllFloats[ 2, LRow ],
       Grid.AllFloats[ 3, LRow ]
       );

    // show
    DisplayFlight(
      LLoftCoord,
      LLocCoord
    );
  end;
end;

procedure TFrmMain.UpdateDistances;
var
  LRacers,
  LLocations: TDataSet;
  LLoftCoord: TTMSFNCMapsCoordinateRec;
  LRow: Integer;

begin
  // get datasets
  LRacers := dsRacers.DataSet;
  LLocations := DBController.Locations;

  // row for each location
  Grid.RowCount := LLocations.RecordCount+1;

  // hide last 2 columns
  Grid.HideColumns(2,3);

  // set headers
  Grid.Cells[0,0] := 'Location';
  Grid.Cells[1,0] := 'Distance [km]';

  // get location for loft
  LLoftCoord := CreateCoordinate(
    LRacers.FieldByName('Lat').AsFloat,
    LRacers.FieldByName('Lon').AsFloat
    );

  LRow := 0;

  // iterate all locations
  LLocations.First;
  while not LLocations.Eof do
  begin
    Inc( LRow );

    // set name and align
    Grid.Cells[ 0, LRow ] := LLocations.FieldByName('Name').AsString;
    Grid.Alignments[1, LRow] := taRightJustify;

    // calculate distance
    Grid.Cells[ 1, LRow ] := Format( '%.2f', [
      MeasureDistance( LLoftCoord,
        CreateCoordinate(
          LLocations.FieldByName('Lat').AsFloat,
          LLocations.FieldByName('Lon').AsFloat
        )
      ) / 1000 ]);

    // store coordinates in hidden cols
    Grid.AllFloats[ 2, LRow ] := LLocations.FieldByName('Lat').AsFloat;
    Grid.AllFloats[ 3, LRow ] := LLocations.FieldByName('Lon').AsFloat;

    LLocations.Next;
  end;

  // fit grid columns
  Grid.AutoFitColumns(True);
end;

end.
