unit aGlobalsUnit;

interface

 uses
      aConstUnit,
      System.SysUtils,
      System.IOUtils
      ;

 {
  1280x720 HD
  1920x1080 FHD
  2560x1440 QHD
  3840x2160 4K
  7680x4320 8K
 }




function IsPortable: Boolean;
function GetAppSettingsPath: string;
function GetSkinIndex:Integer;




var
    APO_Portable : Boolean;
    settings_minfilesizeType  : Integer;
    settings_minfilesizeValue : Int64;     // MinSize     0 - any size
    settings_maxscanndepth    : Integer;   // MaxDepth   -1 - any depth
    settings_delete_wal       : Boolean;
    settings_delete_shm       : Boolean;
    settings_showhint         : Boolean;
    settings_showlog          : Boolean;
    settings_searchlnkdesktop : Boolean;
    settings_searchlnksmenu   : Boolean;
    settings_captiontoolbar   : boolean;
    settings_ThemeStyle       : integer;

implementation

function IsPortable: Boolean;
begin
  Result := Pos( 'portable',  LowerCase( ExtractFileName( ParamStr(0) ) ) ) > 0  ;
  APO_Portable  := Result;
end;


function GetAppSettingsPath: string;
begin
  if APO_Portable then
   Result := IncludeTrailingPathDelimiter( ExtractFilePath( paramStr(0) ) ) + APP_PORTABLE_SETTINGS_PATH
  else
   Result := GetEnvironmentVariable('USERPROFILE') + APP_SETTINGS_PATH ;
end;

function GetSkinIndex:Integer;
var s, tmp_str: string;
    str_items : TArray<string>;
begin
    tmp_str := GetAppSettingsPath;// GetEnvironmentVariable('USERPROFILE') + APP_SETTINGS_PATH ;
    Result := 0;
    if not FileExists(tmp_str + APP_SETTINGS_FILENAME) then exit;
    s := System.IOUtils.TFile.ReadAllText(tmp_str+ APP_SETTINGS_FILENAME, TEncoding.ANSI );
    str_items := s.Split([',']);
    if Length(str_items)>10 then
    Result := StrToIntDef(str_items[10], 0);
end;



end.
