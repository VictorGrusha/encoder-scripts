@echo off
cls

set suffix=-converted-vp9
set extension=webm

set sourcePath=%~f1
set destinationPath=%~d1%~p1%~n1%suffix%.%extension%
set startTime=%time%

ffmpeg -hide_banner -i %sourcePath% -c:v libvpx-vp9 -pass 1 -crf 28 -b:v 0 -threads 8 -speed 4 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -an -f webm vp9-temp
ffmpeg -hide_banner -i %sourcePath% -c:v libvpx-vp9 -pass 2 -crf 28 -b:v 0 -threads 8 -speed 2 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -c:a libopus -b:a 256k -f webm %destinationPath%
del "ffmpeg2pass-0.log"
del "vp9-temp"

set endTime=%time%

echo start: %startTime%
echo end:  %endTime%

pause