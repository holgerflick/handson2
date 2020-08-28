program DirectionsEx;

{$R *.dres}

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {FrmMain},
  Modules.Reporting in 'Modules.Reporting.pas' {Reporting: TDataModule},
  Flix.Utils.Maps in '..\..\0_Global\Flix.Utils.Maps.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TReporting, Reporting);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
