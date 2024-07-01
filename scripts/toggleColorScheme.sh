#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi

