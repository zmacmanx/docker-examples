#!/bin/bash

clear
which docker > /dev/null 2>&1

if [ ${?} -eq 0 ]
then
	docker info > /dev/null 2>&1
	if [ ${?} -eq 0 ]
	then
		docker rmi -f `docker images -aq` >/dev/null 2>&1

		echo "--------------------------"
		echo ">> docker container run -it alpine /bin/sh"
		echo ">> echo 'hello world' > hello.txt"
		echo ">> ls"
		echo ">> exit"
		echo
		echo "echo 'hello world' > hello.txt; ls" | docker container run -i alpine /bin/sh
		echo
		echo "<<< Press return to continue >>> "
		read ANS
	else
		echo "Docker is not running on this system"
	fi
else
	echo "Docker does not seem to be setup for this environment,  Please make sure docker is installed and in your path"
fi
