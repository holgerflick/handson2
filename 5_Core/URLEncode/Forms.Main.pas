unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvMemo, Vcl.StdCtrls;

const
 DEMO_TITLE = 'FNC Core Utils - URL encoding/decoding';
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
  LBase : String;
  LQuery: String;
begin
  LBase := 'https://myapp.com/names?';
  LQuery := '$filter=name eq ''Flick''';
  txtLog.Lines.Add( 'Original: ' + LBase + LQuery );

  LQuery := TTMSFNCUtils.URLEncode(LQuery);
  txtLog.Lines.Add( 'Encoded : ' + LBase + LQuery);

  LQuery := TTMSFNCUtils.URLDecode(LQuery);
  txtLog.Lines.Add( 'Decoded : ' + LBase + LQuery );
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  btnExecute.Caption := DEMO_BUTTON;
  self.Caption := DEMO_TITLE;

  txtLog.Lines.Clear;


end;

end.
