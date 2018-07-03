#!/bin/bash

clear
which docker > /dev/null 2>&1

if [ ${?} -eq 0 ]
then
	docker info > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		echo "y" | docker system prune > /dev/null 2>&1
		docker rmi -f `docker images -aq` >/dev/null 2>&1

		echo "--------------------------"
		echo ">> docker container run -it ubuntu bash"
		echo ">> apt-get update"
		echo ">> apt-get install -y figlet"
		echo ">> figlet 'hello world'"
		echo ">> exit"
		echo
		echo "apt-get update; apt-get install -y figlet; figlet 'hello-world'" | docker container run -i ubuntu /bin/bash
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
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

		echo "--------------------------"
		echo
		echo ">> docker container diff ${CONTAINER_ID}"
		echo
		docker container diff ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo
		echo ">> docker container commit ${CONTAINER_ID}"
		echo
		docker container commit ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo ">> docker image ls"
		docker image ls
		IMAGE_ID=`docker image ls | grep "^<none>" | awk '{ print $3 }'`
		echo
		echo "Using IMAGE ID: ${IMAGE_ID}"
		echo "<<< Press return to continue >>> "
		read ANS

		echo "--------------------------"
		echo ">> docker image tag ${IMAGE_ID} ourfiglet"
		docker image tag ${IMAGE_ID} ourfiglet
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		echo "--------------------------"
		echo ">> docker image ls"
		docker image ls
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		echo "--------------------------"
		echo ">> docker container run ourfiglet figlet 'hello'"
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
