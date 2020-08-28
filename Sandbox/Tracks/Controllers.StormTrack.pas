unit Controllers.StormTrack;

interface

uses
  TMSFNCMapsCommonTypes,
  Modules.Database;

type
  TStormTrackController = class

  public
    class function GetTrack( AId: String ) : TTMSFNCMapsCoordinateRecArray;
  end;

implementation

end.
