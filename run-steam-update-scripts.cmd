@ECHO OFF
SET cwd=%~dp0
SET scriptdir=%~1
FOR %%a IN ("%scriptdir%\*.script") DO (
  CALL "%cwd%\steamcmd\steamcmd.exe" +runscript "%%a"
)