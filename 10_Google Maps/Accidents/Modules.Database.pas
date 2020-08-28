unit Modules.Database;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TDBController = class(TDataModule)
    QuDateLimits: TFDQuery;
    Connection: TFDConnection;
    QuStates: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FDateFirst: TDate;
    FDateLast: TDate;
    function GetDateFirst: TDate;
    function GetDateLast: TDate;
    { Private declarations }
  public
    { Public declarations }
    property DateFirst: TDate read GetDateFirst write FDateFirst;
    property DateLast: TDate read GetDateLast write FDateLast;
  end;

  TSQLStatements = class
  public
    class function GetIncidents: String;
  end;

var
  DBController: TDBController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDBController.DataModuleCreate(Sender: TObject);
begin
  QuStates.Open;
  QuDateLimits.Open;

end;

function TDBController.GetDateFirst: TDate;
begin
  Result := QuDateLimits.FieldByName('first').AsDateTime;
end;

function TDBController.GetDateLast: TDate;
begin
  Result := QuDateLimits.FieldByName('last').AsDateTime;
end;

{ TSQLStatements }

class function TSQLStatements.GetIncidents: String;
begin
  Result := 'SELECT id, severity, start_time, end_time, start_lat, start_lng, end_lat, end_lng ' +
    'FROM incidents WHERE (start_date = :date) AND (state = :code)';
end;

end.
