@ECHO OFF
SET serverconf=%1
SET scriptdir=%~2
CALL %serverconf%
SET steamcmd="%SteamCmdDir%\steamcmd.exe"
FOR %%a IN ("%scriptdir%\*.script") DO (
  CALL %steamcmd% +runscript "%%a"
)
EXIT /B 0