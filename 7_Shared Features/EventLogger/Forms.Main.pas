unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes,
  Vcl.StdCtrls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCMaps;
    Log: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure MapMapInitialized(Sender: TObject);
  private
    { Private declarations }
    procedure OnMapEvent( Sender: TObject; AEventData: TTMSFNCMapsEventData );
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Log.Lines.Clear;

  Map.OnMapClick := OnMapEvent;
  Map.OnMapDblClick := OnMapEvent;
  Map.OnMapMouseUp := OnMapEvent;
  Map.OnMapMouseDown := OnMapEvent;
  Map.OnMarkerMouseEnter := OnMapEvent;
  Map.OnMarkerMouseLeave := OnMapEvent;

  // not supported for OpenLayers
  //Map.OnMapMouseEnter := OnMapEvent;
  //Map.OnMapMouseLeave := OnMapEvent;
end;

procedure TFrmMain.MapMapInitialized(Sender: TObject);
begin
  var lCoord := CreateCoordinate(51.43691667, 7.378277778);

  Map.AddMarker(lCoord);

  Map.SetCenterCoordinate(lCoord);
  Map.SetZoomLevel(13);
end;

procedure TFrmMain.OnMapEvent(Sender: TObject;
  AEventData: TTMSFNCMapsEventData);
begin
  Log.Lines.Add(AEventData.EventName );
end;

end.
