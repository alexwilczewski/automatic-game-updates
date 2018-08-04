@ECHO OFF
SET steamcmdconf=%1
SET scriptdir=%~2
SET /p steamcmd=<%steamcmdconf%
FOR %%a IN ("%scriptdir%\*.script") DO (
  CALL "%steamcmd%" +runscript "%%a"
)