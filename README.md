Reinforcement learning for construction site robot
======

Robot that navigate through construction site using Q-learning written in python 3 powered by TensorFlow and Robot operating system  

How this work
------

```text
                        +------------------------------------+
                        |           Infrastructure           |
                        +------------------------------------+
                        |               Host OS              |
                        +------------------------------------+
                        |                Docker              |
                        +-----------+------------+-----------+
                        |           |            |           |
                        |    ROS    | TensorFlow |  RTABMAP  |
                        | Container |  Container | Container |
                        |           |            |           |
                        +-----------+------------+-----------+

```

Docker image contain Robot Operating System (ROS) and Machine Learning framework such as TensorFlow, Pytorch, Keras, etc.
You can switch whatever framework you like.

Hardware
------

- Raspberry Pi 3 Model B with Raspbian image SD card
- RGB-D or Stereo image Camera (Microsoft Kinect is highly recommended)
- Smart Robot Car kit
- Arduino UNO R3

How to assemble robot
------

Please check [wiki page](https://github.com/kanokkorn/RL-bot/wiki)

Required
------

- [Docker CE](https://docs.docker.com/install/linux/docker-ce/debian/#install-docker-ce) for Raspberry Pi
- MeshLab
- Python 3.6

Usage
------

1. Clone this repository.
1. For pre-setup run

```bash
sudo run.sh
```

- If the setup is done or you have your own setup then run this command

```bash
sudo docker-compose up
```

License
------

This project is under [BSD](https://github.com/kanokkorn/RL-bot/blob/master/LICENSE) license
