unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvMemo, Vcl.StdCtrls;

const
 DEMO_TITLE = 'FNC Core Utils - JSON';
 DEMO_BUTTON = 'Execute';
type
  TFrmMain = class(TForm)
    btnExecute: TButton;
    txtLog: TAdvMemo;
    procedure btnExecuteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FJSON: String;

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
  LArray: TJSONArray;

  LItem: TJSONObject;
  LName: TJSONObject;
  LFriends: TJSONArray;
  LFriendItem: TJSONObject;
  i : Integer;

begin
  LArray :=  TTMSFNCUtils.ParseJSON(FJSON) as TJSONArray;

  txtLog.Lines.Add( Format( 'Records: %d',
    [ TTMSFNCUtils.GetJSONArraySize(LArray) ] ) );

  LItem := TTMSFNCUtils.GetJSONArrayItem( LArray, 0 ) as TJSONObject;

  LName := TTMSFNCUtils.GetJSONValue(LItem, 'name') as TJSONObject;
  txtLog.Lines.Add( 'First: ' +
    TTMSFNCUtils.GetJSONProp(LName, 'first'));
  txtLog.Lines.Add( 'Last: ' +
    TTMSFNCUtils.GetJSONProp(LName, 'last'));

  LFriends := TTMSFNCUtils.GetJSONValue(LItem, 'friends') as TJSONArray;
  for i := 0 to TTMSFNCUtils.GetJSONArraySize(LFriends)-1 do
  begin
    LFriendItem := TTMSFNCUtils.GetJSONArrayItem(LFriends, i) as TJSONObject;
    txtLog.Lines.Add( Format( 'Friend %d: %s',
     [ i+1,
      TTMSFNCUtils.GetJSONProp(LFriendItem, 'name')] )
       );
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  btnExecute.Caption := DEMO_BUTTON;
  self.Caption := DEMO_TITLE;

  txtLog.Lines.Clear;

  FJSON :=
  '[' +
  '{' +
  '  "index": 1,' +
  '  "guid": "cfbb764a-cde9-4f0e-ab18-9bf35fbc69ee",' +
  '  "name": {' +
  '    "first": "Marta",' +
  '    "last": "Byrd",' +
  '    "full": "Byrd, Marta"' +
  '  },' +
  '  "email": "marta.byrd@undefined.name",' +
  '  "phone": "+1 (933) 553-3181",' +
  '  "friends": [' +
  '    {' +
  '      "id": 0,' +
  '      "name": "Lilly Hammond"' +
  '    },' +
  '    {' +
  '      "id": 1,' +
  '      "name": "England Sellers"' +
  '    },' +
  '    {' +
  '      "id": 2,' +
  '      "name": "Autumn Jones"' +
  '    }' +
  '  ]' +
  '}' +
  ']';

end;

end.
