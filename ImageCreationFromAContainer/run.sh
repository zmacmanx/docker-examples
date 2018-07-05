#!/bin/bash

clear
which docker > /dev/null 2>&1

if [ ${?} -eq 0 ]
then
	docker info > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		clear
		echo "Clean up environment and prune the system information"
		echo
		echo "Cleaning...."

		sleep 1
		echo "y" | docker system prune > /dev/null 2>&1
		docker rmi -f `docker images -aq` >/dev/null 2>&1
		echo "<<< Press return to continue >>> "
		read ANS

		clear
		echo "--------------------------"
		echo "You need to run a bash shell inside of a ubuntu container.  Once the container is running "
		echo "a update of the system is required to make sure we have the latest and greatesh patch level. "
		echo "Finally, add the command figlet to the ubuntu image, and test it with hello world.  You must "
		echo "Exit the container to return the hosting system."
		echo
		echo ">> docker container run -it ubuntu bash"
		echo ">> apt-get update"
		echo ">> apt-get install -y figlet"
		echo ">> figlet 'hello world'"
		echo ">> exit"
		echo
		echo "apt-get update; apt-get install -y figlet; figlet 'hello-world'" | docker container run -i ubuntu bash
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		clear
		echo "--------------------------"
		echo "Lets look at what the result of running the last command was on the local register/containers list.  Use -a "
		echo "to show all containers"
		echo
		echo ">> docker container ls -a"
		echo
		docker container ls -a
		CONTAINER_ID=`docker container ls -a | grep "ubuntu" | grep "bash" | awk '{ print $1 }'`
		echo
		echo "Using container: ${CONTAINER_ID}"
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		clear
		echo "--------------------------"
		echo "One of the advantages to docker containers is the ability to get a complete accounting of the image. "
		echo "The container allows for a diff process that shows every file that has been added, deleted or changed. "
		echo
		echo ">> docker container diff ${CONTAINER_ID}"
		echo
		docker container diff ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		clear
		echo "--------------------------"
		echo "Now that the image has all the components we desire, we want to save them as a single image for execution. "
		echo "The commit process will address this requirement and produce all the associate keys and checksums"
		echo
		echo ">> docker container commit ${CONTAINER_ID}"
		echo
		docker container commit ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		clear
		echo "--------------------------"

		echo "Once the commit has completed and new image is create for the local repository.  To see the effect, "
		echo "run a listing of the images and look for none as the result of the commit. "
		echo ""
		echo ">> docker image ls"
		echo ""
		docker image ls
		IMAGE_ID=`docker image ls | grep "^<none>" | awk '{ print $3 }'`
		echo
		echo "Using IMAGE ID: ${IMAGE_ID}"
		echo "<<< Press return to continue >>> "
		read ANS

		clear
		echo "--------------------------"
		echo "Now that the image is commited and available for use, we need to make it easier to identify and use. "
		echo "Utilizing the tag command you can name and versionize the new image.  Lets name it ourfiglet for this "
		echo "excerise. "
		echo ""
		echo ">> docker image tag ${IMAGE_ID} ourfiglet"
		echo ""
		docker image tag ${IMAGE_ID} ourfiglet
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		clear
		echo "--------------------------"
		echo "Lets check the image again.  We now see the name ourfiglet has been added to the image.  This"
		echo "make it easier to identify and use as single executable."
		echo ""
		echo ">> docker image ls"
		echo ""
		docker image ls
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		clear
		echo "--------------------------"
		echo "Now the new image is ubuntu and figlet together and can be used as a single executable. "
		echo "This allows us to simple run the image with our image name."
		echo ""
		echo ">> docker container run ourfiglet figlet 'hello'"
		echo ""
		docker container run ourfiglet figlet 'hello'
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		echo "y" | docker system prune > /dev/null 2>&1
		docker rmi -f `docker images -aq` >/dev/null 2>&1
	else
		echo "Docker is not running on this system"
	fi
else
	echo "Docker does not seem to be setup for this environment,  Please make sure docker is installed and in your path"
fi
