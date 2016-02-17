FROM linuxserver/baseimage

# set env variables
ENV DISPLAY=":0"
ENV XAUTHORITY="/tmp/.docker.xauth"

# specify apt packages to install
ENV BUILD_APTLIST="dos2unix"

ENV APTLIST="lshw \"
p7zip-full \
wget"

ENV QT_BUILD_APTLIST="  binutils bsdmainutils build-essential comerr-dev cpp cpp-4.8 dbus debhelper \
dh-apparmor docbook docbook-to-man dpkg-dev fontconfig fontconfig-config \
fonts-dejavu-core freetds-common freetds-dev g++ g++-4.8 gcc gcc-4.8 gdb \
gettext gettext-base gir1.2-atk-1.0 gir1.2-atspi-2.0 gir1.2-freedesktop \
gir1.2-gdkpixbuf-2.0 gir1.2-gst-plugins-base-0.10 gir1.2-gstreamer-0.10 \
gir1.2-gtk-2.0 gir1.2-pango-1.0 groff-base icu-devtools intltool-debian \
krb5-multidev libapparmor1 libasan0 libasound2 libasound2-data \
libasound2-dev libasprintf0c2 libasyncns0 libatk1.0-0 libatk1.0-data \
libatk1.0-dev libatomic1 libatspi2.0-0 libatspi2.0-dev libavahi-client-dev \
libavahi-client3 libavahi-common-data libavahi-common-dev libavahi-common3 \
libboost-system1.54.0 libc-dev-bin libc6-dev libcairo-gobject2 \
libcairo-script-interpreter2 libcairo2 libcairo2-dev libcloog-isl4 libcroco3 \
libct4 libcups2 libcups2-dev libdatrie1 libdbus-1-dev libdbus-glib-1-dev \
libdpkg-perl libdrm-amdgpu1 libdrm-dev libdrm-intel1 libdrm-nouveau2 \
libdrm-radeon1 libegl1-mesa libegl1-mesa-dev libegl1-mesa-drivers libelf1 \
libelfg0 libexpat1-dev libflac8 libfontconfig1 libfontconfig1-dev \ 
libfontenc1 libfreetype6 libfreetype6-dev libgbm-dev libgbm1 libgcc-4.8-dev \
libgcrypt11-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common \
libgdk-pixbuf2.0-dev libgl1-mesa-dev libgl1-mesa-dri libgl1-mesa-glx \
libglapi-mesa libgles2-mesa libgles2-mesa-dev libglib2.0-bin libglib2.0-data \
libglib2.0-dev libglu1-mesa libglu1-mesa-dev libgmp10 libgnutls-dev \
libgnutlsxx27 libgomp1 libgpg-error-dev libgraphite2-3 libgssrpc4 \
libgstreamer-plugins-base0.10-0 libgstreamer-plugins-base0.10-dev \
libgstreamer0.10-0 libgstreamer0.10-dev libgtk2.0-0 libgtk2.0-common \
libgtk2.0-dev libharfbuzz-dev libharfbuzz-gobject0 libharfbuzz-icu0 \
libharfbuzz0b libice-dev libice6 libicu-dev libicu52 libisl10 libitm1 \
libjasper1 libjbig0 libjpeg-dev libjpeg-turbo8 libjpeg-turbo8-dev libjpeg8 \
libjpeg8-dev libkadm5clnt-mit9 libkadm5srv-mit9 libkdb5-7 libkrb5-dev \
libllvm3.4 libltdl-dev libltdl7 liblzo2-2 libmirclient-dev libmirclient7 \
libmirclientplatform-mesa libmirprotobuf-dev libmirprotobuf0 libmpc3 \
libmpfr4 libmysqlclient-dev libmysqlclient18 libodbc1 libogg0 \
libopenvg1-mesa libopenvg1-mesa-dev liborc-0.4-0 libp11-kit-dev \
libpango-1.0-0 libpango1.0-dev libpangocairo-1.0-0 libpangoft2-1.0-0 \
libpangoxft-1.0-0 libpciaccess0 libpcre3-dev libpcrecpp0 libpipeline1 \
libpixman-1-0 libpixman-1-dev libpng12-dev libpq-dev libpq5 libprotobuf-dev \
libprotobuf-lite8 libprotobuf8 libpthread-stubs0-dev libpulse-dev \
libpulse-mainloop-glib0 libpulse0 libpython-stdlib libpython2.7-minimal \
libpython2.7-stdlib libpython3.4 libquadmath0 libsm-dev libsm6 libsndfile1 \
libsp1c2 libsqlite3-dev libssl-dev libstdc++-4.8-dev libsybdb5 \
libsystemd-login0 libtasn1-6-dev libthai-data libthai0 libtiff5 \
libtimedate-perl libtsan0 libudev-dev libunistring0 libvorbis0a \
libvorbisenc2 libwayland-client0 libwayland-cursor0 libwayland-dev \
libwayland-egl1-mesa libwayland-server0 libx11-6 libx11-data libx11-dev \
libx11-xcb-dev libx11-xcb1 libxau-dev libxau6 libxaw7 libxcb-dri2-0 \
libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev \
libxcb-icccm4 libxcb-icccm4-dev libxcb-image0 libxcb-image0-dev \
libxcb-keysyms1 libxcb-keysyms1-dev libxcb-present-dev libxcb-present0 \
libxcb-randr0 libxcb-randr0-dev libxcb-render-util0 libxcb-render-util0-dev \
libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev \
libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-sync1 libxcb-util0 \
libxcb-xfixes0 libxcb-xfixes0-dev libxcb-xkb-dev libxcb-xkb1 libxcb1 \
libxcb1-dev libxcomposite-dev libxcomposite1 libxcursor-dev libxcursor1 \
libxdamage-dev libxdamage1 libxdmcp-dev libxdmcp6 libxext-dev libxext6 \
libxfixes-dev libxfixes3 libxfont1 libxft-dev libxft2 libxi-dev libxi6 \
libxinerama-dev libxinerama1 libxkbcommon-dev libxkbcommon-x11-0 \
libxkbcommon-x11-dev libxkbcommon0 libxkbfile1 libxml2-dev libxml2-utils \
libxmu6 libxmuu1 libxpm4 libxrandr-dev libxrandr2 libxrender-dev libxrender1 \
libxshmfence-dev libxshmfence1 libxt6 libxtst-dev libxtst6 libxxf86vm-dev \
libxxf86vm1 linux-libc-dev make man-db mesa-common-dev mircommon-dev \
mysql-common odbcinst odbcinst1debian2 patch pkg-config pkg-kde-tools \
po-debconf python python-minimal python2.7 python2.7-minimal sgml-data \
shared-mime-info sp unixodbc unixodbc-dev x11-common x11-xkb-utils \
x11proto-composite-dev x11proto-core-dev x11proto-damage-dev \
x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev x11proto-input-dev \
x11proto-kb-dev x11proto-randr-dev x11proto-record-dev x11proto-render-dev \
x11proto-xext-dev x11proto-xf86vidmode-dev x11proto-xinerama-dev xauth \
xorg-sgml-doctools xserver-common xtrans-dev xvfb zlib1g-dev"

# add repositories
# RUN \
# plex home theater
# add-apt-repository ppa:plexapp/plexht

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST $QT_BUILD_APTLIST -qy

# build qt
RUN mkdir -p /tmp && \
cd /tmp && \
wget http://download.qt.io/development_releases/qt/5.6/5.6.0-beta/single/qt-everywhere-opensource-src-5.6.0-beta.7z && \
7z x qt-everywhere-opensource-src-5.6.0-beta.7z && \
cd qt-everywhere-opensource-src-5.6.0-beta && \
dos2unix -k -o configure && \
make && \
make install && \
cd qtwebengine && \
qmake && \
make && \
make install

# cleanup 
RUN cd / && \
apt-get purge --remove $BUILD_APTLIST $QT_BUILD_APTLIST -y && \
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
