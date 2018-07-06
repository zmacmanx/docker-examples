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
		echo "Start with a little clean-up to have as clean a slate as possible."
		echo "And display the current state before we begin"
		echo ">> docker container ls -a"
		echo 
		echo "y" | docker system prune > /dev/null 2>&1
		docker rmi -f `docker images -aq` >/dev/null 2>&1
		docker container ls -a
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		clear
		echo
		echo "--------------------------"
		echo "Start first container with the interactive shell and create 'hello.txt' file."
		echo "Once we confirm it is in the system, we will exit from container, which will effectively stop it."
		echo "Note: first time image has to be pulled from the internet"
		echo ">> docker container run -it alpine sh"
		echo ">> echo 'hello world' > hello.txt"
		echo ">> ls -l"
		echo ">> exit"
		echo
		echo "echo 'hello world' > hello.txt; ls -l" | docker container run -i alpine sh
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		
		echo
		echo "--------------------------"
		echo "Execute 'ls -l' one more time to validate we are not in the container anymore: "
		echo "file 'hello.txt' is not present in the current directory"
		echo ">> ls -l"
		echo
		ls -l
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		
		echo
		echo "--------------------------"
		echo "Start a container with another 'ls -l' command to check if we can view the 'hello.txt' inside:"
		echo "file 'hello.txt' is not present because each 'docker run' creates a separate container on invocation"
		echo ">> docker container run alpine ls -l"
		echo
		docker container run alpine ls -l
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		
		echo
		echo "--------------------------"
		echo "At this point we should have 2 containers, for 2 invocations we performed" 
		echo ">> docker container ls -a"
		echo
		docker container ls -a
		CONTAINER_ID=`docker container ls -a | grep "sh" | awk '{ print $1 }'`
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		
		echo
		echo "--------------------------"
		echo "We can start any of the stopped containers. For this step we will use the container with previous 'sh' command."
		echo "Using Container ID: ${CONTAINER_ID}. Output of the 'docker start' will re-confirm the ID of the started container"
		echo
		echo ">> docker container start ${CONTAINER_ID}"
		echo
		docker container start ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS

		echo
		echo "--------------------------"
		echo "Lets print the list of running container to confirm that we have something active."
		echo "Note: eliminating -a to only list active (running) containers"
		echo
		echo ">> docker container ls"
		echo
		docker container ls 
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		
		echo
		echo "--------------------------"
		echo "In order to perform a command in the running container we use 'docker exec' syntax."
		echo "We will perform 'ls -l' in order to see if this container still has 'hello.txt' file inside"
		echo
		echo ">> docker container exec ${CONTAINER_ID} ls -l"
		echo
		docker container exec ${CONTAINER_ID} ls -l
		echo
		echo "<<< Press return to continue >>> "
		read ANS
	
		echo
		echo "--------------------------"
		echo "Another option to see if there are any changes in the container (like added/modified files) for both stopped and running containers"
		echo "is to use 'docker diff' command. It will provide information on WHAT has changed but not HOW"
		echo ">> docker container diff ${CONTAINER_ID}"
		echo
		docker container diff ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		
		#echo
		#echo "--------------------------"
		#echo
		#echo ">> docker inspect ${CONTAINER_ID}"
		#echo
		#docker inspect ${CONTAINER_ID}
		#echo
		#echo "<<< Press return to continue >>> "
		#read ANS
		
		#echo
		#echo "--------------------------"
		#echo
		#echo ">> docker inspect ${CONTAINER_ID} | grep MergedDir"
		#echo
		#docker inspect ${CONTAINER_ID} | grep '"MergedDir":'
		#echo
		#echo "<<< Press return to continue >>> "
		#read ANS
		
		echo
		echo "--------------------------"
		echo "A running container can be stopped when it is not needed. There are 2 ways to do that: stop or kill."
		echo "'stop' is the preferred option as it will attempt a graceful shutdown"
		echo
		echo ">> docker container stop ${CONTAINER_ID}"
		echo
		docker container stop ${CONTAINER_ID}
		echo
		echo "<<< Press return to continue >>> "
		read ANS
		
		#echo
		#echo "--------------------------"
		#echo "Using Container ID: ${CONTAINER_ID}"
		#echo
		#echo ">> docker container kill ${CONTAINER_ID}"
		#echo
		#docker container kill ${CONTAINER_ID} 2>/dev/null
		#echo
		#echo "<<< Press return to continue >>> "
		#read ANS
		
		echo
		echo "--------------------------"
		echo "Finally, lets confirm that the container was stopped"
		echo
		echo ">> docker container ls"
		echo
		docker container ls
		echo
		echo "<<< Press return to continue >>> "
		read ANS
	else
		echo "Docker does not appear to be running on your system. Please, start the service"
	fi
else
	echo "Docker does not seem to be setup for this environment. Please, make sure docker is installed and in your path"
fi