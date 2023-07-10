# start with minimal ROS 2 Humble install
FROM ros:humble-ros-base

# install build deps for moos-ivp
RUN apt-get update \
    && apt-get install -y \
    subversion build-essential cmake \
    libfltk1.3-dev freeglut3-dev libpng-dev libjpeg-dev libxft-dev \
    libxinerama-dev libtiff5-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# clone the moos-ivp repo
RUN svn co \
    https://oceanai.mit.edu/svn/moos-ivp-aro/releases/moos-ivp-19.8.1 moos-ivp

# build
RUN cd moos-ivp \ 
    && ./build-moos.sh

RUN cd moos-ivp \ 
    && ./build-ivp.sh

# add moos-ivp executables to path
ENV PATH "$PATH:$WORKDIR/moos-ivp/bin"

# install a few more deps
RUN apt-get update \
    && apt-get install -y \
    libboost-all-dev libproj-dev libgpiod-dev libgps-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*