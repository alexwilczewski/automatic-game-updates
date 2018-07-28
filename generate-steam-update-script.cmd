@echo off
set readin=%1
set toout=%2
echo @ShutdownOnFailedCommand 0 > %toout%
echo @NoPromptForPassword 1 >> %toout%
for /F "eol=; tokens=1* delims= " %%a in (%readin%) do (
  echo app_update %%a validate >> %toout%
  echo %%a -- %%b
)
echo quit >> %toout%