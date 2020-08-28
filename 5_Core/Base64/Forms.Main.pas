unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvMemo, Vcl.StdCtrls;

const
 DEMO_TITLE = 'FNC Core Utils - Base64 encoding and decoding';
 DEMO_BUTTON = 'Execute';
type
  TFrmMain = class(TForm)
    btnExecute: TButton;
    txtLog: TAdvMemo;
    procedure btnExecuteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses TMSFNCUtils;

procedure TFrmMain.btnExecuteClick(Sender: TObject);
var
  LURL: String;

begin
  LURL := 'https://www.tmssoftware.com/';

  txtLog.Lines.Add( TTMSFNCUtils.Encode64(LURL, True ) );
  txtLog.Lines.Add( TTMSFNCUtils.Encode64(LURL, False ) );
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  btnExecute.Caption := DEMO_BUTTON;
  self.Caption := DEMO_TITLE;

  txtLog.Lines.Clear;
end;

end.
