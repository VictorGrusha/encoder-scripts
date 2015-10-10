@echo off
cls

set startTime=%time%

set suffix=-converted-x264-mq
set extension=mkv

if [%1]==[] goto :eof
:loop

set sourcePath=%~f1
set destinationPath=%~d1%~p1%~n1%suffix%.%extension%

ffmpeg -hide_banner -i %sourcePath% -vf scale=1920x1080 -sws_flags sinc -c:v libx264 -preset slower -crf 25 -c:a libvorbis -aq 5 %destinationPath%

shift
if not [%1]==[] goto loop

set endTime=%time%

echo start: %startTime%
echo end:  %endTime%

pause