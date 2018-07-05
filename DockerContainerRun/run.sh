#!/bin/bash

clear
which docker > /dev/null 2>&1

if [ ${?} -eq 0 ]
then
	docker info > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		clear
		echo
		echo "--------------------------"
		echo "Start with a little clean-up to have as clean a slate as possible"
		echo "And display the current state before we begin"
		echo ">> docker container ls -a"
		echo 
		echo "y" | docker system prune > /dev/null 2>&1
		docker container ls -a
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		
		clear
		echo
		echo "--------------------------"
		echo "Run 'ls -l' command in the new Docker container"
		echo "The results are showing the location inside of the container"
		echo ">> docker container run alpine ls -l"
		echo
		docker container run alpine ls -l
		echo 
		echo "<<< Press return to continue >>> "
		read ANS

		echo
		echo "--------------------------"
		echo "Run 'echo ...' command in the new Docker container"
		echo ">> docker container run alpine echo 'hello world'"
		echo
		docker container run alpine echo 'hello world'
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
	
		echo
		echo "--------------------------"
		echo "Run request for shell in the new Docker container. Note the absence of any output"
		echo ">> docker container run alpine sh"
		echo
		docker container run alpine sh
		echo 
		echo "<<< Press return to continue >>> "
		read ANS

		echo
		echo "--------------------------"
		echo "Lets confirm that no containers are actively running at the moment"
		echo ">> docker container ls"
		echo
		docker container ls 
		echo 
		echo "<<< Press return to continue >>> "
		read ANS

		echo
		echo "--------------------------"
		echo "However, we can observe the history of containers along with the commands they executed"
		echo ">> docker container ls -a"
		echo
		docker container ls -a
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
	else
		echo "Docker does not appear to be running on your system. Please, start the service."
	fi
else
	echo "Docker does not seem to be setup for this environment. Please, make sure docker is installed and in your path."
fi