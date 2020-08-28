unit Services.Tour;

interface

uses
  Classes,
  XData.Server.Module,
  XData.Service.Common,
  System.Generics.Collections;

type
  [ServiceContract]
  ITourService = interface(IInvokable)
    ['{ADDC3977-6CEF-4854-9C65-CFB22FAE691D}']

    [HttpGet]
    function Levels : TList<string>;

    [HttpGet]
    function Tours( const ALevel:String ): TList<string>;

    [HttpGet]
    function Tour( const ALevel, AName: String ): TStream;
  end;

  [ServiceImplementation]
  TTourService = class(TInterfacedObject, ITourService)

    function Levels : TList<string>;
    function Tours( const ALevel:String ): TList<string>;
    function Tour( const ALevel, AName: String ): TStream;
  end;

implementation
uses
 Controllers.Tour;


{ TTourService }

function TTourService.Levels: TList<string>;
begin
  Result := TList<string>.Create;

  TTourController.GetLevels(Result);
end;

function TTourService.Tour(const ALevel, AName: String): TStream;
begin
  Result := TMemoryStream.Create;

  TTourController.GetTour(ALevel, AName, Result);
end;

function TTourService.Tours( const ALevel:String ): TList<string>;
begin
  Result := TList<string>.Create;

  TTourController.ListTours(ALevel, Result);
end;

initialization
  RegisterServiceType(TypeInfo(ITourService));
  RegisterServiceType(TTourService);

end.
