:: A simple script to setup Github on command line with the option of setting up the doosan proxy server
cls
@echo off
title GithubSetup
color C
echo Ensure you have git installed and setup in your environment variables or this script won't work.
echo WARNING! Your doosan login password will be stored in plain text if you set up the proxt server, DO NOT use this on a shared PC.

:QUERY
echo This will prompt you for your github username and email and setup git to use, are you sure you want to continue(Y/N)?
set/p "ch=>"
if /I %ch%==Y goto INPUT
if /I %ch%==N goto :eof
echo Invalid choice & goto QUERY

:INPUT
echo Please enter your github username exactly as you would login with it: 
set/p "guser=>"
echo Please enter your github email exactly as you would login with it.
set/p "gemail=>"
cls
goto SETUPA

:SETUPA
git config --global user.name "%guser%"
git config --global user.email "%gemail%"
echo Setup successful, check that the data below is correct.
git config --global --get user.name
git config --global --get user.email
timeout /t 10
echo Do you need to setup the doosan proxy server(Y/N)?
set/p "cha=>"
if /I %cha%==Y goto INPUTB
if /I %cha%==N goto :eof

:INPUTB
echo Please enter your doosan login (c##### staff number) exactly as you would login with it: 
set/p "user=>"
echo Please enter your doosan password exactly as you would login with it.
set/p "pass=>"
cls
goto SETUPB

:SETUPB
git config --global http.proxy "http://%user%:%pass%@10.30.6.30:8080" --replace-all
echo Setup successful, check that the data below is correct.
for /f "delims=" %%A in ('git config --global --get http.proxy') do set "var=%%A"
echo User:Password
echo %var:~7,-16%
timeout /t 10
goto :eof