#!/bin/bash

source ~/.setup/constants.sh
script_dir=$PWD

# Take dconf backup
dconf dump / > $BACKUPS/full.dconf.backup
dconf dump /org/gnome/ > $BACKUPS/gnome.dconf.backup
gsettings list-recursively > $BACKUPS/gnome.gsettings.backup

# Set up preferences
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-prussiangreen-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-prussiangreen'

gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

gsettings set org.gnome.shell.extensions.ding show-home false

# Set up wallpaper
if [ ! -e "$HOME/Pictures/wallpaper/Courtside-Sunset.png" ]
then
	mkdir -p $HOME/Pictures/wallpaper
	wget "https://raw.githubusercontent.com/JaKooLit/Wallpaper-Bank/main/wallpapers/Courtside-Sunset.png" -P ~/Pictures/wallpaper/
fi

gsettings set org.gnome.desktop.background picture-uri "file:///home/matt/Pictures/wallpaper/Courtside-Sunset.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/matt/Pictures/wallpaper/Courtside-Sunset.png"
# gsettings set org.gnome.desktop.screensaver picture-uri "file:///home/matt/Pictures/wallpaper/Courtside-Sunset.png"
# gsettings set org.gnome.desktop.screensaver picture-uri-dark "file:///home/matt/Pictures/wallpaper/Courtside-Sunset.png"

