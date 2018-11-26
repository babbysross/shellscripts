:: A simple script to convert a png or jpg image sequence to an mp4 file with ffmpeg
cls
@echo off
title PNG2MP4
color C
echo Ensure you have ffmpeg installed and setup in your environment variables or this script won't work.


:QUERY
echo This will convert all image files in the following directory to a single mp4, 
echo %cd%
echo are the files PNGs or JPEGs(PNG/P/JPG/J/CANCEL)?
set/p "ch=>"
if /I %ch%==PNG goto CONVERTPNG
if /I %ch%==P goto CONVERTPNG
if /I %ch%==JPG goto CONVERTJPG
if /I %ch%==J goto CONVERTJPG
if /I %ch%==CANCEL goto :eof
echo Invalid choice & goto QUER

:CONVERTPNG
cd %cd%
ffmpeg -i %04d.png out.mp4

:CONVERTJPG
cd %cd%
ffmpeg -i %04d.jpg out.mp4

