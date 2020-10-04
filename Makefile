# this make file is only make for linux:

INSTALL_FOLDER=~/.local/share/applications

install :
	cp autowallpaper.desktop ~/.config/autostart
	cp autowallpaper.desktop $(INSTALL_FOLDER)/
	cp autowallpaper.py      $(INSTALL_FOLDER)/	
	chmod u+x $(INSTALL_FOLDER)/autowallpaper.py
	
clean :
	rm $(INSTALL_FOLDER)/autowallpaper*
