@echo off
cls

set suffix=-converted-x264-mq
set extension=mkv

set sourcePath=%~f1
set destinationPath=%~d1%~p1%~n1%suffix%.%extension%
set startTime=%time%

ffmpeg -hide_banner -i %sourcePath% -vf scale=1920x1080 -sws_flags spline -c:v libx264 -preset slower -crf 25 -c:a libvorbis -aq 5 %destinationPath%

set endTime=%time%

echo start: %startTime%
echo end:  %endTime%

pause