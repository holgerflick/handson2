unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCMaps;
    btnGoogle: TButton;
    btnTomTom: TButton;
    procedure btnGoogleClick(Sender: TObject);
    procedure btnTomTomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

const
  KEY_GOOGLE = '';
  KEY_TOMTOM = '';

procedure TFrmMain.btnGoogleClick(Sender: TObject);
begin
  Map.APIKey := KEY_GOOGLE;
  Map.Service := msGoogleMaps;
end;

procedure TFrmMain.btnTomTomClick(Sender: TObject);
begin
  Map.APIKey := KEY_TOMTOM;
  Map.Service := msTomTom;
end;

end.
