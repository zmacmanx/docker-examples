#!/bin/bash

clear
which docker > /dev/null 2>&1

if [ ${?} -eq 0 ]
then
	docker info > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		clear
		echo "--------------------------"
		echo "First we need to clean all existing images that may exist from running containers in previous sessions.  "
		echo "The commands that follow will clear all images and containers from the list: "
		echo ""
		echo ">> docker system prune"
		echo ">> docker rmi -f \`docker images -aq\`"
		echo "y" | docker system prune > /dev/null 2>&1
		docker rmi -f `docker images -aq` >/dev/null 2>&1
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		clear
		echo "--------------------------"
		echo "Docker networks are based on SDN technology.  Exploring this primitive we will discover the different types "
		echo "network types and the use for each of them in the docker architecture. "
		echo ""
		echo ">> docker network ls"
		echo ""
		docker network ls
		echo
		echo "<<< Press return to continue >>> "
		read ANS
	else
		echo "Docker is not running on this system"
	fi
else
	echo "Docker does not seem to be setup for this environment,  Please make sure docker is installed and in your path"
fi
