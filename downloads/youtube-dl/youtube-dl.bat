@echo off

:menu
echo.
echo 1: mp3
echo 2: mp4 (Buena calidad)
echo 3: otros
echo 4: salir

set /p op=:
if "%op%"=="4" goto salir
set /p url=Enlace:
echo.

if "%op%"=="1" goto mp3
if "%op%"=="2" goto mp4
if "%op%"=="3" goto otros

:mp3
youtube-dl -x --audio-format mp3 %url%
goto menu

:mp4
youtube-dl -f 137[ext=mp4]+140[ext=m4a] %url%
goto menu

:otros
youtube-dl -F %url%
set /p mp4=Calidad de mp4:
set /p m4a=Calidad de m4a:
youtube-dl -f %mp4%[ext=mp4]+%m4a%[ext=m4a] %url%
goto menu

:salir