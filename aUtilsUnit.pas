unit aUtilsUnit;

{$DEFINE ExpandEnvironmentPath_v1}

interface

 uses
      aConstUnit,
      aCacheUnit,
      //aSettingsUnit,
      //aConfigUnit,

      JclShell,
      ShLwApi,

      Winapi.ShlObj,
      Winapi.Windows,
      Winapi.Messages,

      System.Variants,
      System.StrUtils,
      System.Masks,
      System.Generics.Collections,
      System.IniFiles,
      System.SysUtils,
      System.Classes,
      System.IOUtils,

      Vcl.Forms,
      Vcl.Dialogs
      ;

const
    // ReadLNK  RESULTS
    RL_RESULT_LNK_RESOLVE_CMDLINK     = 1;
    RL_RESULT_LNK_RESOLVE_DIRECTORY   = 0;
    RL_RESULT_LNK_RESOLVE_FAIL        = -1;




  type
    TUTF8EncodingNoBOM = class(TUTF8Encoding)
    public
      function GetPreamble: TBytes; override;
    end;

function MessageDlgCenter(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): Integer;
function ifthenbool(const ifTrue: Boolean; const thenBool, elseBool: Boolean): Boolean;
function ifthenint(const ifTrue: Boolean; const thenInt, elseInt: Integer): Integer;
function ifthenstr(const ifTrue: Boolean; const thenStr, elseStr: string): string;

function ConvertUnitSizeToByteSize(const &Unit, Size: integer): Int64;
function FormatByteSize(const bytes: int64): string;
function CalcRate(const before, after: Int64):Integer;
function DeletePartPath(Path: string; DelCount: Integer): string;

function LongPathName(const ShortPathName: string): string;
function GetSpecialFolderPath(CSIDLFolder: Integer): string;
function IsElevated: Boolean;
function GetFilePeBitDepth(const Filename: String): Integer;
function FileVersion(const FileName: TFileName): String;

function VarArrayLen(v: Variant): Integer;

// Конвертирует Относительный путь в абсолютный
// RelToAbs('c:\ya\foo', '..\kon\ki\') = c:\ya\kon\ki\
function RelativeToAbsolute(const BasePath, RelPath : string): string;

// работает как StrUtils.IndexText только Через Pos
function TextPosIndex(const Source: string; const Values: array of string): Integer;

// Раскрывает путь в котором есть переменные среды
// ExpandEnvironmentPath(%LOCALAPPDATA%\Google\Chrome\User Data) =  C:\USERS\user1\AppData\Local\Google\Chrome\User Data
// {.$DEFINE ExpandEnvironmentPath_v1}
function ExpandEnvironmentPath(const Path: string): string;

// Извлекает из строки значения по имени аргумента, значение может быть как в кавычках так и без
// ExtractCmdValue('c:\exe --something=lala -a --bb="1" --user-data-dir="Value"', '--user-data-dir=') = Value
// ExtractCmdValue('c:\exe --something=lala -a --bb="1" --user-data-dir=Value', '--user-data-dir=') = Value
function GetValueFromCMD(const CMD, Name: string): string;

// Читаем lnk файл и выдаёт результат
function ReadLNK(const FileName: string; var Target: string; var CMD: string): Integer;

function ReadProductName(const FileName: string): string;

function Adjpath(src: string): string;

implementation


function TUTF8EncodingNoBOM.GetPreamble: TBytes;
begin
  SetLength(Result, 0);
end;


function MessageDlgCenter(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): Integer;
//https://stackoverflow.com/questions/4618743/how-to-make-messagedlg-centered-on-owner-form
var R: TRect;
begin
  if not Assigned(Screen.ActiveForm) then
  begin
    Result := MessageDlg(Msg, DlgType, Buttons, 0);
  end else
  begin
    with CreateMessageDialog(Msg, DlgType, Buttons) do
    try
      GetWindowRect(Screen.ActiveForm.Handle, R);
      Left := R.Left + ((R.Right - R.Left) div 2) - (Width div 2);
      Top := R.Top + ((R.Bottom - R.Top) div 2) - (Height div 2);
      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;

function ifthenbool(const ifTrue: Boolean; const thenBool, elseBool: Boolean): Boolean;
begin
   if ifTrue then Result := thenBool else Result := elseBool;
end;

function ifthenint(const ifTrue: Boolean; const thenInt, elseInt: Integer): Integer;
begin
   if ifTrue then Result := thenInt else Result := elseInt;
end;

function ifthenstr(const ifTrue: Boolean; const thenStr, elseStr: string): string;
begin
  if ifTrue then Result := thenStr else Result := elseStr;
end;

function ConvertUnitSizeToByteSize(const &Unit, Size: integer): Int64;
begin
    // MinSize  "0" - any size
    case &Unit of
     0: result := Size;//  Byte
     1: result := Size*1024; // KB
     2: result := Size*1024*1024;// MB
     3: result := Size*1024*1024*1024;// GB
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


function CalcRate(const before, after: Int64) : Integer;
begin
   if before = 0 then exit(0);
   if after = 0 then exit(0);
   Result := Round( ( (before - after) / before ) * 100) ;
end;

function DeletePartPath(Path: string; DelCount: Integer): string;
begin
  Result := Copy(Path, DelCount+1, Length(Path)-DelCount);
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


function VarArrayLen(v: Variant): Integer;
// https://docwiki.embarcadero.com/CodeExamples/Sydney/en/VariantArrayLockUnlock_(Delphi)
begin
 // VarArrayLock(V);
 if not VarIsArray(V) then Exit(0);
 Result := VarArrayHighBound(V, 1) - VarArrayLowBound(V, 1) + 1;
 // VarArrayUnlock(V);
end;



function RelativeToAbsolute(const BasePath, RelPath : string): string;
begin
  SetLength(Result, MAX_PATH);
  if PathCombine(@Result[1], PChar(IncludeTrailingPathDelimiter(BasePath)), PChar(RelPath)) = nil then
    Result := ''
  else
    SetLength(Result, StrLen(Pchar(@Result[1])) );
end;

function TextPosIndex(const Source: string; const Values: array of string): Integer;
begin
  for Result := Low(Values) to High(Values) do
    if Pos( lowercase(Values[Result]),  lowercase(Source) ) > 0 then Exit;

  Result := -1;
end;

function ExpandEnvironmentPath(const Path: string): string;
{$IFDEF ExpandEnvironmentPath_v1 }
var
  bufsize: Integer;
begin
  bufsize := ExpandEnvironmentStrings(PChar(Path), nil, 0);
  SetLength(Result, bufsize);
  ExpandEnvironmentStrings(PChar(Path), PChar(Result), bufsize);
  Result := TrimRight(Result);
{$ELSE}
const
    MAXSIZE = 32768;
begin
  SetLength(Result, MAXSIZE);
  SetLength(Result, ExpandEnvironmentStrings(pchar(Path), @Result[1], length(Result)) - 1);
{$ENDIF}
end;

function GetValueFromCMD(const CMD, Name: string): string;
var nPos: integer;
begin
  nPos := Pos(Name, CMD);
  if nPos < 1 then Exit('');

  Result := Copy(CMD, nPos+Name.Length, CMD.Length-nPos+Name.Length);

  // Если значение в кавычках
  if Result[1] = '"' then
  begin
    nPos := PosEx('"', Result, 2);  if nPos < 1 then Exit('');
    Result := Copy(Result, 1, nPos+1);
    Result := Trim( AnsiDequotedStr(Result, '"') );
    Exit;
  end;

  if Pos(' -', Result) > 0 then
  begin
    nPos := PosEx(' -', Result, 2); if nPos < 1 then Exit('');
    Result := Trim(Copy(Result, 1, nPos-1));
    Exit;
  end;

  Result := Trim( Result );
end;

function ReadLNK(const FileName: string; var Target: string; var CMD: string): Integer;

  function IsInvalidLNKFile(const Path: string): Boolean;
  const
    Nullz : array[0..4] of byte = ($00, $00, $00, $00, $00);
  var
    hFile: THandle;
    Buffer: array[0..4] of byte;
    lpNumberOfBytesRead: DWORD;
  begin
    hFile:=CreateFile( PWideChar( Path ), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
    try
      if FileSeek(hFile, $17, soFromBeginning) = -1 then Exit(True);
      ReadFile(hFile, Buffer[0], 5, lpNumberOfBytesRead, nil);
      if not CompareMem(@Buffer[0],  @Nullz[0], 5 ) then Exit(False);

      if FileSeek(hFile, $27, soFromBeginning) = -1 then Exit(True);
      ReadFile(hFile, Buffer[0], 5, lpNumberOfBytesRead, nil);
      Result := CompareMem(@Buffer[0],  @Nullz[0], 5 );
    finally
     CloseHandle(hFile);
    end;
  end;

  function Succeeded(Res: HResult): Boolean;
  begin
    Result := Res and $80000000 = 0;
  end;

  function IzFile(FileName: string): Integer;
  begin
    try
      if TFileAttribute.faDirectory in TPath.GetAttributes(FileName)
      then Exit(0)   //Folder
      else Exit(1);  //File
    except
      Exit(-1);    //Err
    end;
  end;

var Link: TShellLink;
begin
   Target := '';  CMD := '';
   if IsInvalidLNKFile(FileName) then Exit(RL_RESULT_LNK_RESOLVE_FAIL);
   if not Succeeded( ShellLinkResolve(FileName, Link) ) then Exit(RL_RESULT_LNK_RESOLVE_FAIL) ;

   Target := Link.Target;  // путь до exe
   CMD := Link.Arguments;  // команда

   case IzFile( Target ) of
    0 :  Exit(RL_RESULT_LNK_RESOLVE_DIRECTORY);
    1 :  Exit(RL_RESULT_LNK_RESOLVE_CMDLINK);
   else
      Exit(RL_RESULT_LNK_RESOLVE_FAIL) ;
   end;
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

function Adjpath(src: string): string;
begin
 result := trim(  ExcludeTrailingPathDelimiter( trim(src) )  );
end;

end.
