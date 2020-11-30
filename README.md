# OpenSSH on Alpine Linux
[![](https://badge.imagelayers.io/rlesouef/alpine-transmission:latest.svg)](https://imagelayers.io/?images=rlesouef/alpine-transmission:latest 'Get your own badge on imagelayers.io')

Usage for development 
-----

### Create and deploy development container with gdb server (port 2159) and ssh server (port 2222)

`./create.sh` - Create the development docker container

`./run.sh`    - Run the development docker container

`./stop.sh`   - Stop any running development docker container

Usage for production
--------

### Prereqs

Build WiserHomeLinux binary on WISER-4096 or similar branch.
You can build it manually with the top level Wiser.sln file (VisualGDB) or you can let TeamCity will build it for you.
Copy this binary into `./prod/WiserHomeLinux`

### Deploy using Docker Compose

From schneider hub:

```
cd prod
sudo docker-compose up
```
