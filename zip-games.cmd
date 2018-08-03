@ECHO OFF
SET cwd=%~dp0
SET readin=%1
SET sevenzip="%cwd%7za.exe"
SET filesonlyflag=F
FOR /F "usebackq eol=; tokens=1,2,3 delims=|" %%a IN (%readin%) DO (
  CALL :givenline "%%a" "%%b" %%c
)
EXIT /B 0

:givenline
SET type=%3
IF %type%==%filesonlyflag% (
  CALL :zipnonrecursive %1 %2
) ELSE (
  CALL :ziprecursive %1 %2
)
EXIT /B 0

:zipnonrecursive
SET systemlocation=%~1
SET output=%2
SET dircall="dir ""%systemlocation%"" /AA /B"
FOR /F %%a IN ('%dircall%') DO (
  CALL :ziprecursive "%systemlocation%\%%a" %output%
)
EXIT /B 0

:ziprecursive
SET systemlocation=%1
SET output=%2
CALL %sevenzip% a -y -ur2y2 %output% %systemlocation%
EXIT /B 0