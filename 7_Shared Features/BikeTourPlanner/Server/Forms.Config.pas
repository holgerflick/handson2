unit Forms.Config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, AdvEdit, Vcl.StdCtrls, AdvEdBtn,
  AdvDirectoryEdit;

type
  TFrmConfig = class(TForm)
    btCancel: TAdvGlowButton;
    btOK: TAdvGlowButton;
    txtFolderName: TAdvDirectoryEdit;
    txtURI: TAdvEdit;
  private
    function GetURI: String;
    procedure SetURI(const Value: String);
    function GetFolderName: String;
    procedure SetFolderName(const Value: String);

    { Private declarations }
  public
    { Public declarations }
    property URI: String read GetURI write SetURI;
    property FolderName: String read GetFolderName write SetFolderName;
  end;

var
  FrmConfig: TFrmConfig;

implementation

{$R *.dfm}

uses
  System.IOUtils;


{ TFrmConfig }

function TFrmConfig.GetFolderName: String;
begin
  Result := TRIM( txtFolderName.Text );

  // only return valid directory
  if not TDirectory.Exists(Result) then
  begin
    Result := '';
  end;
end;

function TFrmConfig.GetURI: String;
begin
  Result := TRIM( txtURI.Text );
end;

procedure TFrmConfig.SetFolderName(const Value: String);
begin
  if TDirectory.Exists(Value) then
  begin
    txtFolderName.Text := Value;
  end
  else
  begin
    txtFoldername.Text := '';
  end;
end;

procedure TFrmConfig.SetURI(const Value: String);
begin
  if Value <> '' then
  begin
    txtURI.Text := Value;
  end;
end;

end.
