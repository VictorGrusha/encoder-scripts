@echo off
cls

set suffix=-converted-x264
set extension=mkv

set sourcePath=%~f1
set destinationPath=%~d1%~p1%~n1%suffix%.%extension%
set startTime=%time%

ffmpeg -hide_banner -i %sourcePath% -c:v libx264 -preset slower -crf 20 -c:a libvorbis -aq 8 %destinationPath%

set endTime=%time%

echo start: %startTime%
echo end:  %endTime%

pause