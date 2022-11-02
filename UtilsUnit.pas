unit UtilsUnit;

interface


{$IFDEF WIN32}
 {$DEFINE sqlite3_STATIC_DLL_LOAD}
{$ELSE}
 // nothing
{$IFEND}

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShlObj,

  System.SysUtils,
  System.Classes,
  System.Types,
  System.IOUtils,
  System.StrUtils,
  System.Masks,
  System.Generics.Collections,

  Vcl.Dialogs,

  JclShell
  ;

  const
     {$IFDEF WIN32}
      sqlite3_lib = 'sqlite3_win32.dll';
     {$ELSE}
      sqlite3_lib = 'sqlite3_win64.dll';
     {$IFEND}

  type
    PSQLite3 = type Pointer;
    PPAnsiCharArray = ^TPAnsiCharArray;
    TPAnsiCharArray = array[0..MaxInt div SizeOf(PAnsiChar) - 1] of PAnsiChar;
    TSQLite3Callback = function(pArg: Pointer; nCol: Integer; argv: PPAnsiCharArray; colv: PPAnsiCharArray): Integer; {$IFDEF sqlite3_STATIC_DLL_LOAD} cdecl;  {$ELSE} stdcall; {$IFEND}

  // cdecl static
  // stdcall dynamic
 {$IFDEF sqlite3_STATIC_DLL_LOAD}
    function sqlite3_open(const filename: PAnsiChar; var ppDb: PSQLite3): Integer; cdecl; external sqlite3_lib;
    function sqlite3_exec(db: PSQLite3; const sql: PAnsiChar; callback: TSQLite3Callback; pArg: Pointer; errmsg: PPAnsiChar): Integer; cdecl; external sqlite3_lib;
    function sqlite3_close(db: PSQLite3): Integer; cdecl; external sqlite3_lib;
 {$ELSE}
    Tsqlite3_open = function(const filename: PAnsiChar; var ppDb: PSQLite3): Integer;
    Tsqlite3_exec = function(db: PSQLite3; const sql: PAnsiChar; callback: TSQLite3Callback; pArg: Pointer; errmsg: PPAnsiChar): Integer;
    Tsqlite3_close = function(db: PSQLite3): Integer;
 {$IFEND}


  type
   { TSSearchRec = record
      Size: Int64;
      Name: string;
      Path: string;
    end;     }
    TAProfiles =  record
      appName  : string;
      appType  : Integer;
      appProfiles: TList<string>;
    end;

    TChromiumProfileType = (cpYandex, cpChrome, cpChromiumOrSRwareIron, cpSlimjet, cpBrave, cpMailRuAtom,
                            cpCentBrowser, cpComodoDragon, cpTwinkstar, cpURBrowser, cpMaxthon, cpDecentr,
                            cpiTopPrivateBrowser, cpMSEdge, cpVivaldi, cpBasilisk, cpQQBrowser);

    TMozillaProfileType  = (mpFireFox, mpPaleMoon, mpThunderbird, mpSeaMonkey, mpSlimBrowser, mpBasilisk, mpIceDragon, mpWaterFox);

    TMiscProfileType     = (opViber);


    // GetProfiles
    procedure SetAppNameAndType(const ProfileIndex, EngineIndex: Integer; var appType: Integer; var appName: string);
    procedure FreeSearchProfilesResult(List: TList<TAProfiles>);
    function  GetProfilesA:TList<TAProfiles>;

    // LNK
    function GetLnkFile(const LNKFilePath: string; var Target: string; var CMD: string): Integer;
    function AppNameFromType(const appType: Integer): string;
    function GetChromedProfileInfo(const srcFileName: string; const srcCMD: string; var ProfilePath: string): Integer;

    // Misc
    function AppImageIndexFromType(const appType: integer): Integer;
    function ProfilePathIsDisabled(const Path: string; const DisProfiles: TArray<string>): Boolean;

    // SQL
    function  IsSQLiteFile(const Path: string): Boolean;
    procedure SQLiteOptimizeFile(const FilePath: string);

    //Search
    function  ScannDirectory(const Path: String; const MaskArray: TStringDynArray;
                             const MinSize: Int64; const MaxDepth: Integer): TList<TSearchRec{TSSearchRec}>;

    // sys
    function GetSpecialFolderPath(CSIDLFolder: Integer): string;
    function IsElevated: Boolean;
    function GetFilePeBitDepth(const Filename: String): Integer;
    function FileVersion(const FileName: TFileName): String;
    function FormatByteSize(const bytes: int64): string;

  const
     PROFILE_TYPE_UNDEFINED = 0;

     ENGINE_UNKNOWN  = 0;
     ENGINE_MOZILLA  = 1;
     ENGINE_CHROMIUM = 2;
     ENGINE_OPERA    = 3;

     MozillaBasedAppCount   = 8;
     ChromiumBasedAppCount  = 17;
     MiscEngineAppCount     = 1;


     RESULT_LNK_TO_DIRECTORY           = 0;
     RESULT_LNK_TO_CHROMED_PROFILE     = 1;
     RESULT_LNK_TO_CHROMED_USERDATADIR = 2;
     RESULT_LNK_UNKNOWN                = 3;


implementation

{$IFDEF sqlite3_STATIC_DLL_LOAD}

{$ELSE}
var
  hDLL: THandle;
  sqlite3_open   : Tsqlite3_open  ;
  sqlite3_exec   : Tsqlite3_exec  ;
  sqlite3_close  : Tsqlite3_close ;
{$IFEND}


{$REGION ' GetProfiles '}

{$REGION ' internal for GetProfiles '}

function GetDirectories(const Path: String; gdAll: Boolean):TList<string>;
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
             R := GetDirectories(sPath + rec.Name, True);
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

Function GetOperaProfiles:TList<string>;
var tmp_str: string;
begin
   Result := nil;
//  C:\Users\uu\AppData\Roaming\Opera Software\Opera Stable
//  C:\Users\uu\AppData\Roaming\Opera Software\Opera GX Stable
   tmp_str := GetEnvironmentVariable('APPDATA') + '\Opera Software\';
   if DirectoryExists( tmp_str ) then
    Result := GetDirectories(tmp_str, False);
end;

function GetChromiumProfile(const bType: TChromiumProfileType): string;
var tmp_str: string;
begin
  tmp_str := GetEnvironmentVariable('USERPROFILE') + '\AppData\Local\';
  case bType of
    cpYandex                : tmp_str := tmp_str + 'Yandex\YandexBrowser\User Data';
    cpChrome                : tmp_str := tmp_str + 'Google\Chrome\User Data';
    cpChromiumOrSRwareIron  : tmp_str := tmp_str + 'Chromium\User Data';
    cpSlimjet               : tmp_str := tmp_str + 'Slimjet\User Data';
    cpBrave                 : tmp_str := tmp_str + 'BraveSoftware\Brave-Browser\User Data';
    cpMailRuAtom            : tmp_str := tmp_str + 'Mail.Ru\Atom\User Data';
    cpCentBrowser           : tmp_str := tmp_str + 'CentBrowser\User Data';
    cpComodoDragon          : tmp_str := tmp_str + 'Comodo\Dragon\User Data';
    cpTwinkstar             : tmp_str := tmp_str + 'Twinkstar\User Data';
    cpURBrowser             : tmp_str := tmp_str + 'URBrowser\User Data';
    cpMaxthon               : tmp_str := tmp_str + 'Maxthon\Application\User Data';
    cpDecentr               : tmp_str := tmp_str + 'Decentr\Decentr\User Data';
    cpiTopPrivateBrowser    : tmp_str := tmp_str + 'iTop Private Browser\User Data';
    cpMSEdge                : tmp_str := tmp_str + 'Microsoft\Edge\User Data';
    cpVivaldi               : tmp_str := tmp_str + 'Vivaldi\User Data';

    cpBasilisk              : tmp_str := tmp_str + 'Basilisk-Dev\Basilisk\Profiles';
    cpQQBrowser             : tmp_str := tmp_str + 'Tencent\QQBrowser\User Data';
  end;
  if DirectoryExists( tmp_str ) then Result := tmp_str else Result := '';
end;

function GetMozillaProfiles(const bType: TMozillaProfileType):TList<string>;
var
  ffprofile_dir, tmp_str: string;
  List: TStringList;
  i: Integer;
begin
  Result := nil;

  ffprofile_dir := GetEnvironmentVariable('APPDATA');
  case bType of
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

function GetMiscProfile(const cType: TMiscProfileType): string;
begin
  case cType of
    opViber: Result := GetEnvironmentVariable('APPDATA') + '\ViberPC\';
  end;
  if not DirectoryExists( Result ) then  Result := '';
end;

procedure SetAppNameAndType(const ProfileIndex, EngineIndex: Integer; var appType: Integer; var appName: string);
begin

 appType   := 0;
 appName   := '';

 case EngineIndex of

   ENGINE_MOZILLA      :
        case TMozillaProfileType(ProfileIndex) of
           mpFireFox       :    begin  appType := 100;   appName:= 'FireFox';      end;
           mpPaleMoon      :    begin  appType := 101;   appName:= 'PaleMoon';     end;
           mpThunderbird   :    begin  appType := 102;   appName:= 'Thunderbird';  end;
           mpSeaMonkey     :    begin  appType := 103;   appName:= 'SeaMonkey';    end;
           mpSlimBrowser   :    begin  appType := 104;   appName:= 'SlimBrowser';  end;
           mpBasilisk      :    begin  appType := 105;   appName:= 'Basilisk';     end;
           mpIceDragon     :    begin  appType := 106;   appName:= 'IceDragon';    end;
           mpWaterFox      :    begin  appType := 107;   appName:= 'WaterFox';     end;
        end;

   ENGINE_CHROMIUM     :
        case TChromiumProfileType(ProfileIndex) of
          cpYandex                :  begin appType := 200; appName:= 'Yandex';                end;
          cpChrome                :  begin appType := 201; appName:= 'Chrome';                end;
          cpChromiumOrSRwareIron  :  begin appType := 202; appName:= 'Chromium';              end;
          cpSlimjet               :  begin appType := 203; appName:= 'Slimjet';               end;
          cpBrave                 :  begin appType := 204; appName:= 'Brave';                 end;
          cpMailRuAtom            :  begin appType := 205; appName:= 'Atom';                  end;
          cpCentBrowser           :  begin appType := 206; appName:= 'Cent Browser';          end;
          cpComodoDragon          :  begin appType := 207; appName:= 'Dragon';                end;
          cpTwinkstar             :  begin appType := 208; appName:= 'Twinkstar';             end;
          cpURBrowser             :  begin appType := 209; appName:= 'UR Browser';            end;
          cpMaxthon               :  begin appType := 210; appName:= 'Maxthon';               end;
          cpDecentr               :  begin appType := 211; appName:= 'Decentr';               end;
          cpiTopPrivateBrowser    :  begin appType := 212; appName:= 'iTop Private Browser';  end;
          cpMSEdge                :  begin appType := 213; appName:= 'Edge';                  end;
          cpVivaldi               :  begin appType := 214; appName:= 'Vivaldi';               end;
          cpBasilisk              :  begin appType := 215; appName:= 'Basilisk(chromium)';    end;
          cpQQBrowser             :  begin appType := 216; appName:= 'QQBrowser';             end;
        end;

   ENGINE_UNKNOWN        :
        case TMiscProfileType(ProfileIndex) of
          opViber : begin appType := 300; appName:= 'Viber'; end;

        end;

   ENGINE_OPERA : begin appType := 400; appName:= 'Opera'; end;

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

  List.Free;
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
  ADirs := GetOperaProfiles;
  if ADirs <> nil then
  begin
    with AProfile do
    begin
      SetAppNameAndType(0, ENGINE_OPERA, appType, appName);
      appProfiles := TList<string>.Create;
      appProfiles.AddRange( ADirs );
    end;
    Result.Add(AProfile);
    ADirs.Free;
  end;

// *******************************
// Chrome
// *******************************
  for I := 0 to ChromiumBasedAppCount-1 do
  begin
    tmp_path := GetChromiumProfile(  TChromiumProfileType(i)  );
    if tmp_path.Length > 0 then
    begin
      with AProfile do
      begin
        SetAppNameAndType(i, ENGINE_CHROMIUM, appType, appName);
        appProfiles := TList<string>.Create;
        appProfiles.Add( tmp_path );
      end;
      Result.Add(AProfile);
    end;
  end;

// *******************************
// Mozilla
// *******************************
  for I := 0 to MozillaBasedAppCount-1 do
  begin
    ADirs := GetMozillaProfiles( TMozillaProfileType(i) );
    if ADirs <> nil then
    begin
      with AProfile do
      begin
        SetAppNameAndType(i, ENGINE_MOZILLA, appType, appName);
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
  for I := 0 to MiscEngineAppCount-1 do
  begin
    tmp_path := GetMiscProfile( TMiscProfileType(i)  );
    if tmp_path.Length > 0 then
    begin
      with AProfile do
      begin
        SetAppNameAndType(i, ENGINE_UNKNOWN, appType, appName);
        appProfiles := TList<string>.Create;
        appProfiles.Add( tmp_path );
      end;
      Result.Add(AProfile);
    end;
  end;

end;

{$ENDREGION}

{$REGION ' LNK '}

function AppNameFromType(const appType: Integer): string;
begin
   case appType of
     100: Result:= 'FireFox';
     101: Result:= 'PaleMoon';
     102: Result:= 'Thunderbird';
     103: Result:= 'SeaMonkey';
     104: Result:= 'SlimBrowser';
     105: Result:= 'Basilisk';
     106: Result:= 'IceDragon';
     107: Result:= 'WaterFox';

     200: Result:= 'Yandex';
     201: Result:= 'Chrome';
     202: Result:= 'Chromium';
     203: Result:= 'Slimjet';
     204: Result:= 'Brave';
     205: Result:= 'Atom';
     206: Result:= 'Cent Browser';
     207: Result:= 'Dragon';
     208: Result:= 'Twinkstar';
     209: Result:= 'UR Browser';
     210: Result:= 'Maxthon';
     211: Result:= 'Decentr';
     212: Result:= 'iTop Private Browser';
     213: Result:= 'Edge';
     214: Result:= 'Vivaldi';
     215: Result:= 'Basilisk(chromium)';
     216: Result:= 'QQBrowser';

     300: Result:= 'Viber';
     400: Result:= 'Opera';
   end;
end;

function PosIndexText(const AText: string; const AValues: array of string): Integer;
begin
  for Result := Low(AValues) to High(AValues) do
    if Pos( lowercase(AValues[Result]),  AText ) > 0 then Exit;

  Result := -1;
end;

function ReadProductName(const FileName: string): string;
type
  PLandCodepage = ^TLandCodepage;
  TLandCodepage = record
    wLanguage,
      wCodePage: Word;
  end;
var
  Dummy: DWORD;
  Len: DWORD;
  Buf: TBytes;
  pntr: Pointer;
  Lang: string;
begin

  Len := GetFileVersionInfoSize(PChar(Filename), Dummy);
  if Len = 0 then
    exit;
  SetLength(Buf, Len);

  if not GetFileVersionInfo(PChar(Filename), 0, Len, @Buf[0]) then
    exit;
  if not VerQueryValue(Buf, '\VarFileInfo\Translation\', pntr, Len) then
    exit;
  Lang := Format('%.4x%.4x', [PLandCodepage(pntr)^.wLanguage, PLandCodepage(pntr)^.wCodePage]);

  if VerQueryValue(@Buf[0], PChar('\StringFileInfo\' + Lang + '\ProductName'), pntr, Len)  then
    Result := PChar(pntr);

end;

function LongPathName(const ShortPathName: string): string;
var
  Retval: DWORD;
  Buff: array [0..MAX_PATH-1] of Char;
begin
  Retval := GetLongPathName(PChar(ShortPathName), Buff, Length(Buff));
  Win32Check(Retval <> 0);
  Result := Buff;
end;

function GetLnkFile(const LNKFilePath: string; var Target: string; var CMD: string): Integer;
{const
 RESULT_LNK_TO_DIRECTORY           = 0;
 RESULT_LNK_TO_CHROMED_PROFILE     = 1;
 RESULT_LNK_TO_CHROMED_USERDATADIR = 2;
 RESULT_LNK_UNKNOWN                = 3;  }

var Link: TShellLink;
begin
   Target   := '';
   CMD := '';
   ShellLinkResolve( LNKFilePath, Link);
   Target   := Link.Target;
   CMD := Link.Arguments;

   if ( FileGetAttr( Link.Target) and faDirectory = faDirectory) then
   begin
     Result := RESULT_LNK_TO_DIRECTORY; //DIRECTORY
     Exit;
   end;

   Result := RESULT_LNK_UNKNOWN;

   Case PosIndexText(lowercase(CMD),
                     ['--user-data-dir=',
                     '--profile-directory='] )
   of
     0 : Result := RESULT_LNK_TO_CHROMED_USERDATADIR;
     1:  Result := RESULT_LNK_TO_CHROMED_PROFILE; //Chromed profile
   End;
   //'--profile-directory="Profile 1"'

end;



function GetChromedProfileInfo(const srcFileName: string; const srcCMD: string; var ProfilePath: string): Integer;
const RESULT_NO_CHROME_ARGUMENT = -1;
      RESULT_PATH_NOT_FOUND     = -2;
      RESULT_UNKNOWN_PROFILE    = PROFILE_TYPE_UNDEFINED;   // 0

var _tmpStr: string;
begin
  _tmpStr := srcCMD;

  Delete( _tmpStr, 1, pos('=', _tmpStr, 1) );
  _tmpStr :=  _tmpStr.DeQuotedString('"');

  // relative from browser dir or from appdata dir
  if TPath.IsRelativePath( _tmpStr ) then
  begin
   // relative path from browser dir
   if DirectoryExists(TPath.GetFullPath( IncludeTrailingBackslash(ExtractFilePath(srcFileName)) + _tmpStr) ) then
       ProfilePath := TPath.GetFullPath( IncludeTrailingBackslash(ExtractFilePath(srcFileName)) + _tmpStr)
   else
    // relative path from appdata dir
    if DirectoryExists( TPath.GetFullPath( GetEnvironmentVariable('USERPROFILE') + '\AppData\Local\' + _tmpStr) ) then
        ProfilePath := TPath.GetFullPath(GetEnvironmentVariable('USERPROFILE') + '\AppData\Local\' + _tmpStr) ;
  end
  else
  // absolute
  if DirectoryExists(TPath.GetFullPath(_tmpStr)) then ProfilePath := TPath.GetFullPath(_tmpStr);


  if ProfilePath.Length = 0 then Exit(RESULT_PATH_NOT_FOUND); // Path not found

  _tmpStr := lowercase( ReadProductName( srcFileName ) );

  Case PosIndexText(_tmpStr,
   ['Yandex',
    'Google Chrome',
    'SRWare Iron',
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
    'Chromium',
    'Basilisk',
    'QQBrowser'

    ])
  of
    0   :  Result := 200;   // cpYandex
    1   :  Result := 201;   // cpChrome
    2,15:  Result := 202;   // SRwareIron   cpChromium
    3   :  Result := 203;   // cpSlimjet
    4   :  Result := 204;   // cpBrave
    5   :  Result := 205;   // cpMailRuAtom
    6   :  Result := 206;   // cpCentBrowser
    7   :  Result := 207;   // cpComodoDragon
    8   :  Result := 208;   // cpTwinkstar
    9   :  Result := 209;   // cpURBrowser
    10  :  Result := 210;   // cpMaxthon
    11  :  Result := 211;   // cpDecentr
    12  :  Result := 212;   // cpiTopPrivateBrowser
    13  :  Result := 213;   // cpMSEdge
    14  :  Result := 214;   // cpVivaldi
    16  :  Result := 215;   // cpBasilisk
    17  :  Result := 216;   // cpQQBrowser
  else
    Result := RESULT_UNKNOWN_PROFILE;
  end;

end;


{$ENDREGION}

{$REGION ' Misc '}

function AppImageIndexFromType(const appType: integer): Integer;
begin
  Result := -1;
  case appType of
     0  : Result := 25;

     100:  Result := 6;   //@FireFox
     101:  Result := 11;  //@PaleMoon
     102:  Result := 22;  //@Thunderbird
     103:  Result := 19;  //@SeaMonkey
     104:  Result := 20;  //@ slimbrowser
     105:  Result := 1 ;  //@ basilisk
     106:  Result := 4;   //@ iceDragon
     107:  Result := 24;  //@WaterFox

     200:  Result := 16;  //@ cpYandex
     201:  Result := 8;   //@ cpChrome
     202:  Result := 9;   //@ cpChromiumOrSRwareIron
     203:  Result := 21;  //@ cpSlimjet
     204:  Result := 7;   //@ cpBrave
     205:  Result := 0;   //@ cpMailRuAtom
     206:  Result := 2;   //@ cpCentBrowser
     207:  Result := 3;   //@ cpComodoDragon
     208:  Result := 13;  //@ cpTwinkstar
     209:  Result := 23;  //@ cpURBrowser
     210:  Result := 18;  //@ cpMaxthon
     211:  Result := 5;   //@ cpDecentr
     212:  Result := 17;  //@ cpiTopPrivateBrowser
     213:  Result := 10;  //@ cpMSEdge
     214:  Result := 15;  //@ cpVivaldi
     215:  Result := 1;   //@ cpBasilisk
     216:  Result := 27;  //@ cpQQBrowser

     300:  Result := 14;  //@ Viber


     400:  Result := 12;  //@Opera
  end;
end;

function ProfilePathIsDisabled(const Path: string; const DisProfiles: TArray<string>): Boolean;
var
  I: Integer;
begin
   Result := False;
   if Length(DisProfiles) > 0 then
    for I := 0 to High(DisProfiles) do
       if CompareText( DisProfiles[i], Path ) = 0  then
         Exit(true);
end;

{$ENDREGION}

{$REGION ' SQL '}

function IsSQLiteFile(const Path: string): Boolean;
const
  SQL3Header: array[0..5] of byte = ( $53, $51, $4C, $69, $74, $65 );
// $53, $51, $4C, $69, $74, $65, $20, $66, $6F, $72, $6D, $61, $74, $20, $33
var
  hFile: THandle;
  Buffer: array[0..5] of byte;
  lpNumberOfBytesRead: DWORD;
begin
  hFile:=CreateFile( PWideChar( Path ), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
  try
    ReadFile(hFile, Buffer[0], 6, lpNumberOfBytesRead, nil);
    Result := CompareMem(@Buffer[0],  @SQL3Header[0], 6 );
  finally
   CloseHandle(hFile);
  end;
end;


    {$IFDEF sqlite3_STATIC_DLL_LOAD}

procedure SQLiteOptimizeFile(const FilePath: string);
var
  FHandle: PSQLite3;
begin
   FHandle := nil;

   sqlite3_open(PAnsiChar(UTF8Encode(FilePath)), FHandle);
   try
    if FHandle <> nil then
    sqlite3_exec(FHandle, PAnsiChar(UTF8Encode('VACUUM;')), nil, nil, nil);
   finally
      if FHandle <> nil then
      begin
        sqlite3_close(FHandle);
        FHandle := nil;
      end;
   end;
end;

    {$ELSE}

procedure SQLiteOptimizeFile(const FilePath: string);
var
  FHandle: PSQLite3;
begin
  if hDLL = 0 then
  begin
      raise Exception.CreateFmt('Unable to load DLL %s!', [sqlite3_lib]);
      Exit;
  end;

  if @sqlite3_open <> nil then
    sqlite3_open(PAnsiChar(UTF8Encode(FilePath)), FHandle);

   try
    if FHandle <> nil then
      if @sqlite3_exec <> nil then
           sqlite3_exec(FHandle, PAnsiChar(UTF8Encode('VACUUM;')), nil, nil, nil);
   finally
      if FHandle <> nil then
      begin
        if @sqlite3_close <> nil then
                         sqlite3_close(FHandle);
        FHandle := nil;
      end;
   end;        { }
end;

    {$IFEND}



{$ENDREGION}

{$REGION ' ScannDirectory '}


//MaxDepth - if less than 0 then unlimited, if 0 - onlyCurrent folder otherwise should be greater than 0
//MinSize  - in bytes
function ScannDirectory(const Path: String; const MaskArray: TStringDynArray; const MinSize: Int64; const MaxDepth: Integer): TList<TSearchRec{TSSearchRec}>;

const
 MD_SCANN_UNLIMITED = -1;
 MD_SCANN_CURRENT_DIRECTORY = 0;

      function MatchesMinSize(FileSize, CheckMinSize: Int64):Boolean;
      begin
         Result := False;
         if FileSize = 0 then Exit;
         if CheckMinSize = 0 then Exit(true);
         Exit( FileSize > CheckMinSize );
      end;

var
  sPath: string;
  Mask: string;
  Rec : TSearchRec;
//  R: TList<TSSearchRec>;
//  X: TSSearchRec;
  R: TList<TSearchRec>;
  X: TSearchRec;

begin
 // Result := TList<TSSearchRec>.Create;
  Result := TList<TSearchRec>.Create;

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
          if MaxDepth <= MD_SCANN_UNLIMITED then  //MaxDepth < 0
          begin
             try
               R := ScannDirectory(sPath + rec.Name, MaskArray, MinSize, MD_SCANN_UNLIMITED);
               if R.Count > 0 then
               Result.AddRange( R );
             finally
               FreeAndNil(R);// R.Free;
             end;
          end
          else
          if MaxDepth > MD_SCANN_CURRENT_DIRECTORY then
             begin
                try
                   R := ScannDirectory(sPath + rec.Name, MaskArray, MinSize, MaxDepth-1);
                  if R.Count > 0 then
                  Result.AddRange( R );
                finally
                  FreeAndNil(R);//R.Free;
                end;
             End;

          //if MaxDepth = MD_SCANN_CURRENT_DIRECTORY then skip
      end
      else
      begin
        // item is a file
        //if


        for Mask in MaskArray do
          if MatchesMask(rec.Name, Mask) then
           if MatchesMinSize(rec.Size, MinSize) then
           begin
             // do job....
           {  X.Size  := rec.Size;
             X.Name  := rec.Name;
             X.Path  := sPath;
             Result.Add( X )   ;

             Finalize(X);   }

             rec.Name :=  sPath + rec.Name;
             Result.Add( rec );

             Break;
           end;


      end;
    until FindNext(rec) <> 0;
    FindClose(rec);
  end;
end;
{$ENDREGION}

{$REGION ' sys '}

function GetSpecialFolderPath(CSIDLFolder: Integer): string;
var
   FilePath: array [0..MAX_PATH] of char;
begin
  SHGetFolderPath(0, CSIDLFolder, 0, 0, FilePath);
  Result := FilePath;
end;

function IsElevated: Boolean;
const
  TokenElevation = TTokenInformationClass(20);
type
  TOKEN_ELEVATION = record
    TokenIsElevated: DWORD;
  end;
var
  TokenHandle: THandle;
  ResultLength: Cardinal;
  ATokenElevation: TOKEN_ELEVATION;
  HaveToken: Boolean;
begin
{  if CheckWin32Version(6, 0) then
  begin
  end
  else
    Result := IsAdministrator;   }

    TokenHandle := 0;
    HaveToken := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True, TokenHandle);
    if (not HaveToken) and (GetLastError = ERROR_NO_TOKEN) then
      HaveToken := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, TokenHandle);
    if HaveToken then
    begin
      try
        ResultLength := 0;
        if GetTokenInformation(TokenHandle, TokenElevation, @ATokenElevation, SizeOf(ATokenElevation), ResultLength) then
          Result := ATokenElevation.TokenIsElevated <> 0
        else
          Result := False;
      finally
        FileClose(TokenHandle); { *Converted from CloseHandle* }
      end;
    end
    else
      Result := False;

end;

function GetFilePeBitDepth(const Filename: String): Integer;
const
  IMAGE_FILE_MACHINE_I386     = $014c; // Intel x86
  IMAGE_FILE_MACHINE_IA64     = $0200; // Intel Itanium Processor Family (IPF)
  IMAGE_FILE_MACHINE_AMD64    = $8664; // x64 (AMD64 or EM64T)
var
  Header: TImageDosHeader;
  ImageNtHeaders: TImageNtHeaders;

  Strm: TFileStream;
begin
  Strm := TFileStream.Create(FileName, fmShareDenyNone);

      Strm.ReadBuffer(Header, SizeOf(Header));
      if (Header.e_magic <> IMAGE_DOS_SIGNATURE) or
         (Header._lfanew = 0) then
      begin
        Result := -1; Strm.Free; Exit;
       // raise Exception.Create('Invalid executable');
      end;

      Strm.Position := Header._lfanew;
      Strm.ReadBuffer(ImageNtHeaders, SizeOf(ImageNtHeaders));
      if ImageNtHeaders.Signature <> IMAGE_NT_SIGNATURE then
      begin
        Result := -1; Strm.Free; Exit;
       // raise Exception.Create('Invalid executable');
      end;

      case ImageNtHeaders.FileHeader.Machine of
        IMAGE_FILE_MACHINE_I386  :  Result := 32;
        IMAGE_FILE_MACHINE_AMD64, IMAGE_FILE_MACHINE_IA64 :  Result := 64;
      end;

  Strm.Free;
end;

function FileVersion(const FileName: TFileName): String;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
begin
  Result := '';  //   SHGetFileInfo()
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, PVerInfo) then
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
        with PVerValue^ do
          Result := Format('v%d.%d.%d', [
            HiWord(dwFileVersionMS), //Major
            LoWord(dwFileVersionMS), //Minor
            HiWord(dwFileVersionLS) //Release
            ]); //Build
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;
end;

function FormatByteSize(const bytes: int64): string;
const
  _K  = 1024; //byte
  _B  = 1; //byte
  _KB = _K * _B; //kilobyte
  _MB = _K * _KB; //megabyte
  _GB = _K * _MB; //gigabyte
begin
  if bytes = 0 then
          Exit('0 Bytes');

  if bytes > _GB then
    result := FormatFloat('#.## GB', bytes / _GB)
  else
    if bytes > _MB then
      result := FormatFloat('#.## MB', bytes / _MB)
    else
      if bytes > _KB then
        result := FormatFloat('#.## KB', bytes / _KB)
      else
        result := FormatFloat('#.## Bytes', bytes) ;
end;

{$ENDREGION}



initialization

  if System.SysUtils.TOSVersion.Architecture in
    {$IFDEF WIN32} [arARM64, arIntelX64] {$ELSE} [arIntelX86, arARM32] {$IFEND}
  then
  begin
    {$IFDEF WIN32}
      MessageDlg('You are using 64-bit Windows, please use the 64-bit version of the Arctic Profile Optimizer', mtInformation, [mbOk], 0, mbOk);
    {$ELSE}
      MessageDlg('You are using 32-bit Windows, please use the 32-bit version of the Arctic Profile Optimizer', mtInformation, [mbOk], 0, mbOk);
    {$IFEND}
    Halt(0);
  end;


{$IFDEF sqlite3_STATIC_DLL_LOAD}
  // nothing ...
{$ELSE}

{$REGION ' DLL Check ... '}

  const ErrMsg_DLL_NOT_FOUND   = 'DLL file: "%s" not found.';
  const ErrMsg_DLL_PE_INVALID  = 'DLL file: "%s" is not valid PE file.';
  const ErrMsg_DLL64_BIT       = 'DLL file: "%s" is for 64 bit application while you are using 32 bit application.';
  const ErrMsg_DLL32_BIT       = 'DLL file: "%s" is for 32 bit application while you are using 64 bit application.';

   // File not found
   if not FileExists(sqlite3_lib) then
   begin
      MessageDlg( Format(ErrMsg_DLL_NOT_FOUND, [sqlite3_lib]), mtError, [mbOk], 0, mbOk);
       Halt(0);
      Exit;
   end;

   // Invalid PE
   var DLLBitDepth: Integer := GetFilePeBitDepth(sqlite3_lib);
   if DLLBitDepth = -1 then
   begin
      MessageDlg( Format(ErrMsg_DLL_PE_INVALID, [sqlite3_lib]), mtError, [mbOk], 0, mbOk);
       Halt(0);
      Exit;
   end;

   // Invalid bit dept
  {$IFDEF WIN32}
   if DLLBitDepth <> 32 then
   begin
      MessageDlg( Format(ErrMsg_DLL64_BIT, [sqlite3_lib]), mtError, [mbOk], 0, mbOk);
       Halt(0);
      Exit;
   end;
  {$ELSE}
   if DLLBitDepth <> 64 then
   begin
      MessageDlg( Format(ErrMsg_DLL32_BIT, [sqlite3_lib]), mtError, [mbOk], 0, mbOk);
       Halt(0);
      Exit;
   end;
  {$IFEND}



  hDLL := LoadLibrary( PWideChar(sqlite3_lib) );
  if hDLL <> 0 then
  begin
      @sqlite3_open  := GetProcAddress(hDll, PAnsiChar('sqlite3_open')   );
      @sqlite3_exec  := GetProcAddress(hDll, PAnsiChar('sqlite3_exec')   );
      @sqlite3_close := GetProcAddress(hDll, PAnsiChar('sqlite3_close')  );
  end
  else
    raise Exception.CreateFmt('Unable to load DLL %s!', [sqlite3_lib]);

{$ENDREGION}

{$IFEND}

finalization
{$IFDEF sqlite3_STATIC_DLL_LOAD}
   // nothing ...
{$ELSE}
  if hDLL <> 0 then FreeLibrary(hDLL);
{$IFEND}

end.
