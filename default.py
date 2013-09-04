import os
if os.name == 'nt':
    pass # Windows
    os.system('cscript //B //Nologo "%appdata%/XBMC/addons/script.steam.launcher/resources/LaunchHidden.vbs" "%appdata%/XBMC/addons/script.steam.launcher/resources/steam-launch.bat"')
else:
    pass # other (unix)
    os.system('$HOME/.xbmc/addons/script.steam.launcher/resources/steam-launch.sh')