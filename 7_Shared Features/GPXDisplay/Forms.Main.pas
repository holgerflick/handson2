unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, Flix.Utils.Maps, Vcl.StdCtrls, System.Generics.Collections, Vcl.ExtCtrls, AdvCombo,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, AdvGlowButton, AdvPanel, AdvStyleIF,
  AdvAppStyler, Modules.Resources, AdvOfficeSelectors, AdvToolBar;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCMaps;
    imgButtons: TVirtualImageList;
    dlgOpen: TFileOpenDialog;
    Panel1: TAdvPanel;
    btnOpen: TAdvGlowButton;
    cbServices: TAdvComboBox;
    FormStyler: TAdvFormStyler;
    btnShow: TAdvGlowButton;
    dlgOpenGPX: TFileOpenDialog;
    AdvDockPanel1: TAdvDockPanel;
    AdvToolBar1: TAdvToolBar;
    btnColorSelector: TAdvOfficeColorSelector;
    btnPenWidthSelector: TAdvOfficePenWidthSelector;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbServicesClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure btnColorSelectorSelectColor(Sender: TObject; AColor: TColor);
    procedure btnPenWidthSelectorSelect(Sender: TObject; Index: Integer; Item: TAdvSelectorItem);
  private
    { Private declarations }
    FAPIKeys: TServiceAPIKeys;
    FServices: TList<TMapService>;

    procedure InitComboBox;
    function GetMapService: TMapService;
    procedure SetMapService(const Value: TMapService);
    procedure UpdateUserInterface;
    procedure SwitchService;

    procedure LoadState;
    procedure StoreState;

    procedure UpdateStroke;
    procedure DisplayGPXRoute;

  public
    { Public declarations }
    property MapService: TMapService read GetMapService write SetMapService;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.IOUtils,
  System.Win.Registry;


const
  REG_KEY = 'Software\FlixEngineering\Mapping';
  KEY_CONFIG = 'ConfigFile';
  KEY_SERVICE = 'CurrentService';

{$R *.dfm}

procedure TFrmMain.btnColorSelectorSelectColor(Sender: TObject; AColor: TColor);
begin
  UpdateStroke;
end;

procedure TFrmMain.btnOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    FApiKeys.LoadFromFile(dlgOpen.Filename);
    InitComboBox;
  end;
end;

procedure TFrmMain.btnPenWidthSelectorSelect(Sender: TObject; Index: Integer;
  Item: TAdvSelectorItem);
begin
  UpdateStroke;
end;

procedure TFrmMain.btnShowClick(Sender: TObject);
begin
  DisplayGPXRoute;
end;

procedure TFrmMain.cbServicesClick(Sender: TObject);
begin
  SwitchService;
end;

procedure TFrmMain.DisplayGPXRoute;
begin
  if dlgOpenGPX.Execute then
  begin
    Map.LoadGPXFromFile(dlgOpenGPX.FileName);

    UpdateStroke;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FServices := TList<TMapService>.Create;
  FAPIKeys := TServiceAPIKeys.Create;

  LoadState;

  UpdateUserInterface;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  StoreState;

  FAPIKeys.Free;
  FServices.Free;
end;

function TFrmMain.GetMapService: TMapService;
begin
  Result := Map.Service;
end;

procedure TFrmMain.InitComboBox;
var
  LService: TMapService;

begin
  // clear items
  cbServices.Items.Clear;

  // get all services
  FAPIKeys.GetServices(FServices);

  for LService in FServices do
  begin
    // add the service name and service
    cbServices.Items.AddObject(
      FAPIKeys.GetNameForService(LService),
      TObject( LService )
      );
  end;
end;

procedure TFrmMain.LoadState;
var
  LReg: TRegistry;
  LFilename: String;
  LService: TMapService;

begin
  LReg := TRegistry.Create;
  LReg.RootKey := HKEY_CURRENT_USER;

  btnColorSelector.SelectedColor := clRed;
  btnPenWidthSelector.SelectedPenWidth := 2;

  try
    if LReg.OpenKey( REG_KEY, False ) then
    begin
      // read filename last used
      LFilename := LReg.ReadString( KEY_CONFIG );

      // if config file still exists...
      if TFile.Exists(LFilename) then
      begin
        // ...load keys.
        FAPIKeys.LoadFromFile(LFilename);

        // show services in combo box
        InitComboBox;

        // get the service last used
        LService :=
          TMapService( LReg.ReadInteger(KEY_SERVICE) );

        // select service in combo box
        cbServices.ItemIndex :=
          cbServices.Items.IndexOfObject(TObject(LService));

        // switch to that service
        SwitchService;
      end;
    end;

    LReg.CloseKey;
  finally
    LReg.Free;
  end;
end;

procedure TFrmMain.SetMapService(const Value: TMapService);
var
  LAPI: String;

begin
  // get the API key
  LAPI := FAPIKeys.GetKey(Value);

  if Length( LAPI ) > 0 then
  begin
    // assign the API key
    Map.APIKey := LAPI;

    // switch the service
    Map.Service := Value;

    // update view
    // e.g. show map
    UpdateUserInterface;
  end;
end;

procedure TFrmMain.StoreState;
var
  LReg: TRegistry;

begin
  LReg := TRegistry.Create;
  LReg.RootKey := HKEY_CURRENT_USER;

  try
    if LReg.OpenKey( REG_KEY, True ) then
    begin
      // store the filename of the config file
      LReg.WriteString(KEY_CONFIG, FAPIKeys.Filename);

      // store the last service used
      LReg.WriteInteger(KEY_SERVICE, ORD(FAPIKeys.LastService) );
    end;
    LReg.CloseKey;
  finally
    LReg.Free;
  end;
end;

procedure TFrmMain.SwitchService;
begin
  // if service is selected...
  if cbServices.ItemIndex <> -1 then
  begin
    // set the current service to this service
    MapService :=  TMapService(
      cbServices.Items.Objects[ cbServices.ItemIndex ]
      );
  end;
end;

procedure TFrmMain.UpdateStroke;
var
  i: Integer;
  LPoly: TTMSFNCMapsPolyline;

begin
 for i := 0 to Map.Polylines.Count - 1 do
    begin
      LPoly := Map.Polylines[i];
      LPoly.StrokeColor := btnColorSelector.SelectedColor;
      LPoly.StrokeOpacity := 0.5;
      Lpoly.StrokeWidth := btnPenWidthSelector.SelectedPenWidth;
    end;
end;

procedure TFrmMain.UpdateUserInterface;
begin
  // map is only visible if API key is provided
  btnShow.Visible :=  Map.APIKey <> '';
end;

end.
