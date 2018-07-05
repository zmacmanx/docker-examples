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
		echo "Docker uses images to run processes.  Put simply images are programs/executibles that are self-contained and "
		echo "can be run.  A list of these images."
		echo ">> docker image ls"
		docker image ls
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		clear
		echo "--------------------------"
		echo "Now that we have a clean environment, lets pull an image called alpine.  Alpine is a small linux footprint to "
		echo "run commands.  Think of the pull the command as a search to find an item and put it in your shopping cart. "
		echo "In this case it is an executiable known as an image and the running of it is a container "
		echo ">> docker image pull alpine"
		docker image pull alpine
		echo
		echo "<<< Press return to continue >>> "
		read ANS
	
		clear
		echo "--------------------------"
		echo "The image was found and the pulled down to the local repository with all associated checksums ready to be run "
		echo "In the next section we will show you have to run the image, but for now notice that the ls command will show "
		echo "all alpine image and associate information "
		echo ">> docker image ls"
		docker image ls
		echo
		echo "<<< Press return to continue >>> "
		read ANS
	else
		echo "Docker is not running on this system"
	fi
else
	echo "Docker does not seem to be setup for this environment,  Please make sure docker is installed and in your path"
fi
