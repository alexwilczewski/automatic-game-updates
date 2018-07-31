@ECHO OFF
SET readin=%1
SET outdir=%~2
SET loginprefix=:
SET gameprefix=-
SET isbuildingconf=0
SET currentconffile=
FOR /F "eol=; tokens=1,2* delims= " %%a IN (%readin%) DO (
  IF %%a==%loginprefix% (
	CALL :givenlogin %%b %%c
  )
  IF %%a==%gameprefix% (
    CALL :givengame %%b "%%c"
  )
)
IF %isbuildingconf% EQU 1 (
  CALL :closeconf
)
EXIT /B 0

:givenlogin
SET login=%1
SET password=%2
IF %isbuildingconf% EQU 1 (
  CALL :closeconf
)
CALL :setnewfile %login%
CALL :startconf
CALL :addlogin %login% %password%
EXIT /B 0

:closeconf
ECHO quit >> %currentfile%
EXIT /B 0

:setnewfile
SET currentfile="%outdir%\%1.script"
EXIT /B 0

:startconf
SET isbuildingconf=1
ECHO @ShutdownOnFailedCommand 0 > %currentfile%
ECHO @NoPromptForPassword 1 >> %currentfile%
EXIT /B 0

:addlogin
SET login=%1
SET password=%2
ECHO login %login% %password% >> %currentfile%
EXIT /B 0

:givengame
SET gcode=%1
SET gname=%~2
ECHO app_update %gcode% validate >> %currentfile%
ECHO %gcode% -- %gname%
EXIT /B 0