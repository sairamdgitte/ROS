#!/bin/bash

sudo apt-get update -y

# Install melodic desktop full
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install curl -y # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update -y 
sudo apt install ros-melodic-desktop-full -y
echo "###################################
	######## Ros-melodic installed#######
	#####################################"
# Install catkin tools
sudo apt install python-catkin-tools -y

echo "###################################
	######## Python catkin installed#######
	#####################################"

# Install additional packages
sudo apt-get install python-rosinstall -y

sudo apt-get install ros-melodic-tf-* -y

sudo apt-get install ros-melodic-pcl-msgs ros-melodic-mav-msgs ros-melodic-mavros ros-melodic-octomap-* ros-melodic-geographic-msgs libgeographic-dev -y

echo "###################################
	######## Ros additional packages installed#######
	#####################################"
	

# Setup the environment variable
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc -y
source ~/.bashrc


# Create a workspace directory
mkdir spot-ws
cd spot-ws

# Create a src package directory
mkdir -p src
cd src

git clone https://github.com/clearpathrobotics/spot_ros.git
cd .. 

catkin_make
source devel/setup.bash