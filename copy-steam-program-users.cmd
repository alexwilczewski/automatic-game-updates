@ECHO OFF
SET serverconf=%1
CALL %serverconf%
SET SteamCmdConfigDir=%SteamCmdDir%\config
SET SteamProgramConfigDir=%SteamProgramDir%\config
CALL xcopy /y "%SteamProgramConfigDir%\config.vdf" "%SteamCmdConfigDir%\config.vdf"
EXIT /B 0