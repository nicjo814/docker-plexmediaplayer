FROM linuxserver/baseimage

# set env variables
ENV DISPLAY=":0"
ENV XAUTHORITY="/tmp/.docker.xauth"

# specify apt packages to install
ENV BUILD_APTLIST="dos2unix \
libxcb1-dev \
libx11-xcb-dev \
libxcb-keysyms1-dev \
libxcb-image0-dev \
libxcb-shm0-dev \
libxcb-icccm4-dev \
libxcb-sync-dev \
libxcb-xfixes0-dev \
libxrender-dev \
libxcb-shape0-dev \
libxcb-randr0-dev \
libxcb-render-util0-dev \
libxcb-glx0-dev \
libxcb-xinerama0-dev"

ENV APTLIST="lshw \
libfontconfig1 \
libxcb1 \
libx11-xcb1 \
libx11-6 \
libxcb-keysyms1 \
libxcb-image0 \
libxcb-shm0 \
libxcb-icccm4 \
libxcb-sync1 \
libxcb-render-util0 \
p7zip-full \
python \
wget"

# add repositories
# RUN \
# plex home theater
# add-apt-repository ppa:plexapp/plexht

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy

# build qt
RUN mkdir -p /tmp && \
cd /tmp && \
wget http://download.qt.io/development_releases/qt/5.6/5.6.0-beta/single/qt-everywhere-opensource-src-5.6.0-beta.7z && \
7z x qt-everywhere-opensource-src-5.6.0-beta.7z && \
cd qt-everywhere-opensource-src-5.6.0-beta && \
dos2unix -k -o configure && \
make



# cleanup 
RUN cd / && \
apt-get purge --remove $BUILD_APTLIST -y && \
apt-get autoremove -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /var/tmp/*
# /tmp/* 

# add some files 
#ADD services/ /etc/service/
#ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh

# expose ports
#EXPOSE 443

# set volumes
# VOLUME /opt/plexhometheater/share
