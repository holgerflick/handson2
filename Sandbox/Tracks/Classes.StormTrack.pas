unit Classes.StormTrack;

interface

type
  TStormTrack = class

  private
    FWind: Integer;
    FDT: TDateTime;
    FPressure: Integer;
    FLongitude: Double;
    FLatitude: Double;

  public
    property Wind: Integer read FWind write FWind;
    property DT: TDateTime read FDT write FDT;
    property Pressure: Integer read FPressure write FPressure;
    property Longitude: Double read FLongitude write FLongitude;
    property Latitude: Double read FLatitude write FLatitude;

  end;

implementation

end.
