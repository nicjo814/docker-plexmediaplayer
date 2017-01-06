# docker-plexmediaplayer
Plex Media Player Docker Image

## Prerequisites
* X server installed on host OS (must be with a window manger)
* Allow connections to the X server (could be done by adding "xhost +" to the .xsessionrc file of the user running the X server on the host)

## Supported GFX drivers
* nvidia, nouveau, i810, i815, i830, i845, i855, i865, i915, i945, i965


## Usage
```
docker run -d --privileged -v /tmp:/tmp -e GFX_DRIVER=<driver> --name=plexmediaplayer nicjo814/plexmediaplayer
```
