unit Modules.Database;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  System.Generics.Collections, Classes.StormTrack;

type
  TDbController = class(TDataModule)
    Connection: TFDConnection;
    QuYears: TFDQuery;
    QuStorms: TFDQuery;
    QuStormsSID: TStringField;
    QuStormsYEAR: TWideStringField;
    QuStormsNAME: TStringField;
    QuYearsYEAR: TWideStringField;
    QuTracks: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenStorms( AYear: String );
    procedure GetTrack(
      AId: String;
      ATrack: TObjectList<TStormTrack>
      ) ;
  end;

//var
//  DbController: TDbController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDbController.DataModuleCreate(Sender: TObject);
begin
  QuYears.Active := True;
end;

procedure TDbController.DataModuleDestroy(Sender: TObject);
begin
  Connection.Close;
end;

procedure TDbController.GetTrack(
      AId: String;
      ATrack: TObjectList<TStormTrack>
      );

var
  LTrack: TStormTrack;

begin
  QuTracks.Active := False;
  QuTracks.ParamByName('id').AsString := AId;

  QuTracks.Active := True;

  while not QuTracks.Eof do
  begin
    LTrack := TStormTrack.Create;
    LTrack.Latitude := QuTracks.FieldByName('lat').AsFloat;
    LTrack.Longitude := QuTracks.FieldByName('lon').AsFloat;
    LTrack.Wind := QuTracks.FieldByName('wmo_wind').AsInteger;
    LTrack.DT := QuTracks.FieldByName('iso_time').AsDateTime;
    LTrack.Pressure := QuTracks.FieldByName('wmo_pres').AsInteger;

    ATrack.Add(LTrack);


    QuTracks.Next;
  end;

  QuTracks.Active := False;

end;

procedure TDbController.OpenStorms(AYear: String);
begin
  QuStorms.Active := False;

  QuStorms.ParamByName('year').AsString := AYear;
  QuStorms.Active := True;
end;

end.
