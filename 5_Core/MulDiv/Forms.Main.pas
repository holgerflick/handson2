unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvMemo, Vcl.StdCtrls;

const
 DEMO_TITLE = 'FNC Core Utils - MulDiv demo';
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
  txtLog.Lines.Add( TTMSFNCUtils.MulDivInt( 4, 1, 2 ).ToString );
  txtLog.Lines.Add( TTMSFNCUtils.MulDivSingle( 4.2, 1.1, 2.2 ).ToString )

end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  btnExecute.Caption := DEMO_BUTTON;
  self.Caption := DEMO_TITLE;

  txtLog.Lines.Clear;
end;

end.
