@echo off
CALL zipjs.bat unZipItem -source C:\GameCafe\ZippedGames.zip\steamapps\downloading -destination "C:\Program Files\Steam\steamapps" -keep yes -force yes
CALL zipjs.bat unZipItem -source C:\GameCafe\ZippedGames.zip\steamapps\shadercache -destination "C:\Program Files\Steam\steamapps" -keep yes -force yes