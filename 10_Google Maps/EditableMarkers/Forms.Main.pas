unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, Flix.Utils.Maps, Vcl.StdCtrls, System.Generics.Collections, Vcl.ExtCtrls, AdvCombo,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, AdvGlowButton, AdvPanel, AdvStyleIF,
  AdvAppStyler, Modules.Resources, DB, VCL.TMSFNCGoogleMaps;

type
  TFrmMain = class(TForm)
    imgNoService: TImage;
    imgButtons: TVirtualImageList;
    dlgOpen: TFileOpenDialog;
    Panel1: TAdvPanel;
    btnOpen: TAdvGlowButton;
    cbServices: TAdvComboBox;
    FormStyler: TAdvFormStyler;
    btnShow: TAdvGlowButton;
    btnShowPeople: TAdvGlowButton;
    btnClear: TAdvGlowButton;
    Map: TTMSFNCGoogleMaps;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbServicesClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure btnShowPeopleClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
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

    procedure ShowLocations( ADataSet: TDataSet; AIcon :String = 'redflag_40.png');
  public
    { Public declarations }
    property MapService: TMapService read GetMapService write SetMapService;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.IOUtils,
  System.Win.Registry,
  Modules.Data;



const
  REG_KEY = 'Software\FlixEngineering\Mapping';
  KEY_CONFIG = 'ConfigFile';
  KEY_SERVICE = 'CurrentService';

{$R *.dfm}

procedure TFrmMain.btnClearClick(Sender: TObject);
begin
  Map.BeginUpdate;
  try
    Map.ClearMarkers;
  finally
    Map.EndUpdate;
  end;
end;

procedure TFrmMain.btnOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    FApiKeys.LoadFromFile(dlgOpen.Filename);
    InitComboBox;
  end;
end;

procedure TFrmMain.btnShowClick(Sender: TObject);
begin
  ShowLocations(Data.Locations);
end;

procedure TFrmMain.btnShowPeopleClick(Sender: TObject);
begin
   ShowLocations( Data.Racers, 'finish_40.png' );
end;

procedure TFrmMain.cbServicesClick(Sender: TObject);
begin
  SwitchService;
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

procedure TFrmMain.ShowLocations( ADataSet: TDataSet; AIcon: String );
var
  LMarker : TTMSFNCGoogleMapsMarker;
  LDataset: TDataSet;

begin

  if Assigned( ADataSet ) then
  begin
    LDataset := ADataSet;
    Map.BeginUpdate;
    LDataset.DisableControls;
    try
      LDataset.First;

      while not LDataset.Eof do
      begin
        LMarker := Map.Markers.Add;
        LMarker.Longitude := LDataset.FieldByName('Lon').AsFloat;
        LMarker.Latitude := LDataset.FieldByName('Lat').AsFloat;
        LMarker.Title := LDataset.FieldByName('Name').AsString;

        LMarker.IconURL := Format( 'http://webcore.flixengineering.com/svg/%s', [AIcon] );

        // make draggable
        LMarker.Draggable := True;

        LDataset.Next;
      end;

      Map.ZoomToBounds( Map.Markers.ToCoordinateArray );

    finally
      LDataset.EnableControls;
      Map.EndUpdate;
    end;
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

procedure TFrmMain.UpdateUserInterface;
begin
  // map is only visible if API key is provided
  Map.Visible := Map.APIKey <> '';
  btnShow.Visible := Map.Visible;

  // placeholder image is only visible if NO API key provided
  imgNoService.Visible := NOT Map.Visible;

end;

end.
