@echo off

:menu
echo.
echo  1: mp3
echo  2: mp4
echo  3: other
echo  4: update
echo  5: exit
set /p op=:

if "%op%"=="1" goto mp3
if "%op%"=="2" goto mp4
if "%op%"=="3" goto other
if "%op%"=="4" goto update
if "%op%"=="5" goto exit
goto menu

:mp3
set /p url=link:
yt-dlp -x --audio-format mp3 %url% -o "~/Downloads/%%(title)s.%%(ext)s"
goto menu

:mp4
set /p url=link:
yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" --merge-output-format mp4 %url% -o "~/Downloads/%%(title)s.%%(ext)s"
goto menu

:other
set /p url=link:
yt-dlp -F %url%
set /p mp4=mp4:
set /p m4a=m4a:
yt-dlp -f %mp4%[ext=mp4]+%m4a%[ext=m4a] %url% -o "~/Downloads/%%(title)s.%%(ext)s"
goto menu

:update
yt-dlp -U
goto menu

:exit
exit