#!/bin/bash

clear
which docker > /dev/null 2>&1

if [ ${?} -eq 0 ]
then
	docker info > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		echo "--------------------------"
		echo "docker container run alpine ls -l"
		docker container run alpine ls -l
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
	
		echo "--------------------------"
		echo "docker container run alpine echo 'hello world'"
		docker container run alpine echo 'hello world'
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
	
		echo "--------------------------"
		echo "docker container run alpine /bin/sh"
		docker container run alpine /bin/sh
		echo 
		echo "<<< Press return to continue >>> "
		read ANS

		echo "--------------------------"
		echo "docker container ls"
		docker container ls 
		echo 
		echo "<<< Press return to continue >>> "
		read ANS

		echo "--------------------------"
		echo "docker container ls -a"
		docker container ls -a
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
	else
		echo "Docker is not running on this system"
	fi
else
	echo "Docker does not seem to be setup for this environment,  Please make sure docker is installed and in your path"
fi
