#!/bin/bash

clear
which docker > /dev/null 2>&1

if [ ${?} -eq 0 ]
then
	docker info > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		echo ">>>>>>>>>>>>>>>>>>>>>>>>>>"
		echo "docker image pull alpine"
		docker image pull alpine
		echo ">>>>>>>>>>>>>>>>>>>>>>>>>>"
		echo 
		read ANS
	
		echo ">>>>>>>>>>>>>>>>>>>>>>>>>>"
		echo "docker image ls"
		docker image ls
		echo ">>>>>>>>>>>>>>>>>>>>>>>>>>"
		echo 
		read ANS
	else
		echo "Docker is not running on this system"
	fi
else
	echo "Docker does not seem to be setup for this environment,  Please make sure docker is installed and in your path"
fi
