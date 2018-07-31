@ECHO OFF
SET cwd=%~dp0
SET readin=%1
SET sevenzip="%cwd%7za.exe"
SET storezipprefix=">"
SET addprefix="<"
SET storezip=
FOR /F "eol=; tokens=1,2,3* delims=|" %%a IN (%readin%) DO (
  IF "%%a"==%storezipprefix% (
    CALL :givenstore "%%b"
	CALL :resetstore
  )
  IF "%%a"==%addprefix% (
    CALL :givenaddition "%%b" "%%c"
  )
)
EXIT /B 0

:givenstore
SET storezip=%1
EXIT /B 0

:resetstore
IF EXIST %storezip% (
  CALL del %storezip%
)
EXIT /B 0

:givenaddition
SET systemfile=%1
SET innertarfile=%2
CALL %sevenzip% a dummy -ttar -so %systemfile% | %sevenzip% a -t7z -si%innertarfile% %storezip%
EXIT /B 0