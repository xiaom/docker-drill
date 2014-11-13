#!/bin/sh
# https://github.com/crosbymichael/skydock


# SkyDNS
# ------
#
# `-p 127.17.42.1:53:53/udp`:
#       tells docker to bind skydns port 53/udp to the docker0 bridge's IP.
# `-nameserver 8.8.8.8:53`:
#       gives skydns a nameserver of 8.8.8.8:53 to forward queries that are not for service discovery to a real nameserver.
# `-domain docker`:
#       This is the domain that you want skydns to resolve DNS queries for. 
#       Any requests for services *.docker will be resolved by skydns for service discovery.
docker run -d -p 172.17.42.1:53:53/udp --name skydns crosbymichael/skydns -nameserver 8.8.8.8:53 -domain docker

# SkyDock
# -------
#
# `-v /var/run/docker.sock:/docker.sock`
# `-ttl 30`: time to live when registering a service
# `-enviroment dev`: enviroment name
# `-s /docker.sock`: path to the docoker unix socket
# `-name skydns`: name of the dns server (notes the option  is for skydock and is different from `--name`)
docker run -d -v /var/run/docker.sock:/docker.sock --name skydock crosbymichael/skydock -ttl 30 -environment dev -s /docker.sock -domain docker -name skydns

