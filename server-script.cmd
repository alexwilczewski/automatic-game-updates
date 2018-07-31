@ECHO OFF
SET cwd=%~dp0
SET inputgames="%cwd%games.conf"
SET inputzips="%cwd%zipping.conf"
SET steamupdatescriptsdir="%cwd%steam-update-scripts"
SET log="%cwd%server.log"
CALL "%cwd%generate-steam-update-script.cmd" %inputgames% %steamupdatescriptsdir% > %log% 2>&1
CALL "%cwd%run-steam-update-scripts.cmd" %steamupdatescriptsdir% >> %log% 2>&1
CALL "%cwd%zip-games.cmd" %inputzips% >> %log% 2>&1