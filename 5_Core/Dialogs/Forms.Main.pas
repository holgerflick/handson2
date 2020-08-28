unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvMemo, Vcl.StdCtrls;

const
 DEMO_TITLE = 'FNC Core Utils - Dialogs demo';
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
begin
  // test simple message
  txtLog.Lines.Add( TTMSFNCUtils.Message('Hello.').ToString );

  // MsgDlg equivalent
  txtLog.Lines.Add(
    TTMSFNCUtils.Message('Information',
      mtInformation,
      [mbOK, mbCancel],
      0).ToString );

  // select a file
  var LFilename := '';
  TTMSFNCUtils.SelectFile( LFilename, 'c:\windows\system32', 'Windows Library (*.dll)|*.dll',
     procedure(const AFile: string; const AResult: Boolean)
     begin
       txtLog.Lines.Add( AFile );
       if AResult then
       begin
         txtLog.Lines.Add( 'OK clicked.' );
       end
       else
       begin
         txtLog.Lines.Add( 'Cancel clicked.' );
       end;
     end
    );
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  btnExecute.Caption := DEMO_BUTTON;
  self.Caption := DEMO_TITLE;

  txtLog.Lines.Clear;
end;

end.
