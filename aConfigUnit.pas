unit aConfigUnit;

interface

    uses
      aConstUnit,
      aCacheUnit,
      aGlobalsUnit,
      aSettingsUnit,

      // SynCommons,
      mormot.core.variants,
      mormot.core.json,
      mormot.core.base,
      mormot.core.data,

      VirtualTrees,
      VirtualTrees.Header,

      System.Rtti,
      System.StrUtils
      ;

    // Записывает все настройки (глобальные и VST1) в контейнер APOSettings
    procedure WriteSettings(var APOs: TAPOSettings; const VST: TVirtualStringTree);

    // Считывание глобальных настроек из контейнера APOSettings
    procedure ReadGlobalSettings(APOs: TAPOSettings);

    // Считывает и устанвоивает параметры колонок VST1 из контейнера APOSettings
    procedure ReadHeaderSettings(APOs: TAPOSettings; VST: TVirtualStringTree);

    procedure ApplyDefaultSettings;
    procedure ApplyDefaultHeaderSettings(VST: TVirtualStringTree);

implementation



procedure WriteSettings(var APOs: TAPOSettings; const VST: TVirtualStringTree);
var i: integer;
begin
    with APOs do
    begin
       setlength(g_nva, Length(settingsnamearray) );
       for I := 0 to High(g_nva) do
       begin
         // *** Эта последовательность не может быть нарушена ***
         // * Нарушение последовательности допустимо только в тексте JSON
         g_nva[i].name := settingsnamearray[i];
         case {IndexText(g_nva[i].name, settingsnamearray)}i of
           0 :  g_nva[i].value  := APP_SETTINGS_VER                   ;
           1 :  g_nva[i].value  := GLOBAL_ui_language                 ;
           2 :  g_nva[i].value  := GLOBAL_ui_theme                    ;
           3 :  g_nva[i].value  := GLOBAL_ui_font_name                ;
           4 :  g_nva[i].value  := GLOBAL_ui_font_size                ;
           5 :  g_nva[i].value  := GLOBAL_check_running_browsers      ;
           6 :  g_nva[i].value  := GLOBAL_show_showlog                ;
           7 :  g_nva[i].value  := GLOBAL_show_nonexisting_profiles   ;
           8 :  g_nva[i].value  := GLOBAL_show_hidden_profiles        ;
           9 :  g_nva[i].value  := GLOBAL_show_toolbar                ;
         end;
       end;

      SetLength(g_header, VST.Header.Columns.Count);
      for I := 0 to VST.Header.Columns.Count-1 do
      begin
        g_header[i].width := VST.Header.Columns[i].Width ;
        g_header[i].pos := VST.Header.Columns[i].Position;
      end;
    end;
end;

procedure ReadGlobalSettings(APOs: TAPOSettings);
var i: integer;
begin
  with APOs do
  begin
     for I := 0 to High(g_nva) do
     begin
       // *** Эта последовательность не может быть нарушена ***
       // * Нарушение последовательности допустимо только в тексте JSON
       Case IndexText(g_nva[i].name, settingsnamearray) of
         0  : ; //    if  VariantToIntegerDef(g_nva[0].value, 0) <> APP_SETTINGS_VER then Exit;
         1  : GLOBAL_ui_language                := VariantToString(g_nva[i].value);
         2  : GLOBAL_ui_theme                   := VariantToIntegerDef(g_nva[i].value, 0);
         3  : GLOBAL_ui_font_name               := VariantToString(g_nva[i].value);
         4  : GLOBAL_ui_font_size               := VariantToIntegerDef(g_nva[i].value, 9);
         5  : GLOBAL_check_running_browsers     := System.Rtti.TValue.FromVariant( g_nva[i].value ).AsBoolean;
         6  : GLOBAL_show_showlog               := System.Rtti.TValue.FromVariant( g_nva[i].value ).AsBoolean;
         7  : GLOBAL_show_nonexisting_profiles  := System.Rtti.TValue.FromVariant( g_nva[i].value ).AsBoolean;
         8  : GLOBAL_show_hidden_profiles       := System.Rtti.TValue.FromVariant( g_nva[i].value ).AsBoolean;
         9  : GLOBAL_show_toolbar               := System.Rtti.TValue.FromVariant( g_nva[i].value ).AsBoolean;
       end;
     end;
  end;
end;

procedure ReadHeaderSettings(APOs: TAPOSettings; VST: TVirtualStringTree);
var
  i: integer;
begin
  with APOs do
  for I := 0 to VST.Header.Columns.Count-1 do
  begin
    VST.Header.Columns[i].Width := g_header[i].width;
    VST.Header.Columns[i].Position := g_header[i].pos;
  end;
end;

procedure ApplyDefaultSettings;
begin
  GLOBAL_ui_language                     := 'english';  // string;
  GLOBAL_ui_theme                        := 0;          // Integer;
  GLOBAL_ui_font_name                    := 'Segoe UI'; // Integer;
  GLOBAL_ui_font_size                    := 9;          // Integer;
  GLOBAL_check_running_browsers          := True;       // Boolean;
  GLOBAL_show_showlog                    := False;      // Boolean;
  GLOBAL_show_nonexisting_profiles       := True;       // Boolean;
  GLOBAL_show_hidden_profiles            := False;
  GLOBAL_show_toolbar                    := True;
end;

procedure ApplyDefaultHeaderSettings(VST: TVirtualStringTree);
const cw: array[0..5] of Integer = (450, 105, 210, 210, 120, 150);
var
  i: integer;
begin
  for I := 0 to VST.Header.Columns.Count-1 do
  begin
    VST.Header.Columns[i].Width := cw[i];
    VST.Header.Columns[i].Position := i;
  end;
end;





end.
