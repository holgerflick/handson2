unit Flix.Utils.Maps;

interface
uses
  Classes, SysUtils,
  TypInfo,
  System.Generics.Collections,
  VCL.TMSFNCMaps;


type

  // just a shorter name...
  TMapService = TTMSFNCMapsService;

  // maps a service to its API key
  TServiceAPIKeyDict = TDictionary<TMapService, string>;

  // maps a service to its name
  TDictNames = TDictionary<TMapService, string>;

  // maps a name to a service
  TDictServices = TDictionary<string, TMapService>;

  // manages API keys,
  // allows saving and loading to a file
  TServiceAPIKeys = class
  private
    FDict : TServiceAPIKeyDict;
    FNames: TDictNames;
    FServices: TDictServices;
    FFilename: String;

    // service key that was retrieved last
    FLastService: TMapService;

    // initialize service name dictionaries
    procedure InitServiceNames;

  public
    constructor Create;
    destructor Destroy; override;

    // add an API key for a service
    procedure AddKey( const AService: TMapService;
      const AKey: String);

    // get an API key for a service
    function GetKey( const AService: TMapService ): string;

    // returns all services as a generic array
    function GetAllServices : TArray<TMapService>;

    // returns all service names as a generic array
    function GetAllNames : TArray<string>;

    // adds all services to generic list
    procedure GetServices( AList: TList<TMapService> );

    // returns the name for a service
    function GetNameForService( AService: TMapService ) :String;

    // returns the service for a name
    function GetServiceForName( AName: String ) : TMapService;

    // save services and keys to a config file
    procedure SaveToFile( const AFilename: String );

    // load services and keys from a config file
    procedure LoadFromFile( const AFilename: String );


  published

    // filename that was used to load or save
    property Filename: String read FFilename write FFilename;

    // service that a key for was returned last
    property LastService: TMapService read FLastService write FLastService;
  end;

implementation

uses
  AesObj, MiscObj;

const
  // part of this key will be used to encrypt the config file
  KEY = 'Z$)5^*lQ)YE47]>8{w-kuv746wRLMJiBsPJk5dB=!cjB~)c6M4H:N]X]sZT0+Cfl';

  // header for the file created by SaveToFile
  HEADER : TBytes = [ 64, 80, 73, 1];

{ TServiceAPIKeys }

procedure TServiceAPIKeys.AddKey(const AService: TMapService; const AKey: String);
begin
  FDict.Add(AService, AKey);
end;

constructor TServiceAPIKeys.Create;
begin
  inherited;

  FDict := TServiceAPIKeyDict.Create;
  FNames := TDictNames.Create;
  FServices := TDictServices.Create;

  InitServiceNames;
end;

destructor TServiceAPIKeys.Destroy;
begin
  FDict.Free;
  FNames.Free;
  FServices.Free;

  inherited;
end;

function TServiceAPIKeys.GetAllNames: TArray<string>;
begin
  Result := FNames.Values.ToArray;
end;

function TServiceAPIKeys.GetAllServices: TArray<TMapService>;
begin
  Result := FNames.Keys.ToArray;
end;

function TServiceAPIKeys.GetKey(const AService: TMapService): string;
begin
  FLastService := AService;
  Result := FDict[ AService ];
end;

function TServiceAPIKeys.GetNameForService(AService: TMapService): String;
begin
  Result := FNames[AService];
end;

function TServiceAPIKeys.GetServiceForName(AName: String): TMapService;
begin
  Result := FServices[AName];
end;

procedure TServiceAPIKeys.GetServices(AList: TList<TMapService>);
var
  LService: TMapService;
begin
  if Assigned( AList ) then
  begin
    AList.Clear;
    for LService in FDict.Keys do
    begin
      AList.Add( LService );
    end;
  end
  else
    raise EArgumentNilException.Create('AList cannot be nil.');
end;

procedure TServiceAPIKeys.InitServiceNames;
var
  LService: TMapService;
  LName: String;

begin
  FNames.Clear;
  FNames.Add(msGoogleMaps, 'Google Maps');
  FNames.Add(msHere, 'Here');
  FNames.Add(msAzureMaps, 'Microsoft Azure Maps');
  FNames.Add(msBingMaps, 'Microsoft Bing Maps');
  FNames.Add(msTomTom, 'TomTom');
  FNames.Add(msMapBox, 'MapBox');

  // OpenLayers does not have a key right now
  // and might be omitted
  FNames.Add(msOpenLayers, 'OpenLayers');

  // generate other dictionary for
  // service lookup by name
  for LService in FNames.Keys do
  begin
    LName:= FNames[LService];
    FServices.Add(LName, LService);
  end;
end;

procedure TServiceAPIKeys.LoadFromFile(const AFilename: String);
var
  LKey: String;
  LValue: String;
  LService: TMapService;

  LAES : TAESEncryption;
  LStream: TBinaryReader;

  LHeader: TBytes;
  LCount : Integer;
  LHeadEq: Boolean;


  i : Integer;

begin
  LAES := TAESEncryption.Create;
  LStream := TBinaryReader.Create( AFilename );

  FDict.Clear;
  try
    // set up encryption
    LAES.Unicode := yesUni;
    LAES.AType := atECB;
    LAES.keyLength := kl256;

    // only use 32 bytes = 256 bits
    LAES.key := COPY( KEY, 10, 32 );
    LAES.paddingMode :=  TPaddingMode.PKCS7;
    LAES.IVMode := TIVMode.rand;

    // read header
    LHeader := LStream.ReadBytes(Length(HEADER));

    // compare header
    LHeadEq := True;
    for i := Low( LHeader) to High( LHeader ) do
    begin
      if LHeader[i] <> HEADER[i] then
      begin
        LHeadEq := False;
        break;
      end;
    end;

    if NOT LHeadEq then
    begin
      raise Exception.Create('Invalid file format.');
    end;

    // read number of services store in file
    LCount := LStream.ReadInteger;

    // iterate all services
    for i := 1 to LCount do begin
      // read and decrypt service
      LKey := LAES.Decrypt( LStream.ReadString );

      // read and decrypt API key
      LValue := LAES.Decrypt( LStream.ReadString );

      LService := TMapService( GetEnumValue( TypeInfo( TMapService ), LKey ) );

      FDict.Add( LService, LValue );
    end;

    Filename := AFilename;
    LStream.Close;

  finally
    LStream.Free;
    LAES.Free;
  end;
end;

procedure TServiceAPIKeys.SaveToFile(const AFilename: String);
var
  LService: TMapService;
  LKey,
  LValue: String;
  LAES: TAESEncryption;

  LStream: TBinaryWriter;

begin
  LAES := TAESEncryption.Create;
  LStream := TBinaryWriter.Create( AFilename );
  try
    LAES.Unicode := yesUni;
    LAES.AType := atECB;
    LAES.keyLength := kl256;
    LAES.key := COPY( KEY, 10, 32 );
    LAES.paddingMode :=  TPaddingMode.PKCS7;
    LAES.IVMode := TIVMode.rand;

    // header
    LStream.Write(HEADER);

    // number of services
    LStream.Write( Integer( FDict.Keys.Count ) );

    for LService in FDict.Keys do
    begin
      LValue := FDict[ LService ];
      LKey := GetEnumName(
        TypeInfo( TMapService ),
        ORD( LService )
        );

      LStream.Write( LAES.Encrypt( LKey ) );
      LStream.Write( LAES.Encrypt( LValue ) );
    end;

    LStream.Close;

    Filename := AFilename;
  finally
    LStream.Free;
    LAES.Free;
  end;
end;

end.
