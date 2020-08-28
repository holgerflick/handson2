unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvMemo, Vcl.StdCtrls;

const
 DEMO_TITLE = 'FNC Core Utils - MIME demo';
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

uses TMSFNCUtils;

procedure TFrmMain.btnExecuteClick(Sender: TObject);
begin
  DoExecute;
end;

procedure TFrmMain.DoExecute;
var
  LFilename : String;

begin
  LFilename := 'test.pdf';
  var LMIMEType := TTMSFNCUtils.GetMimeType(LFilename);

  txtLog.Lines.Add( LMIMEType );
  txtLog.Lines.Add( TTMSFNCUtils.GetFileExtension(LMIMEType));

end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  btnExecute.Caption := DEMO_BUTTON;
  self.Caption := DEMO_TITLE;

  txtLog.Lines.Clear;
end;

end.
