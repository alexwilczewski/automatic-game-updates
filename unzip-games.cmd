@ECHO OFF
SET cwd=%~dp0
SET readin=%1
SET sevenzip="%cwd%7za.exe"
SET ziptmpfile="%temp%\tempgame.7z"
FOR /F "usebackq eol=; tokens=1,2 delims=|" %%a IN (%readin%) DO (
  CALL :givenline "%%a" "%%b"
)
EXIT /B 0

:givenline
SET zipurl=%1
SET unzipdir=%2
CALL "%cwd%curl.exe" -o %ziptmpfile% %zipurl%
CALL %sevenzip% x %ziptmpfile% -y -o%unzipdir% -r
CALL DEL %ziptmpfile%
EXIT /B 0