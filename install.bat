@echo off
echo ========================================
echo    Installation de l'overlay Discord
echo ========================================
echo.

mkdir "%APPDATA%\DiscordOverlay" 2>nul

echo Telechargement des fichiers...
curl -L "https://github.com/noktoexe/discord-overlay/releases/latest/download/client.exe" -o "%APPDATA%\DiscordOverlay\client.exe"
curl -L "https://github.com/noktoexe/discord-overlay/releases/latest/download/icon_on.png" -o "%APPDATA%\DiscordOverlay\icon_on.png"
curl -L "https://github.com/noktoexe/discord-overlay/releases/latest/download/icon_off.png" -o "%APPDATA%\DiscordOverlay\icon_off.png"

echo Copie du config...
copy "%~dp0config.py" "%APPDATA%\DiscordOverlay\config.py" /Y

echo Ajout au demarrage automatique...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "DiscordOverlay" /t REG_SZ /d "\"%APPDATA%\DiscordOverlay\client.exe\"" /f

echo.
echo ========================================
echo    Installation terminee !
echo ========================================
echo.

start "" "%APPDATA%\DiscordOverlay\client.exe"
pause