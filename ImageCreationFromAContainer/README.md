Build Docker Images

1. Commands
  2. docker container run -i ubuntu bash
    * apt-get update 
    * apt-get install -y figlet
    * figlet 'hello world'
    * exit
  2. docker container run -i ubuntu bash
    * docker container ls -a
      - CONTAINER_ID=`docker container ls -a | grep "ubuntu" | grep "bash" | awk '{ print $1 }'`
  2. docker container diff ${CONTAINER_ID}
  2. docker container commit ${CONTAINER_ID}
  2. docker image ls
    * IMAGE_ID=`docker image ls | grep "^<none>" | awk '{ print $3 }'`
  2. docker image tag ${IMAGE_ID} ourfiglet
  2. docker image ls
  2. docker container run ourfiglet figlet 'hello'
