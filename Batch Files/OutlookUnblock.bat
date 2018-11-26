:: A simple regedit script to unblock .bat, .ps1 and .exe attachments in Outlook 2010
cls
@echo off
title OutlookUnblock
color C
echo MAKE SURE YOU HAVE MS OUTLOOK 2010 OR THIS SCRIPT MAY CAUSE PROBLEMS
goto QUERY

:QUERY
echo This will add a registry value that unblocks batch, powershell and exe files in MS Outlook 2010, are you sure you want to continue(Y/N)?
set/p "ch=>"
if /I %ch%==Y goto REGEDIT
if /I %ch%==N goto :eof
echo Invalid choice & GOTO QUERY

:REGEDIT
reg add HKCU\Software\Microsoft\Office\14.0\Outlook\Security /v Level1Remove /t REG_SZ /d .bat;.ps1;.exe;
echo Changes successful.
pause
goto :eof