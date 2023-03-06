unit aSQLUtilsUnit;

interface

{$DEFINE sqlite3_checkfilefast}
{$IFDEF WIN32}
 {$DEFINE sqlite3_STATIC_DLL_LOAD}
{$ELSE}
 // nothing
{$IFEND}

uses
  aUtilsUnit,

  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Classes,
  System.Types,
  System.Masks,
  System.Generics.Collections,

  Vcl.Dialogs

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


    // SQL
    function  IsSQLiteFile(const Path: string): Boolean;
    procedure SQLiteOptimizeFile(const FilePath: string);

    //Search
    function  ScannDirectory(const Path: String; const MaskArray: TStringDynArray;
                             const MinSize: Int64; const MaxDepth: Integer): TList<TSearchRec>;


implementation

{$IFDEF sqlite3_STATIC_DLL_LOAD}
//....
{$ELSE}
var
  hDLL: THandle;
  sqlite3_open   : Tsqlite3_open  ;
  sqlite3_exec   : Tsqlite3_exec  ;
  sqlite3_close  : Tsqlite3_close ;
{$IFEND}


{$REGION ' SQL '}

function IsSQLiteFile(const Path: string): Boolean;
const
{$IFDEF sqlite3_checkfilefast}
  SQL3HeaderShort: array[0..5] of byte = ( $53, $51, $4C, $69, $74, $65 );
{$ELSE}
  SQL3HeaderFull : array[0..15] of byte = ($53, $51, $4C, $69, $74, $65, $20, $66, $6F, $72, $6D, $61, $74, $20, $33, $00)  ;
{$IFEND}
var
  hFile: THandle;
{$IFDEF sqlite3_checkfilefast}
  Buffer: array[0..5] of byte;
{$ELSE}
  Buffer: array[0..15] of byte;
{$IFEND}
  lpNumberOfBytesRead: DWORD;
begin
  hFile:=CreateFile( PWideChar( Path ), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
  try
{$IFDEF sqlite3_checkfilefast}
    ReadFile(hFile, Buffer[0], 6, lpNumberOfBytesRead, nil);
    Result := CompareMem(@Buffer[0],  @SQL3HeaderShort[0], 6 );
{$ELSE}
    ReadFile(hFile, Buffer[0], 16, lpNumberOfBytesRead, nil);
    Result := CompareMem(@Buffer[0],  @SQL3HeaderFull[0], 16 );
{$IFEND}
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


initialization
 // SetProcessDPIAware;

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


{$REGION ' 3 - DLL Checks '}
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
{$ENDREGION}


{$IFDEF sqlite3_STATIC_DLL_LOAD}
  // nothing ...
{$ELSE}
  hDLL := LoadLibrary( PWideChar(sqlite3_lib) );
  if hDLL <> 0 then
  begin
      @sqlite3_open  := GetProcAddress(hDll, PAnsiChar('sqlite3_open')   );
      @sqlite3_exec  := GetProcAddress(hDll, PAnsiChar('sqlite3_exec')   );
      @sqlite3_close := GetProcAddress(hDll, PAnsiChar('sqlite3_close')  );
  end
  else
    raise Exception.CreateFmt('Unable to load DLL %s!', [sqlite3_lib]);
{$IFEND}

finalization
{$IFDEF sqlite3_STATIC_DLL_LOAD}
   // nothing ...
{$ELSE}
  if hDLL <> 0 then FreeLibrary(hDLL);
{$IFEND}

end.
