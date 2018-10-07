@ECHO OFF
SET serverconf=%1
CALL %serverconf%
SET SteamCmdConfigDir=%SteamCmdDir%\config
CALL xcopy /y "%SteamProgramConfigFile%" "%SteamCmdConfigDir%\config.vdf"
EXIT /B 0