unit Forms.Main;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, Vcl.StdCtrls,
  WEBLib.StdCtrls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps, XData.Web.Client,
  XData.Web.Connection;

type
  TFrmMain = class(TWebForm)
    WebPanel1: TWebPanel;
    Map: TTMSFNCMaps;
    cbLevel: TWebComboBox;
    cbTour: TWebComboBox;
    btnDisplay: TWebButton;
    Connection: TXDataWebConnection;
    Client: TXDataWebClient;
    procedure ClientLoad(Response: TXDataClientResponse);
    procedure ConnectionConnect(Sender: TObject);
    procedure WebFormShow(Sender: TObject);
    procedure cbLevelChange(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
  private
    FLevel : String;

    { Private declarations }
    procedure AddTours(Response: TXDataClientResponse);
    procedure AddLevels(Response: TXDataClientResponse);
    procedure DisplayTour(Response: TXDataClientResponse);

    procedure RequestLists;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  WEBLib.JSON;

const
  REQ_LEVELS = 'ITourService.Levels';
  REQ_TOURS  = 'ITourService.Tours';
  REQ_TOUR   = 'ITourService.Tour';



procedure TFrmMain.AddLevels(Response: TXDataClientResponse);
var
  LRoot: TJSONValue;
  LValues: TJSONArray;

  i : Integer;

begin
  LRoot := TTMSFNCUtils.ParseJSON(Response.ResponseText);

  cbLevel.Items.Clear;

  LValues := TTMSFNCUtils.GetJSONValue(LRoot, 'value') as TJSONArray;
  for i := 0 to TTMSFNCUtils.GetJSONArraySize(LValues)-1 do
  begin
    cbLevel.Items.Add(
      LValues[i].Value
    );
  end;
end;

procedure TFrmMain.AddTours(Response: TXDataClientResponse);
var
  LRoot: TJSONValue;
  LValues: TJSONArray;

  i : Integer;

begin
  LRoot := TTMSFNCUtils.ParseJSON(Response.ResponseText);

  cbTour.Items.Clear;

  LValues := TTMSFNCUtils.GetJSONValue(LRoot, 'value') as TJSONArray;
  for i := 0 to TTMSFNCUtils.GetJSONArraySize(LValues)-1 do
  begin
    cbTour.Items.Add(
      LValues[i].Value
    );
  end;
end;

procedure TFrmMain.btnDisplayClick(Sender: TObject);
begin
  if cbTour.ItemIndex > -1 then
  begin
    Client.RawInvoke( REQ_TOUR, [ FLevel, cbTour.Items[ cbTour.ItemIndex] ] );
  end;
end;

procedure TFrmMain.cbLevelChange(Sender: TObject);
begin
  FLevel := cbLevel.Items[ cbLevel.ItemIndex ];

  Client.RawInvoke( REQ_TOURS, [ FLevel ] );
end;

procedure TFrmMain.ClientLoad(Response: TXDataClientResponse);
begin
  if Response.StatusCode = 200 then
  begin
    if Response.RequestId = REQ_LEVELS then
    begin
      AddLevels(Response);
    end;

    if Response.RequestId = REQ_TOURS then
    begin
      AddTours(Response);
    end;

    if Response.RequestId = REQ_TOUR then
    begin
      DisplayTour(Response);
    end;
  end;
end;

procedure TFrmMain.ConnectionConnect(Sender: TObject);
begin
  RequestLists;
end;

procedure TFrmMain.DisplayTour(Response: TXDataClientResponse);
begin
  Map.LoadGPXFromText(Response.ResponseText);
end;

procedure TFrmMain.RequestLists;
begin
  Client.RawInvoke( REQ_LEVELS, nil);
end;

procedure TFrmMain.WebFormShow(Sender: TObject);
begin
  Connection.Connected := True;
end;

end.