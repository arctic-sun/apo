unit aBrowsersUnit;

interface

  uses
    aUtilsUnit,

    Winapi.Windows,
    Winapi.Messages,

    System.Generics.Collections,
    System.IOUtils,
    System.SysUtils,
    System.Classes;


  type

    TTypeChromium = (cpYandex,
                     cpChrome,
                     cpChromeBeta,
                     cpChromeCanary,
                     cpChromiumOrSRwareIron,  //   использует тот-же профиль что и Chromium
                     cpSlimjet,
                     cpBrave,
                     cpMailRuAtom,
                     cpCentBrowser,
                     cpComodoDragon,
                     cpTwinkstar,
                     cpURBrowser,
                     cpMaxthon,
                     cpDecentr,
                     cpiTopPrivateBrowser,
                     cpMSEdge,
                     cpVivaldi,
                     cpQQBrowser,
                     cp360EEX,
                     cp360SE);



     TTypeMozilla = (mpFireFox,
                     mpPaleMoon,
                     mpThunderbird,
                     mpSeaMonkey,
                     mpSlimBrowser,
                     mpBasilisk,
                     mpIceDragon,
                     mpWaterFox);

     TTypeMisc = ( opViber  );

  type
     TAProfiles =  record
       appName     : string;
       appIndex    : Integer;
       appProfiles : TList<string>;
     end;

  type
    TAppInfoRec = record
      I : Integer;   // ImageIndes
      A : Integer;   // AppIndex
      N : String;    // Name
    end;
    TAppInfoArray = array[0..28] of TAppInfoRec;

  const
    //# Chrome
    index_cpYandex               = 0;
    index_cpChrome               = 1;
    index_cpChromeBeta           = 2;
    index_cpChromeCanary         = 3;
    index_cpChromiumOrSRwareIron = 4;
    index_cpSlimjet              = 5;
    index_cpBrave                = 6;
    index_cpMailRuAtom           = 7;
    index_cpCentBrowser          = 8;
    index_cpComodoDragon         = 9;
    index_cpTwinkstar            = 10;
    index_cpURBrowser            = 11;
    index_cpMaxthon              = 12;
    index_cpDecentr              = 13;
    index_cpiTopPrivateBrowser   = 14;
    index_cpMSEdge               = 15;
    index_cpVivaldi              = 16;
    index_cpQQBrowser            = 17;
    index_cp360EEX               = 18;
    index_cp360SE                = 19;
    ChromiumCount = 20;

    //# Mozilla
    index_mpFireFox             = 0;
    index_mpPaleMoon            = 1;
    index_mpThunderbird         = 2;
    index_mpSeaMonkey           = 3;
    index_mpSlimBrowser         = 4;
    index_mpBasilisk            = 5;
    index_mpIceDragon           = 6;
    index_mpWaterFox            = 7;
    MozillaCount = 8;

    //# Misc
    index_opViber               = 0;
    MiscCount = 1;

    //# AppIndex
    index_appUnknown = 0;


    // 1..99 = Free
    ChromiumTypeInrement  = 100;
    MozillaTypeIncrement  = 200;
    OperaTypeIncrement    = 300;
    MiscTypeIncrement     = 400;


    CONST_AppInfoArray: TAppInfoArray = (
        (I: 25 ;  A: 0                                                      ;  N: 'Undefined profiles'),
        (I: 6  ;  A: MozillaTypeIncrement + index_mpFireFox                 ;  N: 'FireFox'),
        (I: 11 ;  A: MozillaTypeIncrement + index_mpPaleMoon                ;  N: 'PaleMoon'),
        (I: 22 ;  A: MozillaTypeIncrement + index_mpThunderbird             ;  N: 'Thunderbird'),
        (I: 19 ;  A: MozillaTypeIncrement + index_mpSeaMonkey               ;  N: 'SeaMonkey'),
        (I: 20 ;  A: MozillaTypeIncrement + index_mpSlimBrowser             ;  N: 'SlimBrowser'),
        (I: 1  ;  A: MozillaTypeIncrement + index_mpBasilisk                ;  N: 'Basilisk'),
        (I: 4  ;  A: MozillaTypeIncrement + index_mpIceDragon               ;  N: 'IceDragon'),
        (I: 24 ;  A: MozillaTypeIncrement + index_mpWaterFox                ;  N: 'WaterFox'),

        (I: 16 ;  A: ChromiumTypeInrement + index_cpYandex                  ;  N: 'Yandex'),
        (I: 8  ;  A: ChromiumTypeInrement + index_cpChrome                  ;  N: 'Chrome'),
        (I: 9  ;  A: ChromiumTypeInrement + index_cpChromiumOrSRwareIron    ;  N: 'Chromium'),
        (I: 21 ;  A: ChromiumTypeInrement + index_cpSlimjet                 ;  N: 'Slimjet'),
        (I: 7  ;  A: ChromiumTypeInrement + index_cpBrave                   ;  N: 'Brave'),
        (I: 0  ;  A: ChromiumTypeInrement + index_cpMailRuAtom              ;  N: 'Atom'),
        (I: 2  ;  A: ChromiumTypeInrement + index_cpCentBrowser             ;  N: 'Cent Browser'),
        (I: 3  ;  A: ChromiumTypeInrement + index_cpComodoDragon            ;  N: 'Dragon'),
        (I: 13 ;  A: ChromiumTypeInrement + index_cpTwinkstar               ;  N: 'Twinkstar'),
        (I: 23 ;  A: ChromiumTypeInrement + index_cpURBrowser               ;  N: 'UR Browser'),
        (I: 18 ;  A: ChromiumTypeInrement + index_cpMaxthon                 ;  N: 'Maxthon'),
        (I: 5  ;  A: ChromiumTypeInrement + index_cpDecentr                 ;  N: 'Decentr'),
        (I: 17 ;  A: ChromiumTypeInrement + index_cpiTopPrivateBrowser      ;  N: 'iTop Private Browser'),
        (I: 10 ;  A: ChromiumTypeInrement + index_cpMSEdge                  ;  N: 'Edge'),
        (I: 15 ;  A: ChromiumTypeInrement + index_cpVivaldi                 ;  N: 'Vivaldi'),
        (I: 27 ;  A: ChromiumTypeInrement + index_cpQQBrowser               ;  N: 'QQBrowser'),
        (I: 14 ;  A: MiscTypeIncrement    + index_opViber                   ;  N: 'Viber'),
        (I: 12 ;  A: OperaTypeIncrement                                     ;  N: 'Opera'),
        (I: 29 ;  A: ChromiumTypeInrement + index_cp360EEX                  ;  N: '360ChromeX'),
        (I: 30 ;  A: ChromiumTypeInrement + index_cp360SE                   ;  N: '360安全浏览器')
                        );


    // GetProfileFromLNK RESULTS
    GPF_RESULT_LINK_UDD_PD_OK         = 3;
    GPF_RESULT_LINK_UDD_OK            = 2;
    GPF_RESULT_LINK_PD_OK             = 1;
    GPF_RESULT_LINK_TO_DIRECTORY      = 0;
    GPF_RESULT_FAILED_TO_READ_LNK     = -1;
    GPF_RESULT_LINK_NO_CMD            = -2;
    GPF_RESULT_LINK_PD_NOT_FOUND      = -3;
    GPF_RESULT_LINK_UDD_NOT_FOUND     = -4;


    function  DetectChromiumBrowserIndex(const FileName: string): Integer;
    function  GetChromiumTypeUserDataDir(const cType: TTypeChromium): string;
    function  GetProfileFromLNK(const FileName: string; var profilePath: string; var appIndex: integer): Integer;
    function  ChromiumIndexToAppIndex(const cIndex: integer): Integer;
    function  MozillaIndexToAppIndex(const mIndex: integer): Integer;
    function  IsAppIndexFF(const aIndex: integer): Boolean;
    function  AppIndexToName(const aIndex: Integer): string;
    procedure FreeSearchProfilesResult(List: TList<TAProfiles>);
    function  GetProfilesA:TList<TAProfiles>;
    function  AppImageIndexFromIndex(const aIndex: integer): Integer;

implementation





{$REGION ' Chromium '}

function DetectChromiumBrowserIndex(const FileName: string): Integer;
var _tmp: string;
begin
  _tmp := lowercase( ReadProductName( FileName ) );
  Case TextPosIndex(_tmp,
   ['Yandex',
    'Google Chrome',
    'SRWare Iron',        // - same profile path with chromium
    'FlashPeak Slimjet',
    'Brave Browser',
    'Atom',
    'Cent Browser',
    'Comodo Dragon',
    'Twinkstar',
    'UR',
    'Maxthon',
    'Decentr',
    'iTop Private Browser',
    'Microsoft Edge',
    'Vivaldi',
    'Chromium',    // - same profile path with SRWare Iron
    'QQBrowser',
    '360ChromeX',
    '360安全浏览器'
    ])
  of
    0   :  Result := index_cpYandex                ;
    1   :  Result := index_cpChrome                ;
    2,15:  Result := index_cpChromiumOrSRwareIron  ;
    3   :  Result := index_cpSlimjet               ;
    4   :  Result := index_cpBrave                 ;
    5   :  Result := index_cpMailRuAtom            ;
    6   :  Result := index_cpCentBrowser           ;
    7   :  Result := index_cpComodoDragon          ;
    8   :  Result := index_cpTwinkstar             ;
    9   :  Result := index_cpURBrowser             ;
    10  :  Result := index_cpMaxthon               ;
    11  :  Result := index_cpDecentr               ;
    12  :  Result := index_cpiTopPrivateBrowser    ;
    13  :  Result := index_cpMSEdge                ;
    14  :  Result := index_cpVivaldi               ;
    16  :  Result := index_cpQQBrowser             ;
    17  :  Result := index_cp360EEX                ;
    18  :  Result := index_cp360SE                 ;
  else
    Result := -1;
  end;


end;

function GetChromiumTypeUserDataDir(const cType: TTypeChromium): string;
var AppDataLocal, AppDataRoaming: string;
begin
  // AppDataLocal := GetEnvironmentVariable('USERPROFILE') + '\AppData\Local\';
  // AppDataRoaming := GetEnvironmentVariable('USERPROFILE') + '\AppData\Roaming\';
  AppDataLocal   := IncludeTrailingPathDelimiter( GetEnvironmentVariable('LOCALAPPDATA') );
  AppDataRoaming := IncludeTrailingPathDelimiter(GetEnvironmentVariable('APPDATA') );

  case cType of
    cpYandex                : Result := AppDataLocal   + 'Yandex\YandexBrowser\User Data';
    cpChrome                : Result := AppDataLocal   + 'Google\Chrome\User Data';
    cpChromeBeta            : Result := AppDataLocal   + 'Chrome Beta\User Data';
    cpChromeCanary          : Result := AppDataLocal   + 'Chrome SxS\User Data';
    cpChromiumOrSRwareIron  : Result := AppDataLocal   + 'Chromium\User Data';
    cpSlimjet               : Result := AppDataLocal   + 'Slimjet\User Data';
    cpBrave                 : Result := AppDataLocal   + 'BraveSoftware\Brave-Browser\User Data';
    cpMailRuAtom            : Result := AppDataLocal   + 'Mail.Ru\Atom\User Data';
    cpCentBrowser           : Result := AppDataLocal   + 'CentBrowser\User Data';
    cpComodoDragon          : Result := AppDataLocal   + 'Comodo\Dragon\User Data';
    cpTwinkstar             : Result := AppDataLocal   + 'Twinkstar\User Data';
    cpURBrowser             : Result := AppDataLocal   + 'URBrowser\User Data';
    cpMaxthon               : Result := AppDataLocal   + 'Maxthon\Application\User Data';
    cpDecentr               : Result := AppDataLocal   + 'Decentr\Decentr\User Data';
    cpiTopPrivateBrowser    : Result := AppDataLocal   + 'iTop Private Browser\User Data';
    cpMSEdge                : Result := AppDataLocal   + 'Microsoft\Edge\User Data';
    cpVivaldi               : Result := AppDataLocal   + 'Vivaldi\User Data';
    cpQQBrowser             : Result := AppDataLocal   + 'Tencent\QQBrowser\User Data';
    cp360EEX                : Result := AppDataLocal   + '360ChromeX\Chrome\User Data';
    cp360SE                 : Result := AppDataRoaming + '360se6\User Data';
  end;
end;

function GetProfileFromLNK(const FileName: string; var profilePath: string; var appIndex: integer): Integer;
var target_path, target_cmd: string;
    RR, ChromeIndex: integer;
begin
  RR := ReadLNK(FileName, target_path, target_cmd);
  appIndex := -1;
  case RR of

     RL_RESULT_LNK_RESOLVE_DIRECTORY   :
     begin  // Если директория
       profilePath := target_path;
       appIndex    := index_appUnknown;
       Exit(GPF_RESULT_LINK_TO_DIRECTORY);
     end;

     RL_RESULT_LNK_RESOLVE_FAIL        :
     begin  // Если облом
       profilePath := '';
       appIndex    := -1;
       Exit(GPF_RESULT_FAILED_TO_READ_LNK);
     end;

     RL_RESULT_LNK_RESOLVE_CMDLINK     :
     begin
       var udd : string := GetValueFromCMD(lowercase(target_cmd), '--user-data-dir=' );
       var pd : string :=  GetValueFromCMD(lowercase(target_cmd), '--profile-directory=');

       if (udd.Length + pd.Length = 0) then
       begin
         profilePath := '';
         appIndex    := -1;
         Exit(GPF_RESULT_LINK_NO_CMD);  // Параметров нету   GPF_RESULT_LINK_NO_CMD
       end;

       ChromeIndex := DetectChromiumBrowserIndex(target_path);
       appIndex := ChromiumIndexToAppIndex(ChromeIndex);

       if (udd.Length > 0) and (pd.Length > 0) then
       begin
         // udd = %LOCALAPPDATA%\Google\Chrome\User Data
         // pd = Profile1

         udd := ExpandEnvironmentPath(udd);
         if not DirectoryExists( udd ) then
         begin
           profilePath := RelativeToAbsolute(udd, pd);
           Exit(GPF_RESULT_LINK_UDD_NOT_FOUND);
         end;

         profilePath := RelativeToAbsolute(udd, pd);
         if not DirectoryExists( profilePath ) then
         begin
           profilePath := udd;
           Exit(GPF_RESULT_LINK_UDD_OK);
         end;


         Exit(GPF_RESULT_LINK_UDD_PD_OK);     // GPF_RESULT_LINK_UDD_PD_OK
       end
       else
       if (udd.Length > 0) then
       begin
          // Проверяем на полный путь с учётом переменных среды
          profilePath := ExpandEnvironmentPath(udd);
          if DirectoryExists( profilePath ) then Exit(GPF_RESULT_LINK_UDD_OK);   // GPF_RESULT_LINK_UDD_OK

          // Если оказываемся тут, то есть ещё пара вариантов, какой из них валидный
          // искать и проверять лень, так что оба варианта.
              // Проверяем на дефолтовый путь + относительный вариант 1
              // %LOCALAPPDATA%\Google\Chrome\User Data\UDD
              profilePath := RelativeToAbsolute(GetChromiumTypeUserDataDir( TTypeChromium( ChromeIndex ) ), udd);
              if DirectoryExists( profilePath ) then Exit(GPF_RESULT_LINK_UDD_OK);

              // Проверяем на дефолтовый путь + относительный. вариант 2
              // %LOCALAPPDATA%\Google\Chrome\UDD
              profilePath := RelativeToAbsolute(GetChromiumTypeUserDataDir( TTypeChromium( ChromeIndex ) ), '..');
              profilePath := RelativeToAbsolute(profilePath, udd);
              if DirectoryExists( profilePath ) then Exit(GPF_RESULT_LINK_UDD_OK);

          // Облом   GPF_RESULT_LINK_UDD_NOT_FOUND
          Exit(GPF_RESULT_LINK_UDD_NOT_FOUND);
       end
       else  //if (pd.Length > 0)
       begin
         // Если есть полный путь до профиля
         // %LOCALAPPDATA%\Google\Chrome\User Data\Profile1
         profilePath := ExpandEnvironmentPath(pd);
         if DirectoryExists( profilePath ) then Exit(GPF_RESULT_LINK_PD_OK);

         // Проверяем на дефолтовый путь + относительный
         // %LOCALAPPDATA%\Google\Chrome\User Data\Profile1
         profilePath := RelativeToAbsolute( GetChromiumTypeUserDataDir( TTypeChromium( ChromeIndex ) ), pd);
         if DirectoryExists( profilePath ) then Exit(GPF_RESULT_LINK_PD_OK);

         // Облом  GPF_RESULT_LINK_PD_NOT_FOUND
         Exit(GPF_RESULT_LINK_PD_NOT_FOUND);
       end;
     end;

  end;

end;

function ChromiumIndexToAppIndex(const cIndex: integer): Integer;
begin
   Result := ChromiumTypeInrement + cIndex;
end;

function ChromiumIndexToAppName(const cIndex: integer): string;
begin
  case cIndex of
    index_cpYandex                : Result:= 'Yandex';
    index_cpChrome                : Result:= 'Chrome';
    index_cpChromeBeta            : Result:= 'Chrome';
    index_cpChromeCanary          : Result:= 'Chrome';
    index_cpChromiumOrSRwareIron  : Result:= 'Chromium';
    index_cpSlimjet               : Result:= 'Slimjet';
    index_cpBrave                 : Result:= 'Brave';
    index_cpMailRuAtom            : Result:= 'Atom';
    index_cpCentBrowser           : Result:= 'Cent Browser';
    index_cpComodoDragon          : Result:= 'Dragon';
    index_cpTwinkstar             : Result:= 'Twinkstar';
    index_cpURBrowser             : Result:= 'UR Browser';
    index_cpMaxthon               : Result:= 'Maxthon';
    index_cpDecentr               : Result:= 'Decentr';
    index_cpiTopPrivateBrowser    : Result:= 'iTop Private Browser';
    index_cpMSEdge                : Result:= 'Edge';
    index_cpVivaldi               : Result:= 'Vivaldi';
    index_cpQQBrowser             : Result:= 'QQBrowser';
    index_cp360EEX                : Result:= '360ChromeX';
    index_cp360SE                 : Result:= '360安全浏览器';
  end;
end;

{$ENDREGION}

{$REGION ' Mozilla '}

function MozillaIndexToAppIndex(const mIndex: integer): Integer;
begin
  Result := MozillaTypeIncrement + mIndex;
end;

function GetMozillaTypeProfiles(const mType: TTypeMozilla) : TList<string>;
var
  ffprofile_dir, tmp_str: string;
  List: TStringList;
  i: Integer;
begin
  Result := nil;

  ffprofile_dir := GetEnvironmentVariable('APPDATA');
  case mType of
    mpFireFox     : ffprofile_dir := ffprofile_dir + '\Mozilla\Firefox\' ;
    mpPaleMoon    : ffprofile_dir := ffprofile_dir + '\Moonchild Productions\Pale Moon\' ;
    mpThunderbird : ffprofile_dir := ffprofile_dir + '\Thunderbird\';
    mpSeaMonkey   : ffprofile_dir := ffprofile_dir + '\Mozilla\SeaMonkey\';
    mpSlimBrowser : ffprofile_dir := ffprofile_dir + '\FlashPeak\SlimBrowser\';
    mpBasilisk    : ffprofile_dir := ffprofile_dir + '\Basilisk-Dev\Basilisk\';
    mpIceDragon   : ffprofile_dir := ffprofile_dir + '\Comodo\IceDragon\';
    mpWaterFox    : ffprofile_dir := ffprofile_dir + '\Waterfox\';
  end;

//  SetLength(ProfilesDirs, 0);
  if not FileExists(ffprofile_dir + 'profiles.ini') then Exit;

  Result := TList<string>.Create;

  List := TStringList.Create;
  List.LoadFromFile( ffprofile_dir + 'profiles.ini' );
  try
    for I := 0 to List.Count-1 do
    begin
      tmp_str :=  Trim( List.Strings[i] );
      if pos('path', LowerCase(tmp_str) )=1 then
      begin
        tmp_str := Copy( tmp_str, 6, Length(tmp_str)-5) ;
        if TPath.IsRelativePath(tmp_str) then
               tmp_str :=  TPath.GetFullPath( ffprofile_dir + tmp_str);

        if DirectoryExists(tmp_str) then
        Result.Add(tmp_str);
      end;
    end;
  finally
     List.Free;
  end;

end;

function MozillaIndexToAppName(const mIndex: integer): string;
begin
  case mIndex of
    index_mpFireFox          : Result:= 'FireFox';
    index_mpPaleMoon         : Result:= 'PaleMoon';
    index_mpThunderbird      : Result:= 'Thunderbird';
    index_mpSeaMonkey        : Result:= 'SeaMonkey';
    index_mpSlimBrowser      : Result:= 'SlimBrowser';
    index_mpBasilisk         : Result:= 'Basilisk';
    index_mpIceDragon        : Result:= 'IceDragon';
    index_mpWaterFox         : Result:= 'WaterFox';
  end;
end;

function IsAppIndexFF(const aIndex: integer): Boolean;
var ffrange : MozillaTypeIncrement..MozillaTypeIncrement+99;
begin
  Result := ( aIndex in [ffrange] )  ;
end;

{$ENDREGION}

{$REGION ' Opera '}

function GetOperaDirectories(const Path: String; gdAll: Boolean):TList<string>;
var
  sPath: string;
  rec : TSearchRec;
  R: TList<string>;
begin
  Result := TList<string>.Create;

  sPath := IncludeTrailingPathDelimiter(Path);
  if FindFirst(sPath + '*.*', faAnyFile, rec) = 0 then
  begin
    repeat
      // TSearchRec.Attr contain basic attributes (directory, hidden,
      // system, etc). TSearchRec only supports a subset of all possible
      // info. TSearchRec.FindData contains everything that the OS
      // reported about the item during the search, if you need to
      // access more detailed information...

      if (rec.Attr and faDirectory) <> 0 then
      begin
        // item is a directory
        if (rec.Name <> '.') and (rec.Name <> '..') then
        begin
          Result.Add( sPath + rec.Name );
          if gdAll then
          begin
             R := GetOperaDirectories(sPath + rec.Name, True);
             Result.AddRange( R );
             R.Free;
          end;
        end;
      end
      else
      begin
        // item is a file
      end;
    until FindNext(rec) <> 0;
    FindClose(rec);
  end;
end;

Function GetOperaTypeProfiles:TList<string>;
var tmp_str: string;
begin
   Result := nil;
//  C:\Users\uu\AppData\Roaming\Opera Software\Opera Stable
//  C:\Users\uu\AppData\Roaming\Opera Software\Opera GX Stable
   tmp_str := GetEnvironmentVariable('APPDATA') + '\Opera Software\';
   if DirectoryExists( tmp_str ) then
    Result := GetOperaDirectories(tmp_str, False);
end;

{$ENDREGION}

{$REGION ' Misc '}

function GetMiscTypeProfiles(const miType: TTypeMisc): string;
begin
  case miType of
    opViber: Result := GetEnvironmentVariable('APPDATA') + '\ViberPC\';
  end;
end;

function MiscIndexToAppIndex(const miIndex: integer): Integer;
begin
  Result := MiscTypeIncrement + miIndex;
end;

function MiscIndexToAppName(const miIndex: integer): string;
begin
  case miIndex of
    index_opViber: Result := 'Viber';
  end;

end;

{$ENDREGION}


procedure FreeSearchProfilesResult(List: TList<TAProfiles>);
var
  I: Integer;
begin
  if List = nil then Exit;

  for I := 0 to List.Count-1 do
     List[i].appProfiles.Free;

  List.Free; //  List := nil;
end;

function GetProfilesA:TList<TAProfiles>;
var
  I: Integer;
  ADirs: TList<string>;
  AProfile: TAProfiles;
  tmp_path: string;
begin
  Result := TList<TAProfiles>.Create;

// *******************************
//             Opera
// *******************************
   ADirs := GetOperaTypeProfiles;
   if ADirs <> nil then
   begin
      with AProfile do
      begin
        //SetAppNameAndType(0, ENGINE_OPERA, appType, appName);
        appName     := 'Opera';
        appIndex    := OperaTypeIncrement;
        appProfiles := TList<string>.Create;
        appProfiles.AddRange( ADirs );
      end;
      Result.Add(AProfile);
      ADirs.Free;
   end;

// *******************************
// Chrome
// *******************************
  for I := 0 to ChromiumCount-1 do
  begin
    tmp_path := GetChromiumTypeUserDataDir(  TTypeChromium(i)  );
    if DirectoryExists(tmp_path) then
    begin
      with AProfile do
      begin
        appName     := ChromiumIndexToAppName(i);
        appIndex    := ChromiumIndexToAppIndex(i);
        appProfiles := TList<string>.Create;
        appProfiles.Add( tmp_path );
      end;
      Result.Add(AProfile);
    end;
  end;

// *******************************
// Mozilla
// *******************************
  for I := 0 to MozillaCount-1 do
  begin
    ADirs := GetMozillaTypeProfiles( TTypeMozilla(i) );
    if ADirs <> nil then
    begin
      with AProfile do
      begin
        appName     := MozillaIndexToAppName(i);
        appIndex    := MozillaIndexToAppIndex(i);
        appProfiles := TList<string>.Create;
        appProfiles.AddRange( ADirs );
      end;
      Result.Add(AProfile);
      ADirs.Free;
    end;
  end;

// *******************************
// Misc
// *******************************
  for I := 0 to MiscCount-1 do
  begin
    tmp_path := GetMiscTypeProfiles( TTypeMisc(i)  );
    if DirectoryExists( tmp_path ) then
    begin
      with AProfile do
      begin
        appName     := MiscIndexToAppName(i);
        appIndex    := MiscIndexToAppIndex(i);
        appProfiles := TList<string>.Create;
        appProfiles.Add( tmp_path );
      end;
      Result.Add(AProfile);
    end;
  end;

end;


function AppIndexToName(const aIndex: Integer): string;
begin
   case aIndex of
     0                                              : Result := 'Undefined profile(s)';
     ChromiumTypeInrement..ChromiumTypeInrement+99  : Result := ChromiumIndexToAppName( aIndex-ChromiumTypeInrement );
     MozillaTypeIncrement..MozillaTypeIncrement+99  : Result := MozillaIndexToAppName( aIndex-MozillaTypeIncrement );
     OperaTypeIncrement                             : Result := 'Opera';
     MiscTypeIncrement                              : Result := MiscIndexToAppName(aIndex-MiscTypeIncrement);
   end;
end;

function AppImageIndexFromIndex(const aIndex: integer): Integer;
begin
  Result := -1;
  case aIndex of
    index_appUnknown                                      : Result := 25;

    ChromiumTypeInrement + index_cpYandex                 :  Result := 16;  //@ cpYandex
    ChromiumTypeInrement + index_cpChrome                 :  Result := 8;   //@ cpChrome
    ChromiumTypeInrement + index_cpChromeBeta             :  Result := 8;   //@ cpChrome
    ChromiumTypeInrement + index_cpChromeCanary           :  Result := 8;   //@ cpChrome
    ChromiumTypeInrement + index_cpChromiumOrSRwareIron   :  Result := 9;   //@ cpChromiumOrSRwareIron
    ChromiumTypeInrement + index_cpSlimjet                :  Result := 21;  //@ cpSlimjet
    ChromiumTypeInrement + index_cpBrave                  :  Result := 7;   //@ cpBrave
    ChromiumTypeInrement + index_cpMailRuAtom             :  Result := 0;   //@ cpMailRuAtom
    ChromiumTypeInrement + index_cpCentBrowser            :  Result := 2;   //@ cpCentBrowser
    ChromiumTypeInrement + index_cpComodoDragon           :  Result := 3;   //@ cpComodoDragon
    ChromiumTypeInrement + index_cpTwinkstar              :  Result := 13;  //@ cpTwinkstar
    ChromiumTypeInrement + index_cpURBrowser              :  Result := 23;  //@ cpURBrowser
    ChromiumTypeInrement + index_cpMaxthon                :  Result := 18;  //@ cpMaxthon
    ChromiumTypeInrement + index_cpDecentr                :  Result := 5;   //@ cpDecentr
    ChromiumTypeInrement + index_cpiTopPrivateBrowser     :  Result := 17;  //@ cpiTopPrivateBrowser
    ChromiumTypeInrement + index_cpMSEdge                 :  Result := 10;  //@ cpMSEdge
    ChromiumTypeInrement + index_cpVivaldi                :  Result := 15;  //@ cpVivaldi
    ChromiumTypeInrement + index_cpQQBrowser              :  Result := 27;  //@ cpQQBrowser
    ChromiumTypeInrement + index_cp360EEX                 :  Result := 29;  //@ 360ChromeX';
    ChromiumTypeInrement + index_cp360SE                  :  Result := 30;  //@ 360安全浏览器';

    MozillaTypeIncrement + index_mpFireFox                :  Result := 6;   //@FireFox
    MozillaTypeIncrement + index_mpPaleMoon               :  Result := 11;  //@PaleMoon
    MozillaTypeIncrement + index_mpThunderbird            :  Result := 22;  //@Thunderbird
    MozillaTypeIncrement + index_mpSeaMonkey              :  Result := 19;  //@SeaMonkey
    MozillaTypeIncrement + index_mpSlimBrowser            :  Result := 20;  //@ slimbrowser
    MozillaTypeIncrement + index_mpBasilisk               :  Result := 1 ;  //@ basilisk
    MozillaTypeIncrement + index_mpIceDragon              :  Result := 4;   //@ iceDragon
    MozillaTypeIncrement + index_mpWaterFox               :  Result := 24;  //@WaterFox

    OperaTypeIncrement                                    :  Result := 12;  //@Opera

    MiscTypeIncrement + index_opViber                     :  Result := 14;  //@ Viber
  end;
end;





end.
