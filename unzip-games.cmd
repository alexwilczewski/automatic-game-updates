@ECHO OFF
SET cwd=%~dp0
SET readin=%1
SET sevenzip="%cwd%7za.exe"
SET usezipprefix="<"
SET pullprefix=">"
SET usezip=
FOR /F "eol=; tokens=1,2,3* delims=|" %%a IN (%readin%) DO (
  IF "%%a"==%usezipprefix% (
    CALL :givenusezip "%%b"
  )
  IF "%%a"==%pullprefix% (
    CALL :givenpull "%%b" "%%c"
  )
)
EXIT /B 0

:givenusezip
SET usezip=%1
EXIT /B 0

:givenpull
SET from=%1
SET to=%2
CALL %sevenzip% e %usezip% %from% -so | %sevenzip% x -y -si -ttar -o%to%
EXIT /B 0