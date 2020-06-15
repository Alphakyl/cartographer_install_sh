sudo apt-get update
sudo apt install -y python-wstool python-rosdep ninja-build python-catkin-tools
cd ~/
mkdir -p cartographer_ws/
cd ./cartographer_ws/
wstool init src
wstool merge -t src https://raw.githubusercontent.com/googlecartographer/cartographer_ros/master/cartographer_ros.rosinstall
wstool update -t src
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
cd ./src/
rm -rf cartograph*
git clone https://github.com/googlecartographer/cartographer_ros.git
git clone https://github.com/googlecartographer/cartographer.git
cd ../
source "/opt/ros/melodic/setup.bash"
catkin_make_isolated --install --use-ninja
