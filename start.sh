#!/bin/sh
docker-compose up -d bootstrap
docker-compose up -d --scale eth3 eth
docker-compose up -d miner1
docker-compose up -d miner2
docker-compose up -d miner3
