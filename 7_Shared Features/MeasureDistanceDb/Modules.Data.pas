unit Modules.Data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteWrapper;

type
  TDBController = class(TDataModule)
    Connection: TFDConnection;
    Locations: TFDQuery;
    Racers: TFDQuery;
    Clubs: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure sqRevCalculate(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenRacers( AClubId: Integer );
  end;

var
  DBController: TDBController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDBController.DataModuleCreate(Sender: TObject);
begin
  Clubs.Open;
  Locations.Open;
end;

procedure TDBController.DataModuleDestroy(Sender: TObject);
begin
  Racers.Close;
  Locations.Close;
  Connection.Close;
end;

procedure TDBController.OpenRacers(AClubId: Integer);
begin
  Racers.Close;

  // open racers and filter by club id
  Racers.ParamByName('ID').AsInteger := AClubId;
  Racers.Open;
end;

end.
