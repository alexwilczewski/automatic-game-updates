@echo off
for /F "tokens=*" %%a in ('more') do (
  echo %%a
)
