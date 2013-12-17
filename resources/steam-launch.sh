#!/bin/bash
# App Launch script - Quit XBMC to launch another program
# Thanks to rodalpho @ # http://xbmc.org/forum/showthread.php?t=34635
# By Redsandro 	2008-07-07
# By ryosaeba87	2010-08-24 (Added support for MacOSX)
# 



case "$(uname -s)" in
	Darwin)
		XBMC_PID=$(ps -A | grep XBMC.app | grep -v Helper | grep -v grep | awk '{print $1}')
		XBMC_BIN=$(ps -A | grep XBMC.app | grep -v Helper | grep -v grep | awk '{print $5}')
                STEAM_PID=$(ps -A | grep STEAM.app | grep -v Helper | grep -v grep | awk '{print $1}')
                STEAM_BIN=$(ps -A | grep STEAM.app | grep -v Helper | grep -v grep | awk '{print $5}')
		;;
	Linux)
		XBMC_PID=$(pidof xbmc.bin)
		XBMC_BIN="xbmc"
                STEAM_BIN="steam"
                STEAM_PID=$(pidof steam)
		;;	
	*)
		echo "I don't support this OS!"
		exit 1
		;;
esac

#Kill XBMC
	kill -9 $XBMC_PID #There are better ways of doing this but this is the most consistent
	echo "Shutdown XBMC" 
	
# Is Steam running?
if [ $STEAM_PID ]
then
        #$STEAM_BIN steam://open/bigpicture #steam is brought to focus better this way
        /usr/bin/returntosteam.sh
        echo "SteamOs already running"
else
	$STEAM_BIN -tenfoot -steamos -enableremotecontrol #steam opens better like this if not already open
	echo "SteamOs not running, launching"
fi

# Create lock file to prevent multiple instances of xbmc opening if addon has been run multiple times.
if [[ -f /tmp/steam-launcher.running ]] ; then
    exit
fi
touch /tmp/steam-launcher.running

# Wait for Steam to exit
while [ $(pidof steam) ]; do #STEAM_PID variable doesnt work here, needs work
	echo "Steam running"
	sleep 1
done

#remove lock file
rm -f /tmp/steam-launcher.running

#Restart XBMC
$XBMC_BIN &
