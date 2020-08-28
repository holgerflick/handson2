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
    btnCopy: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);

  private
    { Private declarations }
    procedure OnCaptureScreenshot( Sender: TObject; ABitmap: TTMSFNCBitmap );

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses IOUtils, Flix.Utils.Maps, TMSFNCMapsCommonTypes, ClipBrd ;


procedure TFrmMain.btnCopyClick(Sender: TObject);
begin
  Map.OnCaptureScreenShot := OnCaptureScreenshot;
  Map.CaptureScreenShot;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  LStyle: TStringlist;

begin
  var LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;

  LStyle := TStringlist.Create;
  try
    LStyle.LoadFromFile('..\resources\styles\black-map.json');
    Map.Options.MapStyle := LStyle.Text;
  finally
    LStyle.Free;
  end;
end;

procedure TFrmMain.OnCaptureScreenshot(Sender: TObject; ABitmap: TTMSFNCBitmap);
begin
  Clipboard.Assign( ABitmap );
end;

end.
