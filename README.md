# docker-plexmediaplayer
Plex Media Player Docker Image

*IMPORTANT* This is not working 100% yet with lots of crashes in the UI. If the screen goes black (but the app is still runnning, it's possible to reload the app by pressing CTRL+SHIFT+R. When playback of a movie starts though it runs fine.

## Prerequisites
* X server installed on host OS (must be with a window manger)
* Nvidia proprietary graphics drivers installed and active on host OS (only card supported atm)
* Allow connections to the X server (could be done by adding "xhost +" to the .xsessionrc file of the user running the X server on the host)

## Usage
```
docker run -d --privileged -v /tmp:/tmp --name=plexmediaplayer nicjo814/docker-plexmediaplayer:ppa
```
