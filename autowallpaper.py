#! python3

# this script download an image from unsplash for your background
# It has been tested on Ubuntu 20.04

# import
from pathlib    import Path
from platform   import system
from requests   import get
from os         import environ


# DOWNLOAD_FOLDER 
if system() == 'Linux'      :
    DOWNLOAD_FOLDER = '/'.join([environ['HOME'], '.cache/wallpaper'])
elif system() == 'Windows'  :
    DOWNLOAD_FOLDER =  '/'.join([str(Path.home()), 'Images'])
elif system() == 'Darwin'   :
    DOWNLOAD_FOLDER = environ['HOME']
else                        :
    DOWNLOAD_FOLDER = environ['HOME']

# create file PATH according to previous declaration
FILE_PATH = '/'.join([DOWNLOAD_FOLDER,'unsplash.jpg'])

# URL Creation
BASE_URL = 'https://source.unsplash.com'
RES_URL  = '1920x1080'
KEYWORDS = ['nature', 'water']
URL      = '/'.join([BASE_URL,RES_URL,'?' + ','.join(KEYWORDS)])

# make sure folder exists
Path(DOWNLOAD_FOLDER).mkdir(parents=True, exist_ok=True)

# download file from unsplash
img_data = get(URL).content
with open(FILE_PATH, 'wb') as handler:
    handler.write(img_data)

#install on system :
# Linux
if system() == 'Linux' :
    if 'GNOME' in environ['XDG_CURRENT_DESKTOP'] :
        from gi.repository.Gio import Settings
        gnome_settings = Settings.new('org.gnome.desktop.background')
        gnome_settings.set_string('picture-uri', FILE_PATH)
    else:
        print("Image downloaded at {DOWNLOAD_FOLDER} ,but not set")

# Windows
elif system() == 'Windows' :
    try:
        import ctypes
        SPI_SETDESKWALLPAPER = 20 
        ctypes.windll.user32.SystemParametersInfoA(SPI_SETDESKWALLPAPER, 0, FILE_PATH , 0)
    except :
        print("Image downloaded at {DOWNLOAD_FOLDER} ,but not set")

# MacOS
elif system() == 'Darwin' :
    print("Image downloaded at {DOWNLOAD_FOLDER} ,but not set")
 






