unit Forms.FrmEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Flix.Utils.Maps, Vcl.ExtCtrls, AdvStyleIF, AdvAppStyler,
  Modules.Resources, AdvToolBar, AdvGlowButton, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TFrmEditor = class(TForm)
    grServices: TAdvStringGrid;
    dlgOpen: TFileOpenDialog;
    dlgSave: TFileSaveDialog;
    FormStyler: TAdvFormStyler;
    imgToolbar: TVirtualImageList;
    AdvDockPanel1: TAdvDockPanel;
    AdvToolBar1: TAdvToolBar;
    btnToolOpen: TAdvGlowButton;
    btnToolSave: TAdvGlowButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    btnToolExit: TAdvGlowButton;
    btnToolAdd: TAdvGlowButton;
    btnToolDelete: TAdvGlowButton;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
    procedure grServicesGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure grServicesGetEditorProp(Sender: TObject; ACol, ARow: Integer; AEditLink: TEditLink);
    procedure grServicesCanEditCell(Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
    procedure btnAddClick(Sender: TObject);
    procedure grServicesEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure btnSaveFileClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure grServicesEllipsClick(Sender: TObject; ACol, ARow: Integer; var S: string);
    procedure FormResize(Sender: TObject);
    procedure btnToolExitClick(Sender: TObject);
  private
    { Private declarations }

    // keeps track of services in grid
    FServices: TStringlist;

    procedure SyncGrid( AKeys: TServiceAPIKeys);
    procedure AlignGrid;

  public
    { Public declarations }
  end;

var
  FrmEditor: TFrmEditor;

implementation

uses
  VCL.ClipBrd,
  AdvTypes,
  System.Generics.Collections;

{$R *.dfm}

procedure TFrmEditor.AlignGrid;
begin
  grServices.AutoSizeColumns(true,15);
end;

procedure TFrmEditor.btnAddClick(Sender: TObject);
begin
  if FServices.IndexOf('') = -1 then
  begin
    grServices.RowCount := grServices.RowCount + 1;
    FServices.Add('');
  end;
end;

procedure TFrmEditor.btnOpenFileClick(Sender: TObject);
var
  LKeys: TServiceAPIKeys;

begin
  if dlgOpen.Execute then
  begin
    LKeys := TServiceAPIKeys.Create;
    try
      LKeys.LoadFromFile(dlgOpen.FileName);
      SyncGrid(LKeys);
    finally
      LKeys.Free;
    end;
  end;
end;

procedure TFrmEditor.btnRemoveClick(Sender: TObject);
var
  LRow: Integer;
begin
  if grServices.RowCount > 1 then
  begin
    if MessageDlg( 'Remove key?', mtConfirmation, [mbYes,mbNo], 0 ) = mrYes then
    begin
      LRow := grServices.SelectedRow[0];
      grServices.RemoveRows(LRow, 1);
      FServices.Delete(LRow-1);
    end;
  end;
end;

procedure TFrmEditor.btnSaveFileClick(Sender: TObject);
var
  LKeys: TServiceAPIKeys;
  LRow : Integer;
begin
  if dlgSave.Execute then
  begin
    LKeys := TServiceAPIKeys.Create;
    try
      for LRow := 1 to FServices.Count do
      begin
        LKeys.AddKey(
          LKeys.GetServiceForName( FServices[LRow-1] ),
          grServices.Cells[ 1, LRow ] );
      end;

      LKeys.SaveToFile(dlgSave.FileName);
    finally
      LKeys.Free;
    end;
  end;
end;

procedure TFrmEditor.btnToolExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEditor.FormCreate(Sender: TObject);
begin
  FServices := TStringlist.Create;
  FServices.Add('');
  grServices.RowCount := 2;
  grServices.Cells[0,0] := 'Service';
  grServices.Cells[1,0] := 'API Key';
end;

procedure TFrmEditor.FormDestroy(Sender: TObject);
begin
  FServices.Free;
end;

procedure TFrmEditor.FormResize(Sender: TObject);
begin
  AlignGrid;
end;

procedure TFrmEditor.grServicesCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if ACol = 0 then
  begin
    // only allow editing if no API key has been entered for the service
    CanEdit := TAdvStringGrid( Sender ).Cells[1, ARow].IsEmpty;
  end;
end;

procedure TFrmEditor.grServicesEditCellDone(Sender: TObject; ACol, ARow: Integer);
begin
  if ACol = 0 then
  begin
    FServices[ARow-1] := TAdvStringGrid( Sender ).Cells[ACol, ARow];
  end;
end;

procedure TFrmEditor.grServicesEllipsClick(Sender: TObject; ACol, ARow: Integer; var S: string);
var
  LGrid: TAdvStringGrid;
  LDoCopy: Boolean;

begin
  LGrid := Sender as TAdvStringGrid;

  // copy if there is a key and paste if there is none
  LDoCopy := Length( S ) > 0;

  if LDoCopy then
  begin
    ClipBoard.AsText := S;
    MessageDlg( 'Copied key to clipboard.', mtInformation, [mbOK], 0);
  end
  else
  begin
    S := ClipBoard.AsText;
  end;
end;

procedure TFrmEditor.grServicesGetEditorProp(Sender: TObject; ACol, ARow: Integer;
  AEditLink: TEditLink);
var
  LName: String;
  LNames: TArray<string>;
  LKeys: TServiceAPIKeys;
  LGrid: TAdvStringGrid;
  LBit: TAdvSVGBitmap;
  LGlyph: TBitmap;

begin
  LGrid := Sender as TAdvStringGrid;

  // populate combo list with services that
  // are not in the list yet
  if ACol = 0 then
  begin
    LKeys := TServiceAPIKeys.Create;
    try
      LNames := LKeys.GetAllNames;
    finally
      LKeys.Free;
    end;

    LGrid.Combobox.Items.Clear;
    for LName in LNames do
    begin
      if (FServices.IndexOf(LName) = -1) OR (LGrid.Cells[ACol, ARow] = LName) then
      begin
        LGrid.Combobox.Items.Add( LName );
      end;
    end;
  end;

  // assign a vector image to the button of the edit control
  if ACol = 1 then
  begin
    LBit := TAdvSVGBitmap.Create;
    LGlyph := TBitmap.Create;

    try
    LBit.LoadFromFile('d:\demo\svg\resources\copypaste.svg');

    LGlyph.TransparentMode := tmAuto;
    LGlyph.PixelFormat := pf32bit;
    LGlyph.Width := LGrid.RowHeights[ARow] - 6;
    LGlyph.Height := LGrid.RowHeights[ARow] - 6;


    LGlyph.Canvas.Brush.Color := LGrid.BtnEdit.Color;
    LGlyph.Canvas.FillRect(Rect(0,0,LGlyph.Width, LGlyph.Height));
    LBit.Draw(LGlyph.Canvas, Rect( 0,0,LGlyph.Width, LGlyph.Height) );

    LGrid.BtnEdit.Glyph.Assign(LGlyph);
    LGrid.BtnEdit.ButtonWidth := 50;
    LGrid.BtnEdit.ButtonCaption := '';

    finally
      LBit.Free;
      LGlyph.Free;
    end;
  end;
end;

procedure TFrmEditor.grServicesGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  case ACol of
    0: AEditor := edComboList;
    1: AEditor := edEditBtn;
  end;
end;

procedure TFrmEditor.SyncGrid( AKeys: TServiceAPIKeys);
var
  LServices: TList<TMapService>;
  LService: TMapService;
  LRow : Integer;

begin
  FServices.Clear;
  LServices := TList<TMapService>.Create;
  grServices.BeginUpdate;
  try
    AKeys.GetServices(LServices);

    grServices.RowCount := LServices.Count + 1;

    LRow := 1;
    for LService in LServices do
    begin
      grServices.Cells[0,LRow] := AKeys.GetNameForService(LService);
      grServices.Cells[1,LRow] := AKeys.GetKey(LService);

      FServices.Add( AKeys.GetNameForService(LService) );

      Inc( LRow );
    end;

    AlignGrid;

  finally
    LServices.Free;
    grServices.EndUpdate;
  end;

end;

end.


