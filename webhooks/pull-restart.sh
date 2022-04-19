#!/bin/sh

# pull docker image
#docker pull jacobapone/project5:latest

# kill old container
docker stop p5site

# docker pruning
docker system prune -f -a

# pull image
docker pull jacobapone/project5:latest

# start new image
docker run -d --name p5site -p 80:80 jacobapone/project5:latest
