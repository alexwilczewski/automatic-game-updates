@ECHO OFF
SET cwd=%~dp0
SET inputgames="%cwd%games.conf"
SET steamupdatescriptsdir="%cwd%steam-update-scripts"
SET log="%cwd%server.log"
SET serverconf="%cwd%serverconf.cmd"
CALL %serverconf%
CALL "%cwd%copy-steam-program-users.cmd" %serverconf% > %log% 2>&1
CALL "%cwd%clean-steam-update-scripts.cmd" %steamupdatescriptsdir% >> %log% 2>&1
CALL "%cwd%generate-steam-update-script.cmd" %inputgames% %steamupdatescriptsdir% "%SteamProgramDir%" >> %log% 2>&1
CALL "%cwd%run-steam-update-scripts.cmd" %serverconf% %steamupdatescriptsdir% >> %log% 2>&1
EXIT /B 0