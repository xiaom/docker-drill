#!/bin/sh
sudo docker rm -f $(docker ps | grep drill | awk '{print  $1}')
