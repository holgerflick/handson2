program APIKeyEditor;

uses
  Vcl.Forms,
  Forms.APIEditor in 'Forms.APIEditor.pas' {FrmEditor},
  Modules.Resources in 'Modules.Resources.pas' {Resources: TDataModule},
  Flix.Utils.Maps in '..\..\0_Global\Flix.Utils.Maps.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TResources, Resources);
  Application.CreateForm(TFrmEditor, FrmEditor);
  Application.Run;
end.
