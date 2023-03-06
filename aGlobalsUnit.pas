unit aGlobalsUnit;

interface

 uses
      aConstUnit,
      aCacheUnit,
      aSettingsUnit,
      aUtilsUnit,
      System.SysUtils;

function IsPortable: Boolean;
function GetAppSettingsPath: string;

var
    GLOBAL_ui_language                 : string;   // Название языка (можно было и индексом сделать)
    GLOBAL_ui_theme                    : Integer;  // Индекс темы
    GLOBAL_ui_font_name                : string;   // Имя шрифта
    GLOBAL_ui_font_size                : Integer;  // Размер шрифта
    GLOBAL_check_running_browsers      : Boolean;  // Проверка запущенности браузеров
    GLOBAL_show_showlog                : Boolean;  // Видимость панели LOG
    GLOBAL_show_nonexisting_profiles   : Boolean;  // Видимость не существующих профилей
    GLOBAL_show_hidden_profiles        : Boolean;  // Видимость скрытых профилей
    GLOBAL_show_toolbar                : Boolean;  // Видимость тулбара

    APO_Portable     : Boolean;           // Глобальный статус портабельности
    JSONSettingsLoad : Boolean;           // Статус наличия настроек
    APOCache         : TAPOCacheRecord;
    APOSettings      : TAPOSettings;


implementation

function IsPortable: Boolean;
begin
  Result := Pos( 'portable',  LowerCase( ExtractFileName( ParamStr(0) ) ) ) > 0  ;
  APO_Portable  := Result;
end;

function GetAppSettingsPath: string;
begin
  if APO_Portable
  then Result := IncludeTrailingPathDelimiter( ExtractFilePath( paramStr(0) ) ) + APP_PORTABLE_SETTINGS_PATH
  else  Result := IncludeTrailingPathDelimiter( ExpandEnvironmentPath(APP_SYSTEM_SETTINGS_PATH) ) ;

  if not ForceDirectories(Result) then Exit('');
  if not DirectoryExists(Result) then Exit('');
end;


end.
