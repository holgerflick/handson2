unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCMaps;
    Panel1: TPanel;
    btnCloseBridge: TButton;
    btnCloseAll: TButton;
    btnAdd: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnCloseBridgeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);

  private
    { Private declarations }
    FBridgeID: String;

    procedure AddPopups;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses Flix.Utils.Maps, IOUtils;


procedure TFrmMain.AddPopups;
var
  LText: String;

begin
  LText := '<center><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/GoldenGateBridge-001.jpg/320px-GoldenGateBridge-001.jpg" />' +
    '<h1>Golden Gate Bridge</h1><p>Text about the bridge</p></center>';

  FBridgeID := Map.ShowPopup(37.819722, -122.478611, LText );

  LText := '<center><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Alcatraz_Island_as_seen_from_the_East.jpg/320px-Alcatraz_Island_as_seen_from_the_East.jpg" />' +
    '<h1>Alcatraz Island</h1><p>Text about the island</p></center>';

  Map.ShowPopup(37.826667, -122.422778, LText );
end;

procedure TFrmMain.btnAddClick(Sender: TObject);
begin
  AddPopups;
end;

procedure TFrmMain.btnCloseAllClick(Sender: TObject);
begin
  Map.CloseAllPopups;
end;

procedure TFrmMain.btnCloseBridgeClick(Sender: TObject);
begin
  Map.ClosePopup(FBridgeID);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  LKeys: TServiceAPIKeys;

begin
  LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;
end;

end.
