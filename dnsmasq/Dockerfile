# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.15

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
# make sure the package repository is up to date
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive


# Install build requirements
RUN apt-get update
RUN apt-get install -y dnsmasq
# Workaround for the 2267 bug
RUN /usr/bin/workaround-docker-2267
RUN dnsmasq

