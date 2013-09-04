XBMC Steam Launcher.

Launches Steam from within XBMC - It will close XBMC, launch Steam in Big Picture mode and when Steam is exited XBMC will restart. Steam also comes with a full featured web browser than can be controlled with a game pad or remote and plays back flash content. It works with Windows, Linux and quite possibly OSX, but this hasn't been tested.

On Windows x64 + Linux the settings within the addon should work provided Steam and XBMC are installed in their default directories. Linux users need to make the script that launches Steam executable:

Code:
chmod +x ~/.xbmc/addons/script.steam.launcher/resources/steam-launch.sh

For Windows 32bit/non standard install locations etc you can edit the addon zip file before installing:

Windows: Edit the file /script.steam.launcher/resources/steam-launch.bat

Linux: Edit the file /script.steam.launcher/resources/steam-launch.sh

To make changes once the addon is installed edit either:

Windows
Code:
%appdata%\XBMC\addons\script.steam.launcher\resources\steam-launch.bat

Linux
Code:
~/.xbmc/addons/script.steam.launcher/resources/steam-launch.sh

Uninstalling the addon, making the above changes and reinstalling has no effect due to xbmc using a cached addon zip file as there is no version number change. Windows users editing steam-launch.bat need to make sure to use either quotation marks or 8.3 filenames.

http://forum.xbmc.org/showthread.php?tid=157499
http://store.steampowered.com/bigpicture