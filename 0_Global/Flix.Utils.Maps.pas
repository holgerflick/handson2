unit Flix.Utils.Maps;

interface
uses
  Classes, SysUtils,
  TypInfo,
  System.Generics.Collections,
  VCL.TMSFNCMaps;


type
  TMapService = TTMSFNCMapsService;

  TServiceAPIKeyDict = TDictionary<TMapService, string>;

  TNamesDict = TDictionary<TMapService, string>;
  TServicesDict = TDictionary<string, TMapService>;

  TServiceAPIKeys = class
  private
    FDict : TServiceAPIKeyDict;
    FNames: TNamesDict;
    FServices: TServicesDict;
    FFilename: String;

    // remembers service key that was retrieved last
    FLastService: TMapService;

    procedure InitServiceNames;

  public
    constructor Create; overload;
    constructor Create( AFilename: String ); overload;

    destructor Destroy; override;

    procedure AddKey( const AService: TMapService;
      const AKey: String);

    function GetKey( const AService: TMapService ): string;

    procedure SaveToFile( const AFilename: String );
    procedure LoadFromFile( const AFilename: String );

    function GetAllServices : TArray<TMapService>;
    function GetAllNames : TArray<string>;

    procedure GetServices( AList: TList<TMapService> );
    function GetNameForService( AService: TMapService ) :String;
    function GetServiceForName( AName: String ) : TMapService;

  published
    property Filename: String read FFilename write FFilename;
    property LastService: TMapService read FLastService write FLastService;
  end;

implementation

uses
  AesObj, MiscObj;

const
  KEY = 'Z$)5^*lQ)YE47]>8{w-kuv746wRLMJiBsPJk5dB=!cjB~)c6M4H:N]X]sZT0+Cfl';
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
  FNames := TNamesDict.Create;
  FServices := TServicesDict.Create;

  InitServiceNames;
end;

constructor TServiceAPIKeys.Create(AFilename: String);
begin
  self.Create;

  self.LoadFromFile(AFilename);
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
  FNames.Add(msOpenLayers, 'OpenLayers');

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
    LAES.Unicode := yesUni;
    LAES.AType := atECB;
    LAES.keyLength := kl256;
    LAES.key := COPY( KEY, 10, 32 );
    LAES.paddingMode :=  TPaddingMode.PKCS7;
    LAES.IVMode := TIVMode.rand;

    // header
    LHeader := LStream.ReadBytes(Length(HEADER));

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

    // read number of services
    LCount := LStream.ReadInteger;

    for i := 1 to LCount do begin
      LKey := LAES.Decrypt( LStream.ReadString );
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
