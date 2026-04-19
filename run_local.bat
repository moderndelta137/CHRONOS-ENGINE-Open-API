@echo off
setlocal

cd /d "%~dp0"

set "PORT=8000"
set "GAME_URL=http://localhost:%PORT%/CHRONOS%%20ENGINE.html"

where py >nul 2>nul
if %errorlevel%==0 (
    start "CHRONOS ENGINE Local Server" cmd /k py -m http.server %PORT%
    timeout /t 2 /nobreak >nul
    start "" "%GAME_URL%"
    exit /b 0
)

where python >nul 2>nul
if %errorlevel%==0 (
    start "CHRONOS ENGINE Local Server" cmd /k python -m http.server %PORT%
    timeout /t 2 /nobreak >nul
    start "" "%GAME_URL%"
    exit /b 0
)

echo Python was not found on this system.
echo Install Python, or run the server manually with:
echo   py -m http.server %PORT%
echo   or
echo   python -m http.server %PORT%
pause
