#!/bin/sh

# bash scipt that runs docker inspect on all containers and saved the output to docker-inspect-container_name.txt
for container in $(docker ps -a -q); do
    container_name=$(docker inspect --format="{{.Name}}" $container)
    docker inspect $container > docker-inspect-$container_name.txt
done