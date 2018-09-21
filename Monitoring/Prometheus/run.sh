#!bash

docker run -p 9090:9090 -v /prometheus-data \
	prom/prometheus
        --config=/prometheus-data/prometh
