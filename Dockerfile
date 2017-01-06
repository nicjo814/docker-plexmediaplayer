FROM nicjo814/docker-baseimage-xenial-x

ENV APTLIST="git build-essential ninja-build cmake \
mesa-common-dev libxrandr-dev libsdl2-dev libcec-dev dbus \
dbus-x11 libxcb-xinerama0 python-pip qt-latest \
autoconf automake libtool libharfbuzz-dev libfreetype6-dev libfontconfig1-dev \
libx11-dev libvdpau-dev libva-dev libegl1-mesa-dev yasm libasound2-dev \
libpulse-dev libuchardet-dev zlib1g-dev libfribidi-dev libgnutls-dev \
libgl1-mesa-dev"

RUN \
# install packages
apt-get update -q && \
apt-get install software-properties-common -qy && \
add-apt-repository -y ppa:beineri/opt-qt57-xenial && \
apt-get update -q && \
apt-get install \
$APTLIST -qy && \

# install conan
pip install -U conan && \
conan remote add plex https://conan.plex.tv && \

# build mpv
mkdir -p /tmp && \
cd /tmp && \
git clone https://github.com/mpv-player/mpv-build.git && \
cd mpv-build && \
echo --enable-libmpv-shared > mpv_options && \
echo --disable-cplayer >> mpv_options && \
./rebuild -j4 && \
./install && \
ldconfig && \

# build plex media player
cd /tmp && \
git clone https://github.com/plexinc/plex-media-player.git && \
cd plex-media-player && \
mkdir build && \
cd build && \
conan install .. && \
cmake -DCMAKE_BUILD_TYPE=Debug -DQTROOT=/opt/qt57 -DCMAKE_INSTALL_PREFIX=/usr/local/ .. && \
make -j4 && \
make install && \

# cleanup
cd / && \
apt-get autoremove -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# add some files
COPY root/ /
