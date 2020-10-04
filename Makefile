# this make file is only make for linux:

INSTALL_FOLDER=~/.local/share/autowallpaper

install :
	mkdir --parent $(INSTALL_FOLDER)
	cp autowallpaper.desktop ~/.config/autostart
	cp autowallpaper.desktop ~/.local/share/applications/
	cp autowallpaper.py       $(INSTALL_FOLDER)/
	chmod u+x  $(INSTALL_FOLDER)/autowallpaper.py
	
clean :
	rm $(INSTALL_FOLDER) -R ||\
	rm ~/.config/autostart/autowallpaper* ||\
	rm ~/.local/share/applications/autowallpaper* 
