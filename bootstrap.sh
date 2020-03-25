#!/bin/bash
docker run -d --name redis1 -p 7000:7000 -v $PWD/7000/redis.conf:/etc/redis.conf redis:5.0.5 redis-server /etc/redis.conf
docker run -d --name redis2 -p 7001:7001 -v $PWD/7001/redis.conf:/etc/redis.conf redis:5.0.5 redis-server /etc/redis.conf
docker run -d --name redis3 -p 7002:7002 -v $PWD/7002/redis.conf:/etc/redis.conf redis:5.0.5 redis-server /etc/redis.conf
docker run -d --name redis4 -p 7003:7003 -v $PWD/7003/redis.conf:/etc/redis.conf redis:5.0.5 redis-server /etc/redis.conf
docker run -d --name redis5 -p 7004:7004 -v $PWD/7004/redis.conf:/etc/redis.conf redis:5.0.5 redis-server /etc/redis.conf
docker run -d --name redis6 -p 7005:7005 -v $PWD/7005/redis.conf:/etc/redis.conf redis:5.0.5 redis-server /etc/redis.conf

## manually setup the cluster
redis-cli --cluster create 172.17.0.6:7000 172.17.0.8:7001 \
172.17.0.9:7002 172.17.0.10:7003 172.17.0.11:7004 172.17.0.12:7005 \
--cluster-replicas 1