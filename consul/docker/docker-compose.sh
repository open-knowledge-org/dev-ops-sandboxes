#!/usr/bin/env bash
sudo setenforce 0
docker network create consul
sudo docker-compose down
sudo docker-compose -f docker-compose.yml up --build -d --remove-orphans
sudo docker-compose ps
