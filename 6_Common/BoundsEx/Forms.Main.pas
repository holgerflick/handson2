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
  LBounds: TTMSFNCMapsBounds;
  LSeattle,
  LBaltimore : TTMSFNCMapsCoordinate;

begin
  LSeattle := TTMSFNCMapsCoordinate.Create(  47.609722, -122.333056 );
  LBaltimore := TTMSFNCMapsCoordinate.Create( 39.283333 ,-76.616667 );

  LBounds := TTMSFNCMapsBounds.Create(
    LBaltimore.ToRec,
    LSeattle.ToRec
    );

  try
    Map.ZoomToBounds( LBounds.ToRec );
    Map.AddRectangle(LBounds.ToRec).FillOpacity := 0.3;
    Map.AddMarker( LBaltimore.ToRec );
    Map.AddMarker( LSeattle.ToRec );
  finally
    LSeattle.Free;
    LBaltimore.Free;
    LBounds.Free;
  end;
end;

end.
