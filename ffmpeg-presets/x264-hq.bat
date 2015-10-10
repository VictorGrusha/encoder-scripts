@echo off
cls

set startTime=%time%

set suffix=-converted-x264-hq
set extension=mkv

if [%1]==[] goto :eof
:loop

set sourcePath=%~f1
set destinationPath=%~d1%~p1%~n1%suffix%.%extension%

ffmpeg -hide_banner -i %sourcePath% -c:v libx264 -preset slower -crf 20 -c:a libvorbis -aq 8 %destinationPath%

shift
if not [%1]==[] goto loop

set endTime=%time%

echo start: %startTime%
echo end:  %endTime%

pause