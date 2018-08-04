@ECHO OFF
SET cwd=%~dp0
SET readin=%1
REM 60 (s) * 60 (m) = 3600 (1h)
SET execwaittimeseconds=3600
FOR /F "usebackq eol=; tokens=1,2,3 delims=|" %%a IN (%readin%) DO (
    CALL :givenline "%%a" "%%b" %%c
)
EXIT /B 0

:givenline
SET runnable=%1
SET watchingdir=%2
SET execname=%3
ECHO "Start runnable: %runnable%"
START "" /B %runnable%
ECHO "Give time for downloads (s): %execwaittimeseconds%"
TIMEOUT %execwaittimeseconds%
TASKKILL /FI "imagename eq %execname%" /T /F
EXIT /B 0