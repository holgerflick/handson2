unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvMemo, Vcl.StdCtrls;

const
 DEMO_TITLE = 'FNC Core Utils - Hex string demo';
 DEMO_BUTTON = 'Execute';
type
  TFrmMain = class(TForm)
    btnExecute: TButton;
    txtLog: TAdvMemo;
    procedure btnExecuteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DoExecute;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses System.JSON, TMSFNCUtils;



procedure TFrmMain.btnExecuteClick(Sender: TObject);
begin
  DoExecute;
end;

procedure TFrmMain.DoExecute;
var
  LStream: TResourceStream;

begin
  LStream := TTMSFNCUtils.GetResourceStream('SampleImage');
  if not Assigned(LStream) then
  begin
    raise  EArgumentNilException.Create('Image resource not found.');
  end;

  try
    txtLog.BeginUpdate;
    txtLog.Lines.Add( TTMSFNCUtils.SaveStreamToHexStr(LStream));
  finally
    LStream.Free;
    txtLog.EndUpdate;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  btnExecute.Caption := DEMO_BUTTON;
  self.Caption := DEMO_TITLE;

  txtLog.Lines.Clear;
end;

end.
