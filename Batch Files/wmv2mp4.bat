:: A simple script to batch convert wmv's to mp4's.
cls
@echo off
title wmv2mp4
color C
echo Ensure you have ffmpeg installed and setup in your environment variables or this script won't work.

:QUERY
echo This will convert all wmv files in this directory to mp4, do you want to continue(Y/N)?
set/p "ch=>"
if /I %ch%==Y goto CONVERT
if /I %ch%==N goto :eof
echo Invalid choice & goto QUERY

:CONVERT
FOR /F "tokens=*" %%G IN ('dir /b *.wmv') DO ffmpeg -i "%%G" -acodec mp4 "%%~nG.mp4"
