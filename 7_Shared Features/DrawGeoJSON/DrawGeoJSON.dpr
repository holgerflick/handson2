program DrawGeoJSON;

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Flix.Utils.Maps in '..\..\0_Global\Flix.Utils.Maps.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
