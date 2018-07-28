@ECHO OFF
SET cwd=%~dp0
SET zipfile=C:\GameCafe\ZippedGames.zip
CALL del %zipfile%
CALL zipjs.bat zipItem -source %cwd%\steam-update-scripts\DO_NOT_REMOVE -destination %zipfile%
CALL zipjs.bat addToZip -source C:\GameCafe\steamapps -destination %zipfile% -keep yes