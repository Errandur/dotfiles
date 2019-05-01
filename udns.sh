#!/bin/bash
chown $1 /etc/resolv.conf;
echo 'nameserver 1.1.1.1' > /etc/resolv.conf
cat /etc/resolv.conf
