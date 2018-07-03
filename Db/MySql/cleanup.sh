docker-compose down

docker system prune <<!EOF
y
!EOF
docker rmi -f `docker image ls -q`
