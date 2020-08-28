program IncidentBrowser;

uses
  Vcl.Forms,
  Modules.Database in 'Modules.Database.pas' {DBController: TDataModule},
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Forms.Splash in 'Forms.Splash.pas' {FrmSplash},
  Flix.Utils.Maps in '..\..\0_Global\Flix.Utils.Maps.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  var lSplash := TFrmSplash.Create(nil);
  try
    lSplash.Show;

    Application.CreateForm(TDBController, DBController);
  Application.CreateForm(TFrmMain, FrmMain);
  finally
    lSplash.Free;
  end;

  Application.Run;
end.
