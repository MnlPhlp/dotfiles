#! /bin/bash

password=$(echo -e "SETPROMPT Unlock gnome-keyring:\nGETPIN\n" | pinentry-gnome3 | grep D )
echo -n ${password#D } | gnome-keyring-daemon --replace --unlock
