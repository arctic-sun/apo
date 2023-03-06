unit aSettingsUnit;

interface

    uses
      aConstUnit,
      aCacheUnit,
      aUtilsUnit,

      mormot.core.json,
      mormot.core.base,
      mormot.core.data,

     // SynCommons,

      System.Variants,
      System.SysUtils,
      System.Classes,
      System.IOUtils
      ;

type

  TNV = record
    name  : string;
    value : variant;
  end;

  TAPOProfile = record
    // Персональные настройки профиля
    p_optimizationenabled : boolean; // Разрешить оптимизацию (оно же чекбокс)
    p_pathid              : string;  // ID профиля (путь)
    p_appid               : integer; // ID приложения
    p_user_visible        : boolean; // Видимость заданная пользователем
    p_from_search         : boolean; // Определяет является ли профиль найденным
    // Резерв
    p_application_path : string;      // Reserv
    p_nva              : TArray<TNV>; // Reserv
  end;

  TAPOCheckRunningInstance = record
    i_name    : string;
    i_type    : integer;   // FileName, Window Caption
    i_enabled : boolean;
    i_nva     : TArray<TNV>; // Reserv
  end;

  TAPOVSTHeader = record
    width : integer;
    pos   : integer;
  end;

  TAPOSettings = record
    g_profiles : TArray<TAPOProfile>;
    g_header   : TArray<TAPOVSTHeader>;
    g_nva      : TArray<TNV>;  // global name value array
    g_cri      : TArray<TAPOCheckRunningInstance>;

    function  GetProfileIndex(const path: string): Integer;
    function  AddProfile(const v: variant): Integer;
    procedure DeleteProfile(const path: string);   overload;
    procedure DeleteProfile(const index: integer); overload;

    procedure SaveToJSONFile(const FileName: string; const WriteBOM : boolean = false);
    function  LoadFromJSONFile(const FileName: string): Boolean;
  end;

  TAPOTranslationLang = record
    LangName : string;
    g_nva    : TArray<TNV>;
  end;

  TAPOTranslation = record
    Lang : TArray<TAPOTranslationLang>;
    procedure SaveToJSONFile(const FileName: string; const WriteBOM : boolean = false);
    function  LoadFromJSONFile(const FileName: string): Boolean;
  end;

const
  v_index_path                          = 0;  // ID профиля (путь)
  v_index_appid                         = 1;  // ID приложения
  v_index_optimizationenabled           = 2;  // Разрешить оптимизацию (оно же чекбокс)
  v_index_fromsearch                    = 3;  // Определяет является ли профиль найденным


implementation

function TAPOSettings.GetProfileIndex(const path: string): Integer;
begin
 for Result := 0 to High(g_profiles) do
  if CompareText(g_profiles[Result].p_pathid, path) = 0 then Exit;
  Result := -1;
end;

function TAPOSettings.AddProfile(const v: variant): Integer;
var
   pix: integer;
 //  vaLen: Integer;
   s_path : string ;
begin
 // vaLen := VarArrayLen(v);
 // if vaLen < 3 then Exit;

  s_path := VarArrayGet(V, [ v_index_path ]);

  pix := GetProfileIndex( s_path );
  if Pix = -1 then
  begin
    SetLength( g_profiles, Length(g_profiles)+1 );
    pix := High(g_profiles);
    g_profiles[pix].p_pathid              := s_path;
    g_profiles[pix].p_appid               := VarArrayGet(V, [ v_index_appid  ]);
    g_profiles[pix].p_optimizationenabled := VarArrayGet(V, [ v_index_optimizationenabled ]);
    g_profiles[pix].p_from_search         := VarArrayGet(V, [ v_index_fromsearch          ]);
    g_profiles[pix].p_user_visible        := True;

    Exit(Pix);
  end;
  Exit(-1);

end;

procedure TAPOSettings.DeleteProfile(const path: string);
var pri: integer;
begin
  pri:= GetProfileIndex(path);
  Delete(g_profiles, pri, 1);
end;

procedure TAPOSettings.DeleteProfile(const index: integer);
begin
  Delete(g_profiles, index, 1);
end;


procedure TAPOSettings.SaveToJSONFile(const FileName: string; const WriteBOM : boolean = false);
var
  fsStream: TFileStream;
  R: RawUTF8;
  Buff: TBytes;
begin
  fsStream := TFileStream.Create(FileName, fmCreate or fmOpenWrite or fmShareDenyNone);
  try
    if WriteBOM then
    begin
      Buff := TEncoding.UTF8.GetPreamble;
      fsStream.WriteBuffer(Buff, Length(Buff));
    end;
    R := RecordSaveJSON(Self, TypeInfo(TAPOSettings) );
    Buff := TEncoding.UTF8.GetBytes(R);
    fsStream.WriteBuffer(Buff, Length(Buff));
  finally
   fsStream.Free;
  end;
end;

function TAPOSettings.LoadFromJSONFile(const FileName: string): Boolean;
var
  fsStream: TFileStream;
  Buff: TBytes;
  Encoding: TEncoding;
  BOMLength: Integer;
  R: RawUTF8;
  I: Integer;
begin
  if not FileExists(FileName) then Exit(False);
  fsStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    SetLength(Buff, fsStream.Size);
    fsStream.Position := 0;
    fsStream.ReadBuffer(Buff, Length(Buff));
    Encoding := nil;
    BOMLength := TEncoding.GetBufferEncoding(Buff, Encoding);
    R := Encoding.GetString(Buff, BOMLength, Length(Buff) - BOMLength);
    Result := RecordLoadJSON(Self, R, TypeInfo(TAPOSettings));
  finally
    fsStream.Free;
  end;

  // Защита от юзера который будет править JSON
  for I := 0 to High(g_profiles) do
   g_profiles[i].p_pathid := Adjpath( g_profiles[i].p_pathid );

end;



procedure TAPOTranslation.SaveToJSONFile(const FileName: string; const WriteBOM : boolean = false);
var
  fsStream: TFileStream;
  R: RawUTF8;
  Buff: TBytes;
begin
  fsStream := TFileStream.Create(FileName, fmCreate or fmOpenWrite or fmShareDenyNone);
  try
    if WriteBOM then
    begin
      Buff := TEncoding.UTF8.GetPreamble;
      fsStream.WriteBuffer(Buff, Length(Buff));
    end;
    R := RecordSaveJSON(Self, TypeInfo(TAPOTranslation) );
    Buff := TEncoding.UTF8.GetBytes(R);
    fsStream.WriteBuffer(Buff, Length(Buff));
  finally
   fsStream.Free;
  end;
end;

function TAPOTranslation.LoadFromJSONFile(const FileName: string): Boolean;
var
  fsStream: TFileStream;
  Buff: TBytes;
  Encoding: TEncoding;
  BOMLength: Integer;
  R: RawUTF8;
  I: Integer;
begin
  if not FileExists(FileName) then Exit(False);
  fsStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    SetLength(Buff, fsStream.Size);
    fsStream.Position := 0;
    fsStream.ReadBuffer(Buff, Length(Buff));
    Encoding := nil;
    BOMLength := TEncoding.GetBufferEncoding(Buff, Encoding);
    R := Encoding.GetString(Buff, BOMLength, Length(Buff) - BOMLength);
    Result := RecordLoadJSON(Self, R, TypeInfo(TAPOTranslation));
  finally
    fsStream.Free;
  end;

end;



end.
