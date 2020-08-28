unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, AdvGlowButton, AdvMemo, Vcl.ExtCtrls, VCL.TMSFNCTypes,
  Modules.ServerContainer, AdvStyleIF, AdvAppStyler;

type
  TFrmMain = class(TForm)
    mmInfo: TAdvMemo;
    btStart: TAdvGlowButton;
    btStop: TAdvGlowButton;
    btConfig: TAdvGlowButton;
    Image1: TImage;
    AdvFormStyler1: TAdvFormStyler;
    procedure btStartClick(ASender: TObject);
    procedure btStopClick(ASender: TObject);
    procedure FormCreate(ASender: TObject);
    procedure btConfigClick(Sender: TObject);
  strict private
    procedure UpdateGUI;
    procedure UpdateButtonStates;

    procedure ShowConfig;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}
uses
  System.IOUtils,
  Modules.Configuration,
  Forms.Config;

resourcestring
  SServerStopped = 'Server stopped';
  SServerStartedAt = 'Server started at ';

{ TMainForm }

procedure TFrmMain.btConfigClick(Sender: TObject);
begin
  ShowConfig;
end;

procedure TFrmMain.btStartClick(ASender: TObject);
begin
  ServerContainer.SparkleHttpSysDispatcher.Start;
  UpdateGUI;
  UpdateButtonStates;
end;

procedure TFrmMain.btStopClick(ASender: TObject);
begin
  ServerContainer.SparkleHttpSysDispatcher.Stop;
  UpdateGUI;
  UpdateButtonStates;
end;

procedure TFrmMain.FormCreate(ASender: TObject);
begin
  mmInfo.Lines.Clear;

  UpdateGUI;
  UpdateButtonStates;
end;

procedure TFrmMain.ShowConfig;
var
  LFrm : TFrmConfig;

begin
  LFrm := TFrmConfig.Create(nil);
  try
    LFrm.URI := Configuration.URI;
    LFrm.FolderName := Configuration.FolderName;
    if LFrm.ShowModal = mrOK then
    begin
      Configuration.URI := LFrm.URI;
      Configuration.FolderName := LFrm.FolderName;

      UpdateButtonStates;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmMain.UpdateButtonStates;
begin
  if ( Length( Configuration.URI ) = 0 ) OR
     (NOT TDirectory.Exists(Configuration.FolderName) ) then
  begin
    btStart.Enabled := False;
    btStop.Enabled := False;
  end
  else
  begin
    btStart.Enabled := not ServerContainer.SparkleHttpSysDispatcher.Active;
    btStop.Enabled := not btStart.Enabled;
  end;
end;

procedure TFrmMain.UpdateGUI;
const
  cHttp = 'http://+';
  cHttpLocalhost = 'http://localhost';

var
  LTime: String;

begin
  LTime := DateTimeToStr( Now );

  if ServerContainer.SparkleHttpSysDispatcher.Active then
    mmInfo.Lines.Add(LTime + ': ' + SServerStartedAt + StringReplace(
      ServerContainer.XDataServer.BaseUrl,
      cHttp, cHttpLocalhost, [rfIgnoreCase]))
  else
    mmInfo.Lines.Add(LTime + ': ' + SServerStopped);
end;

end.
