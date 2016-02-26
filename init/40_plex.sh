#!/bin/bash

#mkdir -p /root/.local/share/plexmediaplayer

#if [ -f "/root/.local/share/plexmediaplayer/machine-id" ]; then
#    cp /root/.local/share/plexmediaplayer/machine-id /etc/machine-id
#else
#	dbus-uuidgen > /root/.local/share/plexmediaplayer/machine-id
#	cp /root/.local/share/plexmediaplayer/machine-id /etc/machine-id
#fi

#if [ -z $GEOMETRY ]; then
#	/usr/local/bin/plexmediaplayer -geometry $GEOMETRY
#else
/usr/local/bin/plexmediaplayer
#fi
