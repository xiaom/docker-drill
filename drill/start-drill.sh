#!/bin/bash
docker run -d -P -h $1 --name $1 --dns 172.17.42.1 xiaom/drill

