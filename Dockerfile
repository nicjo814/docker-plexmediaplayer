FROM nicjo814/docker-mpv:qtppa

# set env variables
ENV DISPLAY=":0"
ENV XAUTHORITY="/tmp/.docker.xauth"

# specify apt packages to install
ENV BUILD_APTLIST=""

ENV APTLIST="lshw git build-essential ninja-build cmake \
mesa-common-dev libxrandr-dev libsdl2-dev libcec-dev dbus \
dbus-x11 libxcb-xinerama0 gdb"

#add repository
RUN add-apt-repository -y ppa:george-edison55/cmake-3.x && \

# install packages
apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy && \

# build plex media player
mkdir -p /tmp && \
cd /tmp && \
git clone https://github.com/plexinc/plex-media-player.git && \
cd plex-media-player && \
mkdir build && \
cd build

ADD QtConfiguration.cmake /tmp/plex-media-player/CMakeModules/QtConfiguration.cmake

RUN cd /tmp/plex-media-player/build && \
QT5_CFLAGS="-O1 -ggdb" cmake -GNinja -DCMAKE_BUILD_TYPE=Debug -DQTROOT=/opt/qt56 -DMPV_INCLUDE_DIR=/usr/local/include/mpv -DMPV_LIBRARY=/usr/local/lib/libmpv.so.1 -DCMAKE_INSTALL_PREFIX=output .. && \
ninja && \
cp ./src/plexmediaplayer /usr/local/bin && \
cp ./src/pmphelper /usr/local/bin
# && \

# cleanup 
#cd / && \
#apt-get purge --remove $BUILD_APTLIST -y && \
#apt-get autoremove -y && \
#apt-get clean -y && \
#rm -rf /var/tmp/* /tmp/* 

# add some files 
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh

