program Markers;


uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Modules.Resources in 'Modules.Resources.pas' {Resources: TDataModule},
  Modules.Data in 'Modules.Data.pas' {Data: TDataModule},
  Flix.Utils.Maps in '..\..\0_Global\Flix.Utils.Maps.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TData, Data);
  Application.CreateForm(TResources, Resources);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
