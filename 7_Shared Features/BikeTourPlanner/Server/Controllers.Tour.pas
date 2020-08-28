unit Controllers.Tour;

interface
uses
  Classes,
  System.Generics.Collections;

type
  TTourController = class

  public
    class procedure GetLevels( AList: TList<string> );
    class procedure ListTours( const ALevel: String; AList: TList<string> );
    class procedure GetTour( const ALevel, AName: String; AStream: TStream );
  end;

implementation

{ TTourController }

uses
  SysUtils,
  System.IOUtils,
  Modules.Configuration;

class procedure TTourController.GetLevels(AList: TList<string>);
var
  LRoot : String;
  LLevels: TArray<string>;
  LLevel: string;
begin
  if Assigned( AList ) then
  begin
    LRoot := Configuration.FolderName;
    LLevels := TDirectory.GetDirectories(LRoot);

    AList.Clear;
    for LLevel in LLevels do
    begin
      AList.Add( ExtractFileName( LLevel ) );
    end;
  end;
end;

class procedure TTourController.GetTour(const ALevel, AName: String; AStream: TStream);
var
  LPath: String;
  LMemory: TMemoryStream;

begin
  if Assigned( AStream ) then
  begin
    LPath := TPath.Combine(Configuration.FolderName, ALevel );
    LMemory := TMemoryStream.Create;
    try
      LMemory.LoadFromFile(TPath.Combine(LPath, AName + '.gpx'));
      LMemory.Position := 0;
      AStream.CopyFrom(LMemory, LMemory.Size);
    finally
      LMemory.Free;
    end;
  end;
end;

class procedure TTourController.ListTours(const ALevel: String; AList: TList<string>);
var
  LPath: String;
  LFiles: TArray<string>;
  LFile: String;

begin
  if Assigned( AList ) then
  begin
    AList.Clear;

    LPath := TPath.Combine(Configuration.FolderName, ALevel);
    LFiles := TDirectory.GetFiles(LPath, '*.gpx');

    for LFile in LFiles do
    begin
      AList.Add(TPath.GetFileNameWithoutExtension(LFile));
    end;
  end;
end;

end.
