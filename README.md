**NOTES:** The document is outdated and need to be update later. We did not follow the best practice of docker container and use it a VMs. The plan is to clean it up in next iteration.

# Build the image

There is a Dockerfile under each service folder. For example, under drill

```
cd drill
docker build -t xiaom/drill .
```

# Start the contianer

`docker-compose` is your friend.

## Create a container (run an image)

```
# docker run --name [container name] -p [port to access:port exposed] -i -t [memcached image name]
#	-v, -volume=[]            Bind mount a volume (e.g., from the host: -v /host:/container, from docker: -v /container)
#	-h, --hostname=""          Container host name
#	-P, --publish-all=false    Publish all exposed ports to the host interfaces
docker run --name zoo1 -h zoo1 -dns 172.17.42.1 -P xiaom/drill
```

## Expost ports

- https://github.com/wsargent/docker-cheat-sheet#exposing-ports
- https://www.digitalocean.com/community/tutorials/docker-explained-how-to-create-docker-containers-running-memcached

# Runtime docker configuration

In the entrypoint, we use sed/perl update it on the fly

- http://ask.projectatomic.io/en/question/72/ansible-run-time-docker-configuration/

# Service Discovery and DNS server

The problem of linking with containers is that if you restart the linked contaienr (say, zookeeper) and the ip address of that container changes. What will happen? Answer, we need to restart that container.
This is the most important one.

## Poor Man's DNS Solution: Manually Update Local DNS

Simply use current host as the DNS server

    # /etc/dnsmasq.conf
    listen-address=0.0.0.0
    interface=lo
    interface=eth0
    interface=docker0
    resolv-file=/etc/resolv.dnsmasq.conf
    conf-dir=/opt/docker/dnsmasq.d         # <== Here !

dns

    $ container='db'
    $ new_ip=$(docker inspect $container | grep IPAddress | cut -f4 -d'"')
    $ echo "host-record=$container,$new_ip" > /opt/docker/dnsmasq.d/0host_$container
    $ service dnsmasq restart

## DNS for Service Discovery

We use SkyDNS for now and SkyDock is an adapter on top of SkyDNS for this purpose.

# References

- [Starting ZooKeeper in Replicated Mode](http://zookeeper-user.578899.n2.nabble.com/Starting-zookeeper-in-replicated-mode-td5205720.html)


