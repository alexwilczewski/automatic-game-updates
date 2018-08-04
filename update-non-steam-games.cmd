@ECHO OFF
SET cwd=%~dp0
SET readin=%1
SET execstabilizesec=60
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
ECHO "Wait for exec to stabilize (s): %execstabilizesec%"
TIMEOUT %execstabilizesec%
ECHO "Start file watcher"
cscript.exe /nologo "%cwd%wait-for-file-stabilization.vbs" %watchingdir%
TASKKILL /FI "imagename eq %execname%" /T /F
EXIT /B 0