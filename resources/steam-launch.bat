@echo off
echo XBMC Steam BPM launcher by teeedubb.
echo Check for 64bit or 32bit Windows:
IF EXIST "%PROGRAMFILES(X86)%" (
echo Running 64-bit Windows.
set PRGMFiles="C:\Program Files (x86)"
) || (
echo Running 32-bit Windows.
set PRGMFiles="C:\Program Files"
)

REM #####################################################################
REM Edit the two lines below to configure non standard install locations
REM EG:
REM set STEAMLaunchCmd="D:\games\steam\steam.exe"

set XBMCLaunchCmd=%PRGMFiles%"\XBMC\XBMC.exe"
set STEAMLaunchCmd=%PRGMFiles%"\Steam\steam.exe"

REM You should not need to edit below here.
REM #####################################################################

echo Launch Steam BP differently depending whether its already open:
tasklist /nh /fi "imagename eq steam.exe" | find /i "steam.exe" >nul && (
echo Steam is running, toggle big picture mode.
cscript //B //Nologo "%appdata%/XBMC/addons/script.steam.launcher/resources/LaunchXBMC.vbs" %STEAMLaunchCmd% steam://open/bigpicture
) || (
echo Steam is not running, launch in big picture mode.
cscript //B //Nologo "%appdata%/XBMC/addons/script.steam.launcher/resources/LaunchXBMC.vbs" %STEAMLaunchCmd% -bigpicture
)

:killxbmc

echo Kill XBMC
taskkill /f /IM xbmc.exe>nul 2>nul

:steamopenloop

echo Loop while steam open
tasklist /nh /fi "imagename eq steam.exe" | find /i "steam.exe" >nul && (
echo Steam is running, loop
timeout 1
goto steamopenloop
) || (
echo Steam is not running, launch XBMC
cscript //B //Nologo "%appdata%/XBMC/addons/script.steam.launcher/resources/LaunchXBMC.vbs" %XBMCLaunchCmd%
)

echo Check for 5 seconds to see if Steam has been restarted after an update - this figure can probably be lowered
tasklist /nh /fi "imagename eq steam.exe" | find /i "steam.exe" >nul && (
echo Steam is running again after 1 second, killing XBMC.
goto killxbmc
) || (
echo Steam is not running, wait one second, try again.. 1
timeout 1
)

tasklist /nh /fi "imagename eq steam.exe" | find /i "steam.exe" >nul && (
echo Steam is running again after 2 seconds, killing XBMC.
goto killxbmc
) || (
echo Steam is not running, wait one second, try again.. 2
timeout 1
)

tasklist /nh /fi "imagename eq steam.exe" | find /i "steam.exe" >nul && (
echo Steam is running again after 3 seconds, killing XBMC.
goto killxbmc
) || (
echo Steam is not running, wait one second, try again.. 3
timeout 1
)

tasklist /nh /fi "imagename eq steam.exe" | find /i "steam.exe" >nul && (
echo Steam is running again after 4 seconds, killing XBMC.
goto killxbmc
) || (
echo Steam is not running, wait one second, try again.. 4
timeout 1
)

tasklist /nh /fi "imagename eq steam.exe" | find /i "steam.exe" >nul && (
echo Steam is running again after 5 seconds, killing XBMC.
goto killxbmc
) || (
echo Steam is not running, wait one second, try again.. 5
timeout 1
)

tasklist /nh /fi "imagename eq steam.exe" | find /i "steam.exe" >nul && (
echo Steam is running, killing XBMC.
goto killxbmc
) || (
echo Steam is not running after 5 seconds, user must have quit
echo Script is exiting
)