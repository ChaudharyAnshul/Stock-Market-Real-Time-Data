#!/bin/bash

docker exec -it kafka bash -v -c '/opt/kafka/bin/kafka-topics.sh --create --topic stock_stream_topic --partitions 1 --replication-factor 1 --bootstrap-server localhost:9092'
