unit Forms.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TMSFNCTypes, FMX.TMSFNCUtils,
  FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes, FMX.TMSFNCMapsCommonTypes, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCMaps;

type
  TForm1 = class(TForm)
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
  Form1: TForm1;

implementation

{$R *.fmx}
const
  KEY_GOOGLE = '';
  KEY_TOMTOM = '';


procedure TForm1.btnGoogleClick(Sender: TObject);
begin
  Map.APIKey := KEY_GOOGLE;
  Map.Service := msGoogleMaps;
end;

procedure TForm1.btnTomTomClick(Sender: TObject);
begin
  Map.APIKey := KEY_TOMTOM;
  Map.Service := msTomTom;
end;

end.
