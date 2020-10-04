# PyAutoWallpaper
Automatic Wallpaper downloader in Python 

## Use :

this script should work in Linux and windows.

Just run :
```shell
python autowallpaper.py
```
in your favorite shell interpreter.

## installation on linux : 

```
git clone https://github.com/MadMcCrow/PyAutoWallpaper.git
cd PyAutoWallpaper
cp autowallpaper.desktop ~/.config/autostart
cp autowallpaper.desktop ~/.local/share/applications
cp autowallpaper.py      ~/.local/share/applications # if you change that , edit the .desktop file
```

or alternatively you can use the included Makefile :`make install` and `make clean` to remove


## limitations :

it only works in Gnome 3 and maybe on windows (untested)

## contribution :

this script is enought for my use case, and will update it only to support my use case. but if you wanna add more support and options, open a pull request, I will review it and possibly merge it. 

