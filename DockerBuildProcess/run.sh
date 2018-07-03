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
		echo ">> Create a index.js file with the following:"
		echo 'var os = require("os");'
		echo 'var hostname = os.hostname("");'
		echo 'console.log("Hello from " + hostname);'
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
		echo
	
		echo "--------------------------"
		echo ">> Create a Dockerfile with the following:"
		echo 'FROM alpine'
		echo 'RUN apk update && apk add nodejs'
		echo 'COPY . /app'
		echo 'WORKDIR /app'
		echo 'CMD ["node", "index.js"]'
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
		echo
	
		echo "--------------------------"
		echo ">> docker image build -t hello.v0.1 ."
		docker image build -t hello.v0.1 .
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
		echo

		echo "--------------------------"
		echo ">> docker container run hello.v0.1"
		docker container run hello.v0.1
		echo 
		echo "<<< Press return to continue >>> "
		read ANS
	else
		echo "Docker is not running on this system"
	fi
else
	echo "Docker does not seem to be setup for this environment,  Please make sure docker is installed and in your path"
fi
