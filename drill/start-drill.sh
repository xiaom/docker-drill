#!/bin/bash
docker run -d -P -h $1 --link $2:S2 --name $1 xiaom/drill

