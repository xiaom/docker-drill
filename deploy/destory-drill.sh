#!/bin/sh
sudo docker rm -f $(docker ps | grep "/sbin/my_init" | awk '{print  $1}')
