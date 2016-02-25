#!/bin/bash

if [ -f "/root/.local/share/plexmediaplayer/machine-id" ]; then
    cp /root/.local/share/plexmediaplayer/machine-id /etc/machine-id
else
    dbus-uuidgen > /root/.local/share/plexmediaplayer/machine-id
    cp /root/.local/share/plexmediaplayer/machine-id /etc/machine-id
fi

/usr/local/bin/plexmediaplayer
