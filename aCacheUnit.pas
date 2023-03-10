unit aCacheUnit;

interface

 uses
      aConstUnit,
   //   SynCommons,
      mormot.core.json,
      mormot.core.base,
      mormot.core.data,

      System.SysUtils,
      System.Classes,
      System.IOUtils,
      System.Generics.Collections
      ;
type
   TCacheValidateResult = (cvrSQLiteNeedOptimization, cvrSQLiteNoNeedOptimization, cvrNonSQLite, cvrNoFile);

   TCacheRec = record
      PathName      : string;
      sqlfiles      : TArray<string>;
      sqlfilessz    : TArray<integer>; // Паралельный список размеров для sqlfiles

      nonsqlfiles   : TArray<string>;

      tmpFiles1     : TArray<integer>; // Отметки 1\0 (наличия\отсутствия) файлов по списку sqlfiles
      tmpFiles2     : TArray<integer>; // Отметки 1\0 (наличия\отсутствия) файлов по списку nonsqlfiles

      optimizations : Integer;
      lastoptdate   : TDateTime;

      Cancelled     : Boolean;

      // Вызывается перед процессингом
      // Данная процедура создаёт временные списки в которых будут отмечены в ходе процессинга найденные файлы кеша
      // Для последующего удаления не найденных, что бы кэш был чистым от пустых записей
      procedure BeginProc;

      // Вызывается в конце процессинга для очистки кеша от записей которые не были найденны
      procedure EndProc;

      procedure ClearTmpFilesCache;
      procedure SetProfileCancelled(const ClearCache: Boolean = False);

      // Добавляет файл без проверок
      // Также файл заносится в список tmpFiles1 или tmpFiles2
      procedure addfile(FileName: string; Size: Integer; IsSQL: Boolean);

      // Обновление файла с поиском его по имени
      // Также файл заносится в список tmpFiles1 или tmpFiles2
      procedure UpdateFileByName(FileName: string; Size: Integer; IsSQL: Boolean);

      // Обновление файла по индексу
      // Также файл заносится в список tmpFiles1 или tmpFiles2
      procedure UpdateFileByIndex(const FileName: string; const Size: Integer; const CacheFileIndex: Integer; const IsSQL: Boolean = True);

      // Проверка файла
      // TCacheValidateResult = (cvrSQLiteNeedOptimization, cvrSQLiteNoNeedOptimization, cvrNoSQLite, cvrNoFile);
      function validatefile(const FileName: string; const Size: Integer; const IgnoreSize: int64; var CacheFileIndex: Integer): TCacheValidateResult;

   end;

   TCacheRecArray = array of TCacheRec;

   TAPOCacheRecord = record
     CacheRecArray: TCacheRecArray;

     procedure DeleteProfile(const PathName : string);
     function  AddProfile(const PathName : string): Integer;
     procedure ChangeProfilePath(const oldPathName, newPathName : string);
     function  GetIndexByPathName(const PathName : string): Integer;
     procedure SaveCache(const FileName: string);
     procedure LoadCache(const FileName: string);
     procedure ClearCache;
   end;


implementation


procedure TCacheRec.BeginProc;
var i: integer;
begin
 tmpFiles1 := [];  // Для SQLFiles
 tmpFiles2 := [];  // Для NonSQLFiles

 SetLength(tmpFiles1, Length(sqlfiles) );
 SetLength(tmpFiles2, Length(nonsqlfiles) );

 for I := 0 to High(tmpFiles1) do
   tmpFiles1[i] := 0;        // 0 - файла нету  / 1 - Есть

 for I := 0 to High(tmpFiles2) do
   tmpFiles2[i] := 0;       // 0 - файла нету  / 1 - Есть
end;

procedure TCacheRec.EndProc;
var i: integer;
begin
 for I := High(tmpFiles1) downto 0 do
    if tmpFiles1[i] = 0 then
    begin
     // System.IOUtils.TFile.AppendAllText( 'Log.txt', ' Delete SQL: ' + sqlfiles[i] + #13#10 ) ;
     Delete(sqlfiles, i, 1);
     Delete(sqlfilessz, i, 1);
    end;

  for I := High(tmpFiles2) downto 0 do
    if tmpFiles2[i] = 0 then
    begin
    // System.IOUtils.TFile.AppendAllText( 'Log.txt', ' Delete NOSQL: ' + nonsqlfiles[i] + #13#10) ;
     Delete(nonsqlfiles, i, 1);

    end;
 tmpFiles1 := [];
 tmpFiles2 := [];
 Cancelled := False;
end;

procedure TCacheRec.ClearTmpFilesCache;
begin
 tmpFiles1 := [];
 tmpFiles2 := [];
end;

procedure TCacheRec.SetProfileCancelled(const ClearCache: Boolean = False);
begin
  Cancelled := True;

  if not ClearCache then Exit;
  SetLength(sqlfiles, Length(sqlfiles) );
  SetLength(sqlfilessz, Length(sqlfilessz) );
  SetLength(nonsqlfiles, Length(nonsqlfiles) );
  ClearTmpFilesCache;
end;

function TCacheRec.validatefile(const FileName: string; const Size: Integer; const IgnoreSize: int64; var CacheFileIndex: Integer): TCacheValidateResult;
var I:integer;
begin

  for I := 0 to High(sqlfiles) do                       // Проверяем файл в списке SQL
   if System.SysUtils.compareText(FileName, sqlfiles[i] ) = 0 then      // Если файл есть в списке SQL
    begin
      CacheFileIndex := i;                              // Индекс в списке SQL
      tmpFiles1[i]   := 1;                              // Отмечаем наличие файла в кэше
      if ( (Size - sqlfilessz[i]) > IgnoreSize  )       // сомтрим на сколько изменился размер
      then Exit(cvrSQLiteNeedOptimization)          // если размер изменился больше чем на IgnoreSize то cvrSQLiteNeedOptimization
      else Exit(cvrSQLiteNoNeedOptimization);       // иначе cvrSQLiteNoNeedOptimization
    end;

  for I := 0 to High(nonsqlfiles) do                    // Проверяем файл в списке NonSQL
   if System.SysUtils.compareText(FileName, nonsqlfiles[i] ) = 0 then   // Если файл есть в списке NonSQL
   begin
     CacheFileIndex := i;                               // Индекс в списке NonSQL
     tmpFiles2[i] := 1;                                 // Отмечаем наличие файла в кэше
     Exit(cvrNonSQLite);                                 // Результат cvrNoSQLite
   end;

  CacheFileIndex := -1;
  Result := cvrNoFile;                                  // Если файла нету ни в SQL ни в NonSQL
end;

procedure TCacheRec.UpdateFileByIndex(const FileName: string; const Size: Integer; const CacheFileIndex: Integer; const IsSQL: Boolean = True);
begin
  if IsSQL then
  begin
    sqlfiles[CacheFileIndex]   := FileName;
    sqlfilessz[CacheFileIndex] := Size;
    tmpFiles1[CacheFileIndex]  := 1;
    exit;
  end;

  Delete(sqlfiles,   CacheFileIndex, 1);     // Удаляем из sqlfiles
  Delete(sqlfilessz, CacheFileIndex, 1);     // Удаляем из sqlfilessz
  Delete(tmpFiles1,  CacheFileIndex, 1);     // Удаляем из списка tmpFiles1

  nonsqlfiles := nonsqlfiles + [FileName];    // добавляем  в список nonsqlfiles
  tmpFiles2   := tmpFiles2 + [1];             // Отмечаем наличие файла в кэше nonsqlfiles
end;

procedure TCacheRec.UpdateFileByName(FileName: string; Size: Integer; IsSQL: Boolean);
// Добавляем файл в кэш с проверками
var I: integer;
begin
  if IsSQL then
  begin
     for I := 0 to High(sqlfiles) do                     // Ищем файл в списке sqlfiles
        if System.SysUtils.compareText(FileName, sqlfiles[i] ) = 0 then  // Если файл есть в списке sqlfiles
        begin
          sqlfilessz[i] := Size;                         // Обновляем размер файла
          tmpFiles1[i]  := 1;
          Exit;                                          // Выходим
        end;

                                                        // Если фала нету в списке sqlfiles то
     sqlfiles   := sqlfiles + [FileName];               // Добавляем его в список sqlfiles
     sqlfilessz := sqlfilessz + [Size];                 // Добавляем его размер в список sqlfilessz
     tmpFiles1  := tmpFiles1 + [1];                     // Отмечаем наличие файла в кэше sqlfiles

     for I := 0 to High(nonsqlfiles) do                 // Чистим список nonsqlfiles если файл мог быть ранее там
     if System.SysUtils.compareText(FileName, nonsqlfiles[i] ) = 0 then // Ищем файл в списке nonsqlfiles
     begin                                              // Если файл есть в списке nonsqlfiles
       Delete(nonsqlfiles, i, 1);                       // Удаляем файл
       Delete(tmpFiles2, i, 1);                         // Удаляем из списка tmpFiles2
       Exit;                                            // Выходим
     end;

    Exit;                                               // Выход
  end;

  for I := 0 to High(nonsqlfiles) do                    // Ищем файл в списке nonsqlfiles
    if System.SysUtils.compareText(FileName, nonsqlfiles[i] ) = 0 then  // Если файл есть в списке nonsqlfiles
     begin
        tmpFiles2[i] := 1;
        Exit;                                           // то делать больше нечего, Выходим
     end;

  nonsqlfiles := nonsqlfiles + [FileName];              // Если файл нету в списке nonsqlfiles то добавляем его
  tmpFiles2  := tmpFiles2 + [1];                        // Отмечаем наличие файла в кэше nonsqlfiles

  for I := 0 to High(sqlfiles) do                       // Чистим список sqlfiles и sqlfilessz
  if System.SysUtils.compareText(FileName, sqlfiles[i] ) = 0 then       // Ищем файл в списке sqlfiles, если находим то
  begin
    Delete(sqlfiles,   i, 1);                           // Удаляем из sqlfiles
    Delete(sqlfilessz, i, 1);                           // Удаляем из sqlfilessz
    Delete(tmpFiles1,  i, 1);                           // Удаляем из списка tmpFiles1
    Exit;                                               // Выход
  end;
end;

procedure TCacheRec.addfile(FileName: string; Size: Integer; IsSQL: Boolean );
// Добавляем файл в кэш без проверок
begin
  if IsSQL then
  begin
   sqlfiles := sqlfiles + [FileName];
   sqlfilessz := sqlfilessz + [Size];
  // tmpFiles1 := tmpFiles1 + [1];      // Отмечаем наличие файла в кэше
  end
  else
  begin
    nonsqlfiles := nonsqlfiles + [FileName];
   // tmpFiles2 := tmpFiles2 + [1];    // Отмечаем наличие файла в кэше
  end;
end;








         (*
procedure TAPOCacheRecord.SaveCache(const FileName: string);
var
  CacheData: TDynArray;
  fsStream: TFileStream;
begin
  CacheData.Init(TypeInfo(TCacheRecArray), Self.CacheRecArray );
  fsStream := TFileStream.Create(FileName, fmCreate or fmOpenWrite or fmShareDenyNone);
  try
    CacheData.SaveToStream( fsStream );
   { var R: RawUTF8;
    CacheData.SaveToJSON(R);
     System.IOUtils.TFile.WriteAllText( 'Cache.JSON', R, TEncoding.UTF8 ); }
  finally
   fsStream.Free;
  end;
end;

procedure TAPOCacheRecord.LoadCache(const FileName: string);
var
  CacheData: TDynArray;
  Stream: TMemoryStream;
  fsStream: TFileStream;
begin
  CacheData.Init(TypeInfo(TCacheRecArray), Self.CacheRecArray);
  CacheData.Clear;

  if not FileExists(FileName) then Exit;

  fsStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  Stream := TMemoryStream.Create;
  try
    fsStream.Position := 0;
    Stream.SetSize(fsStream.Size);
    fsStream.ReadBuffer(Stream.Memory^, fsStream.Size);
    Stream.Position := 0;
    CacheData.LoadFromStream(Stream);
  finally
    Stream.Free;
    fsStream.Free;
  end;
end;      *)


procedure TAPOCacheRecord.SaveCache(const FileName: string);//SaveToJSONFile(const FileName: string; const WriteBOM : boolean = false);
var
  fsStream: TFileStream;
  R: RawUTF8;
  Buff: TBytes;
begin
  fsStream := TFileStream.Create(FileName, fmCreate or fmOpenWrite or fmShareDenyNone);
  try
   { if WriteBOM then
    begin
      Buff := TEncoding.UTF8.GetPreamble;
      fsStream.WriteBuffer(Buff, Length(Buff));
    end;  }
    R := RecordSaveJSON(Self, TypeInfo(TAPOCacheRecord) );
    Buff := TEncoding.UTF8.GetBytes(R);
    fsStream.WriteBuffer(Buff, Length(Buff));
  finally
   fsStream.Free;
  end;
end;

procedure TAPOCacheRecord.LoadCache(const FileName: string);
var
  fsStream: TFileStream;
  Buff: TBytes;
  Encoding: TEncoding;
  BOMLength: Integer;
  R: RawUTF8;
  I: Integer;
begin
  if not FileExists(FileName) then Exit;//(False);
  fsStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    SetLength(Buff, fsStream.Size);
    fsStream.Position := 0;
    fsStream.ReadBuffer(Buff, Length(Buff));
    Encoding := nil;
    BOMLength := TEncoding.GetBufferEncoding(Buff, Encoding);
    R := Encoding.GetString(Buff, BOMLength, Length(Buff) - BOMLength);
    RecordLoadJSON(Self, R, TypeInfo(TAPOCacheRecord));
  finally
    fsStream.Free;
  end;



end;















procedure TAPOCacheRecord.ClearCache;
var
  CacheData: TDynArray;
begin
  CacheData.Init(TypeInfo(TCacheRecArray), Self.CacheRecArray);
  CacheData.Clear;
end;


function TAPOCacheRecord.GetIndexByPathName(const PathName : string): Integer;
begin
  if Length(CacheRecArray) = 0 then Exit(-1);

  for var I: integer := 0 to Length(CacheRecArray)-1 do
   if System.SysUtils.CompareText(PathName, CacheRecArray[i].PathName ) = 0 then
    Exit(i);

  Result := -1;
end;

function TAPOCacheRecord.AddProfile(const PathName : string): Integer;
begin
   Result := GetIndexByPathName(PathName);

   if Result = -1 then
   begin
     SetLength(CacheRecArray, Length(CacheRecArray)+1);
     Result := High(CacheRecArray);
     CacheRecArray[Result].optimizations  := 0;
     CacheRecArray[Result].lastoptdate    := 0;
     CacheRecArray[Result].Cancelled      := False;
   end;

   CacheRecArray[Result].PathName       := PathName;
 //  CacheRecArray[Result].enabled        := E;
end;

procedure TAPOCacheRecord.DeleteProfile(const PathName : string);
var R: Integer;
begin
  R := GetIndexByPathName(PathName);
  if R = -1 then Exit;

  Delete(CacheRecArray, R, 1);
end;

procedure TAPOCacheRecord.ChangeProfilePath(const oldPathName, newPathName : string);
var R, i: Integer;
begin
  R := GetIndexByPathName(oldPathName);
  if R = -1 then Exit;

  CacheRecArray[R].PathName := newPathName;

  for i := 0 to High(CacheRecArray[R].sqlfiles) do
    StringReplace(CacheRecArray[R].sqlfiles[i],
                  oldPathName,
                  newPathName,
                  [rfIgnoreCase]
                 );


  for i := 0 to High(CacheRecArray[R].nonsqlfiles) do
    StringReplace(CacheRecArray[R].nonsqlfiles[i],
                  oldPathName,
                  newPathName,
                  [rfIgnoreCase]
                 );

end;

end.
