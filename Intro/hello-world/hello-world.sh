#!/bin/bash
ANS=

#
# Clean up the environment
#
clear
docker system prune >/dev/null 2>&1 <<!EOF
y
!EOF
docker rmi -f `docker image ls -q` > /dev/null 2>&1

#
# Display the starting point
#
clear
echo "Notice the system has nothing in the queues"
echo
echo "Images:"
docker image ls

echo -e "\n\nProcesses:"
docker ps -a
echo -e "Press Enter To Continue >>>> \c"
read ANS

#
# Run hello world
#
clear
echo "Running a hello world program [docker run hello-world]. "
echo "Notice that the image does not exist locally.  "
echo -e "Docker will locate the required executes/images from the web and run the process"
echo -e "--------------------------------------------------------------------------------\n\n"
docker run hello-world
echo -e "--------------------------------------------------------------------------------\n\n"
echo -e "\n\nPress Enter To Continue >>>> \c"
read ANS

#
# Show the impact of running hello-world
#
CONTAINER_ID=`docker image ls -q hello-world`
clear
echo "Notice the system queues has changed"
echo "Images:"
docker image ls

echo -e "\n\nProcesses:"
docker ps -a
echo -e "\n\n\n\n"
echo -e "--------------------------------------------------------------------------------\n\n"
echo -e "Notice the container id ${CONTAINER_ID} that is attached to the hello-world image"
echo -e "The container name is used to create the container. it was run in the process list"
echo -e "Press Enter To Continue >>>> \c"
read ANS

#
# Rerun process again
#
clear
echo "Running a hello world program [docker run hello-world] a second time. "
echo "Notice that the image now exist locally.  The system will run the program image. "
echo -e "Docker will execute a second container but the same image. "
echo -e "--------------------------------------------------------------------------------\n\n"
docker run hello-world
echo -e "--------------------------------------------------------------------------------\n\n"
echo -e "Press Enter To Continue >>>> \c"
read ANS

#
# Show the results
#
echo -e "\n\n"
echo "Notice the system queues has changed: "
echo -e "--------------------------------------------------------------------------------\n\n"
echo "Images:"
docker image ls
echo -e "\n======================\n"
echo -e "Process:"
docker ps -a
