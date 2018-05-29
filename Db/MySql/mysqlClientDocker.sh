#!/bin/bash

export MYSQL_DB_NAME=marcdb 
export MYSQL_ENV_MYSQL_ROOT_PASSWORD=anthony-1
export MYSQL_PORT_3306_TCP_ADDR=127.0.0.1
export MYSQL_PORT_3306_TCP_PORT=3306

docker run -it --link ${MYSQL_DB_NAME}:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
