program SimpleSwitch;


uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Flix.Utils.Maps in 'Flix.Utils.Maps.pas',
  Modules.Resources in 'Modules.Resources.pas' {Resources: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TResources, Resources);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
