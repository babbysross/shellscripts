:: A simple script to overlay the Doosan logo on a bunch of mp4s.
cls
@echo off
title doosanlogo
echo Ensure you have ffmpeg installed and setup in your environment variables or this script won't work.

:QUERY
echo This will overlay all mp4 files in this directory, do you want to continue(Y/N)?
set/p "ch=>"
if /I %ch%==Y goto CONVERT
if /I %ch%==N goto :eof
echo Invalid choice & goto QUERY

:CONVERT
FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO ffmpeg -i "%%G" -i doosan.png -filter_complex "overlay=x=(main_w-overlay_w-20):y=(main_h-overlay_h-20)" "%%~nG_OL.mp4"