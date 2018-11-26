:: A simple script to convert a png or jpg image sequence to an mp4 file with ffmpeg
cls
@echo off
title img2MP4
echo Ensure you have ffmpeg installed and setup in your environment variables or this script won't work.



:QUERY
echo This will convert all image files in the following directory to a single mp4, 
echo %cd%
echo do you want to continue(Y/N)?
set/p "ch=>"
if /I %ch%==Y goto CONVERT
if /I %ch%==N goto :eof
echo Invalid choice & goto QUERY


:CONVERT
echo What type of image file are you converting(png,jpg,etc)?
set/p "cha=>"
ffmpeg -i %%04d.%cha% out.mp4