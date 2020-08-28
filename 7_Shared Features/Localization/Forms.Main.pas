unit Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    Map: TTMSFNCMaps;
    cbLanguages: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure MapMapInitialized(Sender: TObject);
    procedure cbLanguagesChange(Sender: TObject);

  private
    { Private declarations }
    procedure InitCombo;
    procedure UpdateLanguage;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses Flix.Utils.Maps, IOUtils;

const
  C_LOCALES : Array[0..6] of string =
   ( 'de-DE|German, Germany', 'en-US|English, United States',
     'en-GB|English, Great Britain', 'fr-FR|French, France',
     'nl-NL|Dutch, Netherlands', 'it-IT|Italian, Italy',
     'pt-BR|Portuguese, Brazil' );

procedure TFrmMain.cbLanguagesChange(Sender: TObject);
begin
  UpdateLanguage;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  LKeys: TServiceAPIKeys;

begin
  cbLanguages.Items.Clear;

  LKeys := TServiceAPIKeys.Create( TPath.Combine( TTMSFNCUtils.GetAppPath, 'apikeys.config' ) );
  try
    Map.APIKey := LKeys.GetKey( msGoogleMaps );
  finally
    LKeys.Free;
  end;
end;

procedure TFrmMain.InitCombo;
var
  LLang : String;

  LSplits: TArray<string>;
begin
  if cbLanguages.Items.Count = 0 then
  begin
    for LLang in C_LOCALES do
    begin
      LSplits := LLang.Split(['|']);
      cbLanguages.Items.Add( LSplits[1] );
    end;

    cbLanguages.ItemIndex := 0;
    UpdateLanguage;
  end;
end;

procedure TFrmMain.MapMapInitialized(Sender: TObject);
begin
  InitCombo;
end;

procedure TFrmMain.UpdateLanguage;
var
  LLang : String;
  LSplits: TArray<string>;
begin
  if cbLanguages.ItemIndex > -1 then
  begin
    LLang := C_LOCALES[ cbLanguages.ItemIndex ];

    LSplits := LLang.Split(['|']);
    Map.Options.Locale := LSplits[0];
    Map.ReInitialize;
  end;
end;

end.
