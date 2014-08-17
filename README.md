# Build the image

```
docker build -t xiaom/drill .
```

# Create a container (run an image)

```
# docker run --name [container name] -p [port to access:port exposed] -i -t [memcached image name]
#	-v, -volume=[]            Bind mount a volume (e.g., from the host: -v /host:/container, from docker: -v /container)
#	-h, --hostname=""          Container host name
#	-P, --publish-all=false    Publish all exposed ports to the host interfaces
docker run --name zoo1 -h zoo1 -dns 172.17.42.1 -P xiaom/drill
```

# Expost ports

- https://github.com/wsargent/docker-cheat-sheet#exposing-ports
- https://www.digitalocean.com/community/tutorials/docker-explained-how-to-create-docker-containers-running-memcached

# Runtime docker configuration

- http://ask.projectatomic.io/en/question/72/ansible-run-time-docker-configuration/
- The trivial will use sed/perl update it on the fly

# Service Discovery and DNS server

This is the most important one.

## Poor Man's DNS Solution

Simply use current host as the DNS server

```
# /etc/dnsmasq.conf
listen-address=0.0.0.0
interface=lo
interface=eth0
interface=docker0
resolv-file=/etc/resolv.dnsmasq.conf
conf-dir=/opt/docker/dnsmasq.d         # <== Here !
```

dns

```
$ container='db'
$ new_ip=$(docker inspect $container | grep IPAddress | cut -f4 -d'"')
$ echo "host-record=$container,$new_ip" > /opt/docker/dnsmasq.d/0host_$container
$ service dnsmasq restart
```

# Set zookeeper

- http://zookeeper-user.578899.n2.nabble.com/Starting-zookeeper-in-replicated-mode-td5205720.html

