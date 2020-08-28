program BikeTourServer;

uses
  Vcl.Forms,
  Modules.ServerContainer in 'Modules.ServerContainer.pas' {ServerContainer: TDataModule},
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Forms.Config in 'Forms.Config.pas' {FrmConfig},
  Services.Tour in 'Services.Tour.pas',
  Controllers.Tour in 'Controllers.Tour.pas',
  Modules.Configuration in 'Modules.Configuration.pas' {Configuration: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConfiguration, Configuration);
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
