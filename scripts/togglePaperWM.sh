#!/bin/bash

EXTENSION="paperwm@paperwm.github.com"
STATUS=$(gnome-extensions info $EXTENSION | grep 'State' | awk '{print $2}')

if [ "$STATUS" == "ACTIVE" ]; then
    gnome-extensions disable $EXTENSION
else
    gnome-extensions enable $EXTENSION
fi

