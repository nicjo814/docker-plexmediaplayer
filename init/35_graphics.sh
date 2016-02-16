#!/bin/bash
cd /tmp

gfx_driver=`lshw -c video | awk '/configuration: driver/{print $2}' | cut -d '=' -f 2`
case $gfx_driver in
    nvidia )
        echo "NVIDIA Driver detected on host system"
        gfx_version=`cat /proc/driver/nvidia/version | head -n 1 | awk '{ print $8 }'`
        echo "NVIDIA driver version on host system is $gfx_version"
        if [ ! -f "/usr/share/nvidia/nvidia-application-profiles-${gfx_version}-rc" ]; then
                echo "Downloading new NVIDIA driver version ${gfx_version}"
                nvidia_driver_uri=http://us.download.nvidia.com/XFree86/Linux-x86_64/${gfx_version}/NVIDIA-Linux-x86_64-${gfx_version}.run
                curl -o nvidia-driver.run $nvidia_driver_uri
                chmod 755 /tmp/nvidia-driver.run
                echo "Installing driver"
                /tmp/nvidia-driver.run -a -N --ui=none --no-kernel-module --run-nvidia-xconfig --silent
                echo "Driver installed"
        else
                echo "NVIDIA driver ${gfx_version} already installed"
        fi
        ;;
    ati_placeholder )
        ;;
esac
