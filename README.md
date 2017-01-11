# docker-plexmediaplayer
Plex Media Player Docker Image

## Prerequisites
* X server installed on host OS (must be with a window manger)
* Allow connections to the X server. Either by running *xhost +* as the user starting the X session on the host OS from cli, or by entering *xhost +* into the *~/.xsessionrc* file as the user starting the X session on the host OS (create the file if it doesn't exist)

## Supported GFX drivers
* nvidia, nouveau, radeon, i810, i815, i830, i845, i855, i865, i915, i945, i965
* Other drivers are probably supported too. If your driver is not listed above, try to run the container without the GFX_DRIVER parameter and report back if it works.


## Usage
```
docker run -d --privileged -v /tmp:/tmp -e GFX_DRIVER=<driver> --name=plexmediaplayer nicjo814/docker-plexmediaplayer
```
