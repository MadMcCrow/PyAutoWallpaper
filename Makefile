# this make file installs autowallpaper to a linux machine
# Tested on Ubuntu 20.10


INSTALL_FOLDER=~/.local/share/autowallpaper
FOLDER= ""

# get the absolute path of your home folder, ready for sed
absolute_path:
	$(eval FOLDER=$(shell sh -c "echo $(HOME)|sed 's/\//\\\\\//g'"))

# 
install : absolute_path
	mkdir --parent $(INSTALL_FOLDER)
	cp autowallpaper.desktop /tmp/
	# fix absolute path of your Home folder
	sed "s/~/$(FOLDER)/g" autowallpaper.desktop > /tmp/autowallpaper.desktop
	# install in autostart and your applications
	cp /tmp/autowallpaper.desktop ~/.config/autostart
	cp /tmp/autowallpaper.desktop ~/.local/share/applications/
	# visualize desktop file changes
	cat /tmp/autowallpaper.desktop
	# delete temporary file
	rm /tmp/autowallpaper.desktop
	# install script in app location
	cp autowallpaper.py      $(INSTALL_FOLDER)
	#  make everything executable
	chmod u+x  ~/.local/share/applications/autowallpaper.desktop
	chmod u+x  $(INSTALL_FOLDER)/autowallpaper.py
	
clean :
	-rm $(INSTALL_FOLDER) -R
	-rm ~/.config/autostart/autowallpaper* 
	-rm ~/.local/share/applications/autowallpaper* 
