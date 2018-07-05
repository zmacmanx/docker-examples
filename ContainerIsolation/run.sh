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
		echo ">> docker container run -it alpine sh"
		echo ">> echo 'hello world' > hello.txt"
		echo ">> ls"
		echo ">> exit"
		echo
		echo "echo 'hello world' > hello.txt; ls" | docker container run -i alpine sh
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo ">> ls -l"
		echo
		ls -l
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo ">> docker container run alpine ls -l"
		echo
		docker container run alpine ls -l
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo ">> docker container ls -a"
		echo
		docker container ls -a
		CONTAINER_ID=`docker container ls -a | grep '\"sh\"' | awk '{ print $1 }'`
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo "Using Container ID: ${CONTAINER_ID}"
		echo
		echo ">> docker container start ${CONTAINER_ID}"
		echo
		docker container start ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo "Container ID: ${CONTAINER_ID}"
		echo
		echo ">> docker container ls"
		echo
		docker container ls 
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo
		echo ">> docker container exec ${CONTAINER_ID} ls"
		echo
		docker container exec ${CONTAINER_ID} ls
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo
		echo ">> docker diff ${CONTAINER_ID}"
		echo
		docker diff ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo
		echo ">> docker inspect ${CONTAINER_ID}"
		echo
		docker inspect ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo
		echo ">> docker inspect ${CONTAINER_ID} | grep MergedDir"
		echo
		docker inspect ${CONTAINER_ID} | grep '"MergedDir":'
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo "Using Container ID: ${CONTAINER_ID}"
		echo
		echo ">> docker container stop ${CONTAINER_ID}"
		echo
		docker container stop ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo "Using Container ID: ${CONTAINER_ID}"
		echo
		echo ">> docker container kill ${CONTAINER_ID}"
		echo
		docker container kill ${CONTAINER_ID} 2>/dev/null
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		echo
	else
		echo "Docker is not running on this system"
	fi
else
	echo "Docker does not seem to be setup for this environment,  Please make sure docker is installed and in your path"
fi
