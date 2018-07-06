docker system prune
docker volume prune
docker network prune

docker rmi -f `docker images -qa`
