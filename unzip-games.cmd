@ECHO OFF
SET cwd=%~dp0
SET readin=%1
SET sevenzip="%cwd%7za.exe"
SET ziptmpfile="%temp%\TempZippedGames.7z"
SET usezipprefix="<"
SET pullprefix=">"
FOR /F "usebackq eol=; tokens=1,2,3* delims=|" %%a IN (%readin%) DO (
  IF "%%a"==%usezipprefix% (
    CALL :givenusezip "%%b"
  )
  IF "%%a"==%pullprefix% (
    CALL :givenpull "%%b" "%%c"
  )
)
EXIT /B 0

:givenusezip
CALL :downloadzip %1
EXIT /B 0

:downloadzip
SET zipurl=%1
CALL "%cwd%curl.exe" -o %ziptmpfile% %zipurl%
EXIT /B 0

:givenpull
SET from=%1
SET to=%2
CALL %sevenzip% e %ziptmpfile% %from% -so | %sevenzip% x -y -si -ttar -o%to%
EXIT /B 0