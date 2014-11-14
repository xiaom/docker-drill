#!/bin/bash
set -x
for i in $(seq 3)
do
  docker-bash zoo$i sh -c "echo > /var/log/drill/drillbit.log && echo > /var/log/drill/drillbit.out"
done
set +x

