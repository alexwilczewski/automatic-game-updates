@ECHO OFF
SET cwd=%~dp0
SET inputunzips="%cwd%unzipping.conf"
SET log="%cwd%client.log"
CALL "%cwd%unzip-games.cmd" %inputunzips% > %log% 2>&1