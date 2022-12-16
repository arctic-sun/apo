unit BatScriptUnt;

interface

 uses   Winapi.Windows,
        Winapi.Messages,

        System.SysUtils,
        System.Types
        ;

procedure StaticBatchBegin1(const ProfilesCount: string; var BatTxt: TArray<string>);
procedure StaticBatchAddProfile1(const ProfilePath: string; const ProfileName: string; const ProfileNo : Integer; const isFF: Boolean;  var BatTxt: TArray<string>);
procedure StaticBatchEnd1(var BatTxt: TArray<string>);


implementation



function SplaceBorder(BorderLen:integer; Text:string; Terminator: string): string;
begin
  Result := Text;
  var  Count : Integer :=  BorderLen - Text.Length;
  while Count > 0 do
  begin
   Result := Result + ' ';
   Dec(Count);
  end;
  Result := Result + Terminator;
end;

function formatBatchFilePath(const instr: string): string;
begin
  var c: char;
  for C in instr do
   if C = '%' then
     Result := Result + '%%' else Result := Result + C;
end;


procedure StaticBatchBegin1(const ProfilesCount: string; var BatTxt: TArray<string>);
begin
  BatTxt := BatTxt + ['@set @x=0 /*'];
  BatTxt := BatTxt + ['@echo off'];
  BatTxt := BatTxt + ['::            بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِيمِ‎ '];
  BatTxt := BatTxt + ['::        إِنَّا لِلَّٰهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ '];
  BatTxt := BatTxt + ['color 0B'];
  BatTxt := BatTxt + ['chcp 65001'];
  BatTxt := BatTxt + ['Title “SQLite3 Batch VACUUM Script v1”'];
  BatTxt := BatTxt + ['cls'];
  BatTxt := BatTxt + ['ECHO :::::::::::::::::::::::::::::::::::::::'];
  BatTxt := BatTxt + ['ECHO           Generated with APO           '];
  BatTxt := BatTxt + ['ECHO :::::::::::::::::::::::::::::::::::::::'];
  BatTxt := BatTxt + ['echo.'];

  //:: Settings
  BatTxt := BatTxt + ['set OK=Optimized │'];
  BatTxt := BatTxt + ['set NO=Skipped   │'];
  BatTxt := BatTxt + ['set sqlite3="%~dp0sqlite3.exe"'];
  BatTxt := BatTxt + ['set /a cfgTotalProfilesCount='+ProfilesCount];
  BatTxt := BatTxt + ['set /a sizebefore=0'];
  BatTxt := BatTxt + ['set /a sizeafter=0'];
  BatTxt := BatTxt + ['set /a ttlpok=0'];  //total profiles ok
  BatTxt := BatTxt + ['set /a ttlszbf=0']; //total size before
  BatTxt := BatTxt + ['set /a ttlszaf=0']; //total size after
  BatTxt := BatTxt + ['set /a ttlfsop=0']; //total optimized files
  BatTxt := BatTxt + ['set /a ttlfssd=0']; //total skipped files

  BatTxt := BatTxt + ['set /a pszbf=0'];  //profile size before
  BatTxt := BatTxt + ['set /a pszaf=0'];  //profile size after
  BatTxt := BatTxt + ['set /a pfsop=0'];  //profile optimized files
  BatTxt := BatTxt + ['set /a pfssd=0'];  //profile skipped files
  BatTxt := BatTxt + ['if NOT exist %sqlite3% ('];
  BatTxt := BatTxt + ['echo Error: File %sqlite3% not found'];
  BatTxt := BatTxt + ['GoTo :Eof )'];
  BatTxt := BatTxt + ['for /F "tokens=1-4 delims=:.," %%a in ("%time%") do ('];
  BatTxt := BatTxt + ['   set /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"'];
  BatTxt := BatTxt + [')'];
  BatTxt := BatTxt + ['ECHO ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ BEGIN ► ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒'];
  BatTxt := BatTxt + ['echo.'];
end;


procedure StaticBatchAddProfile1(const ProfilePath: string; // must be -> ExcludeTrailingpathDelimiter(ProfilePath)
                                 const ProfileName: string;
                                 const ProfileNo : Integer;
                                 const isFF: Boolean;
                                 var   BatTxt: TArray<string>);
begin
  //:: PROFILE No BEGIN
  BatTxt := BatTxt + ['set "profilepath=' + formatBatchFilePath(ExcludeTrailingPathDelimiter(ProfilePath)) + '"'];
  BatTxt := BatTxt + ['echo.'];
  BatTxt := BatTxt + ['echo ╔═════════════════════════════════════╗'];
  BatTxt := BatTxt + [SplaceBorder(43, 'echo ║ PROFILE #'+ ProfileNo.ToString + ' ' + ProfileName, '║')];
  BatTxt := BatTxt + ['echo ╚═════════════════════════════════════╝'];
  BatTxt := BatTxt + ['echo  path: "%profilepath%"'];
  BatTxt := BatTxt + ['if NOT exist "%profilepath%" ('];
  BatTxt := BatTxt + ['echo  Error: Profile path not found!'];
  BatTxt := BatTxt + ['echo.'];
  BatTxt := BatTxt + ['goto :procprofile'+IntToStr(ProfileNo+1)];
  BatTxt := BatTxt + [')'];
  BatTxt := BatTxt + ['if exist %TEMP%\APO.TXT del %TEMP%\APO.TXT'];
  BatTxt := BatTxt + [''];
  BatTxt := BatTxt + ['Pushd "%profilepath%" && ('];


  if not isFF then  // not FireFox
  BatTxt := BatTxt + ['FOR /R %%X IN ( * ) DO (ECHO %%X)>>%TEMP%\APO.TXT']
  else // Firefox (skipping *.sqlite-wal *.sqlite-shm)
  BatTxt := BatTxt + ['FOR /R %%X IN ( "*.sqlite", "*.db" ) DO (ECHO %%X)>>%TEMP%\APO.TXT'];

  BatTxt := BatTxt + ['Popd'];
  BatTxt := BatTxt + [')'];

  BatTxt := BatTxt + ['CALL :ResetProfileCounters'];
  BatTxt := BatTxt + ['CALL :ProcProfile'];
  BatTxt := BatTxt + ['CALL :UpdateTotalCounters'];
  BatTxt := BatTxt + ['CALL :DrawProfileScores '+ ProfileNo.ToString];
  //:: PROFILE No END
  BatTxt := BatTxt + [':procprofile'+IntToStr(ProfileNo+1)];
end;


procedure StaticBatchEnd1(var BatTxt: TArray<string>);
begin
  //rem Get end time:
  BatTxt := BatTxt + ['for /F "tokens=1-4 delims=:.," %%a in ("%time%") do ('];
  BatTxt := BatTxt + ['set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"'];
  BatTxt := BatTxt + [')'];
  //rem Get elapsed time:
  BatTxt := BatTxt + [''];
  BatTxt := BatTxt + ['set /A elapsed=end-start'];
  //rem Show elapsed time:
  BatTxt := BatTxt + [''];
  BatTxt := BatTxt + ['set /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100'];
  BatTxt := BatTxt + ['if %mm% lss 10 set mm=0%mm%'];
  BatTxt := BatTxt + ['if %ss% lss 10 set ss=0%ss%'];
  BatTxt := BatTxt + ['if %cc% lss 10 set cc=0%cc%'];
  BatTxt := BatTxt + [''];

  BatTxt := BatTxt + ['if exist %TEMP%\APO.TXT del %TEMP%\APO.TXT'];
  BatTxt := BatTxt + ['echo.'];
  BatTxt := BatTxt + ['ECHO ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ END ■ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒'];
  BatTxt := BatTxt + ['echo.'];
  BatTxt := BatTxt + ['ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'];
  BatTxt := BatTxt + ['ECHO ~~~~~~~~~~~~ OVERALL SCORE ~~~~~~~~~~~~'];
  BatTxt := BatTxt + ['ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'];
  BatTxt := BatTxt + ['ECHO  Time      : %hh%:%mm%:%ss%,%cc%'];
  BatTxt := BatTxt + ['ECHO  Profiles  : %ttlpok% of %cfgTotalProfilesCount%'];
  BatTxt := BatTxt + ['set /a ttlszbf=ttlszbf/1024/1024'];
  BatTxt := BatTxt + ['echo  Before    : %ttlszbf% MB'];
  BatTxt := BatTxt + ['set /a ttlszaf=ttlszaf/1024/1024'];
  BatTxt := BatTxt + ['echo  After     : %ttlszaf% MB'];
  BatTxt := BatTxt + ['echo  Optimized : %ttlfsop% file(s)'];
  BatTxt := BatTxt + ['echo  Skipped   : %ttlfssd% file(s)'];
  BatTxt := BatTxt + ['ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'];
  BatTxt := BatTxt + [''];
  BatTxt := BatTxt + ['pause'];
  BatTxt := BatTxt + ['GOTO END'];
  BatTxt := BatTxt + [''];
  //ProcProfile
  BatTxt := BatTxt + [':ProcProfile'];
  BatTxt := BatTxt + ['CALL :DrawHeader'];
  BatTxt := BatTxt + ['if not exist %TEMP%\APO.TXT (echo            │ Profile directory is empty & goto :eof)'];
  BatTxt := BatTxt + ['for /f "tokens=*" %%a in (%TEMP%\APO.TXT) do ('];
  BatTxt := BatTxt + ['	set Filename="%%a"'];
  BatTxt := BatTxt + ['	CALL :ProcFile %%Filename%%'];
  BatTxt := BatTxt + [')'];
  BatTxt := BatTxt + ['EXIT /B 0'];
  BatTxt := BatTxt + [''];

  //ProcFile
  BatTxt := BatTxt + [':ProcFile'];
  BatTxt := BatTxt + ['cscript //nologo /e:jscript "%~f0" "%~1"'];
  BatTxt := BatTxt + ['if %ERRORLEVEL%==1 (set /A pfsid=pfsid+1 & goto :eof)'];
  BatTxt := BatTxt + ['for %%a in (%1) do set onlifilename=%%~nxa'];
  BatTxt := BatTxt + ['set /a sizebefore=%~z1'];
  BatTxt := BatTxt + ['set "tempof=%~1"'];
  BatTxt := BatTxt + ['%sqlite3% "%tempof%" VACUUM;'];  //  BatTxt := BatTxt + ['%sqlite3% "%~1" VACUUM;'];
  BatTxt := BatTxt + ['set /a sizeafter=%~z1'];
  BatTxt := BatTxt + ['if /I "%sizebefore%" EQU "%sizeafter%" ( set /A pfssd=pfssd+1 & Echo  %NO% %onlifilename%) else (set /A pfsop=pfsop+1 & echo  %OK% %onlifilename% )'];
  BatTxt := BatTxt + ['set /A pszbf=pszbf+sizebefore'];
  BatTxt := BatTxt + ['set /A pszaf=pszaf+sizeafter'];
  BatTxt := BatTxt + ['EXIT /B 0'];
  BatTxt := BatTxt + [''];

  BatTxt := BatTxt + [':DrawHeader'];
  BatTxt := BatTxt + ['echo ┌──────────┬──────────────────────────┐'];
  BatTxt := BatTxt + ['echo │ RESULT   │ FILENAME                 │'];
  BatTxt := BatTxt + ['echo └──────────┼──────────────────────────┘'];
  BatTxt := BatTxt + ['exit /B 0'];
  BatTxt := BatTxt + [''];

  BatTxt := BatTxt + [':DrawProfileScores'];
  BatTxt := BatTxt + ['set /A profileNo=%1'];
  BatTxt := BatTxt + ['if %profileNo% LEQ 9 ( set EndStr=" SCORE                    │" ) else ( set EndStr=" SCORE                   │" )'];
  BatTxt := BatTxt + ['if %profileNo% GTR 99 ( set EndStr=" SCORE                  │" )'];
  BatTxt := BatTxt + ['set EndStr=%EndStr:"=%'];
  BatTxt := BatTxt + ['echo ┌──────────┴──────────────────────────┐'];
  BatTxt := BatTxt + ['echo │ PROFILE #%1%EndStr%'];
  BatTxt := BatTxt + ['echo └─────────────────────────────────────┘'];
  BatTxt := BatTxt + ['set /a chja=pfssd+pfsop'];
  BatTxt := BatTxt + ['if %chja% EQU 0 ( echo  SQLite3 files not found & goto :eof )'];
  BatTxt := BatTxt + ['if pfsop+pfssd==0 ( echo Profile is empty & goto :eof )'];
  BatTxt := BatTxt + ['set /a pszbf=pszbf/1024/1024'];
  BatTxt := BatTxt + ['echo  Before    : %pszbf% MB'];
  BatTxt := BatTxt + ['set /a pszaf=pszaf/1024/1024'];
  BatTxt := BatTxt + ['echo  After     : %pszaf% MB'];
  BatTxt := BatTxt + ['echo  Optimized : %pfsop% file(s)'];
  BatTxt := BatTxt + ['echo  Skipped   : %pfssd% file(s)'];
  BatTxt := BatTxt + ['echo.'];
  BatTxt := BatTxt + ['exit /b 0'];
  BatTxt := BatTxt + [''];

  BatTxt := BatTxt + [':ResetProfileCounters'];
  BatTxt := BatTxt + ['set /a pszbf=0'];
  BatTxt := BatTxt + ['set /a pszaf=0'];
  BatTxt := BatTxt + ['set /a pfsop=0'];
  BatTxt := BatTxt + ['set /a pfssd=0'];
  BatTxt := BatTxt + ['exit /b 0'];
  BatTxt := BatTxt + [''];

  BatTxt := BatTxt + [':UpdateTotalCounters'];
  BatTxt := BatTxt + ['set /a ttlpok=ttlpok+1'];
  BatTxt := BatTxt + ['set /a ttlszbf=ttlszbf+pszbf'];
  BatTxt := BatTxt + ['set /a ttlszaf=ttlszaf+pszaf'];
  BatTxt := BatTxt + ['set /a ttlfsop=ttlfsop+pfsop'];
  BatTxt := BatTxt + ['set /a ttlfssd=ttlfssd+pfssd'];
  BatTxt := BatTxt + ['exit /b 0'];
  BatTxt := BatTxt + [''];
  BatTxt := BatTxt + [''];
  BatTxt := BatTxt + ['*/'];
  BatTxt := BatTxt + ['var ForReading = 1, SQLiteMark = "SQLite format 3";'];
  BatTxt := BatTxt + ['var Args, FSO, FName, F, S, E;'];
  BatTxt := BatTxt + ['Args = WScript.Arguments;'];
  BatTxt := BatTxt + ['FSO = new ActiveXObject("Scripting.FileSystemObject");'];
  BatTxt := BatTxt + ['FName = Args(0).replace(/\\/g, "\\\\");'];
  BatTxt := BatTxt + ['F = FSO.OpenTextFile(FName, ForReading);'];
  BatTxt := BatTxt + ['try { S = F.Read(SQLiteMark.length); }'];
  BatTxt := BatTxt + ['catch (E) {}'];
  BatTxt := BatTxt + ['F.Close();'];
  BatTxt := BatTxt + ['if (S != SQLiteMark) WScript.Quit(1); else WScript.Quit(0);'];
end;





end.
