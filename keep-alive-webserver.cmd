@ECHO OFF
SET cwd=%~dp0
SET process=nginx.exe
SET isrunning=0
tasklist 2>NUL | find /I /N "%process%" > NUL
IF %ERRORLEVEL% EQU 0 (
  SET isrunning=1
)

IF %isrunning% EQU 0 (
  CALL :startserver
)
EXIT /B 0

:startserver
START "Title-Dummy" "%cwd%\nginx-1.15.2\nginx.exe" -p "%cwd%\nginx-1.15.2"
EXIT /B 0