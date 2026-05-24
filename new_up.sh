#!/bin/bash

/usr/bin/sleep 10;
if /usr/sbin/ping -c 1 1.1.1.1 > /dev/null;then
    :;
else
    /usr/sbin/ip link set dev enp24s0f1 up;
fi
