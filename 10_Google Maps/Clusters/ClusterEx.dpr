program ClusterEx;

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Modules.Data in 'Modules.Data.pas' {DBController: TDataModule},
  Forms.Details in 'Forms.Details.pas' {FrmDetail},
  Forms.Progress in 'Forms.Progress.pas' {FrmProgress},
  Modules.Resources in 'Modules.Resources.pas' {Resources: TDataModule},
  Forms.About in 'Forms.About.pas' {FrmAbout},
  Flix.Utils.Maps in '..\..\0_Global\Flix.Utils.Maps.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TResources, Resources);
  Application.CreateForm(TDBController, DBController);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmProgress, FrmProgress);
  Application.Run;
end.
