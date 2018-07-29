@ECHO OFF
SET cwd=%~dp0
SET inputgames=%cwd%games.conf
SET inputzips=%cwd%zipping.conf
SET steamupdatescriptsdir=%cwd%steam-update-scripts
SET log=%cwd%output.log
CALL generate-steam-update-script.cmd %inputgames% %steamupdatescriptsdir% > %log% 2>&1
CALL run-steam-update-scripts.cmd %steamupdatescriptsdir% >> %log% 2>&1
CALL zip-games.cmd %inputzips%