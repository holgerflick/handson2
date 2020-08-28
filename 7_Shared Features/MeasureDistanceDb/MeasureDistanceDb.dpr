program MeasureDistanceDb;

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Flix.Utils.Maps in '..\..\0_Global\Flix.Utils.Maps.pas',
  Modules.Data in 'Modules.Data.pas' {DBController: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDBController, DBController);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
