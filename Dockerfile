FROM nicjo814/docker-mpv

# set env variables
ENV DISPLAY=":0"
ENV XAUTHORITY="/tmp/.docker.xauth"

# specify apt packages to install
ENV BUILD_APTLIST=""

ENV APTLIST="lshw git build-essential \
ninja-build wget cmake mesa-common-dev libxrandr-dev libsdl2-dev libcec-dev \
libdvdread4 libjpeg-turbo8 libjack-jackd2-0 liblua5.2-0 libbluray1 libenca0 \
libuchardet0 libcdio-paranoia1 libv4l-0 libsmbclient libcaca0 libguess1 \
librubberband2 libfontconfig1 libxcomposite1 libxtst6 libicu52 libpython3.4 \
libharfbuzz0b"

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

#RUN
#cmake -GNinja -DCMAKE_BUILD_TYPE=Debug -DQTROOT=/usr/local/qt -DMPV_INCLUDE_DIR=/usr/local/include/mpv -DMPV_LIBRARY=/usr/local/lib/libmpv.so.1 -DCMAKE_INSTALL_PREFIX=output ..
#ninja

## cleanup 
#RUN cd / && \
#apt-get purge --remove $BUILD_APTLIST -y && \
#apt-get autoremove -y && \
#apt-get clean -y && \
#rm -rf /var/lib/apt/lists/* /var/tmp/*
# /tmp/* 

# add some files 
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh

