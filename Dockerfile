# Download base image ubuntu 16.04
FROM ubuntu:16.04
MAINTAINER kanokkorn <kanokorn@outlook.jp>

# Update Ubuntu Software repo
RUN apt-get update
RUN apt-get upgrade

# Add sources.list & add PPA key 
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Update again
RUN apt-get update
RUN apt-get upgrade

# Install ROS base
RUN apt install ros-melodic-ros-base
RUN apt install ros-melodic-slam-gmapping

# init ros-dep
RUN rosdep init
RUN rosdep update

# Env setup
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && source ~/.bashrc

# TensorFlow setup
RUN apt install libatlas-base-dev
RUN pip3 install tensorflow
