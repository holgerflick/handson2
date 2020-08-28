unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, Vcl.ExtCtrls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, VCL.TMSFNCGoogleMaps, Vcl.StdCtrls, AdvEdit, AdvGlowButton;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCGoogleMaps;
    Panel1: TPanel;
    btnCircle: TAdvGlowButton;
    btnRectangle: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRectangleClick(Sender: TObject);
    procedure btnCircleClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses IOUtils, Flix.Utils.Maps, TMSFNCMapsCommonTypes ;

procedure TFrmMain.btnCircleClick(Sender: TObject);
var
  LCenter: TTMSFNCMapsCoordinateRec;
  LCircle: TTMSFNCGoogleMapsCircle;

begin
  LCenter := CreateCoordinate( 26.686532, -80.388308 );

  LCircle := Map.AddCircle(LCenter) as TTMSFNCGoogleMapsCircle;
  LCircle.StrokeColor := clRed;
  LCircle.FillColor := clYellow;
  LCircle.FillOpacity := 0.3;
  LCircle.Editable := True;
  LCircle.Draggable := True;

  Map.SetCenterCoordinate(LCenter);
end;

procedure TFrmMain.btnRectangleClick(Sender: TObject);
var
  LLeft,
  LRight: TTMSFNCMapsCoordinateRec;

  LRect : TTMSFNCGoogleMapsRectangle;

begin
  LLeft := CreateCoordinate( 27.201630, -81.038505 );
  LRight := CreateCoordinate( 26.755389, -80.566928 );

  LRect := Map.AddRectangle( CreateBounds( LLeft, LRight ) )
    as TTMSFNCGoogleMapsRectangle;
  LRect.Editable := True;
  LRect.Draggable := True;
  LRect.FillColor := clNavy;
  LRect.FillOpacity := 0.3;
  LRect.StrokeColor := clGreen;

  Map.ZoomToBounds(CreateBounds(LLeft, LRight));
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  var LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;
end;


end.
