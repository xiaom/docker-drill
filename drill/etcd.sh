#!/bin/sh
exec /opt/etcd/bin/etcd >> /var/log/etcd.log 2>&1
