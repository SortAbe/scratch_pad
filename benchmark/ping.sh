#!/usr/bin/bash

i=0
argumnet=' '
for ip in "$@";do
    index=$((i % 10))
    argumnet="$argumnet $ip"
    if [[ index -eq 9 ]];then
        /usr/sbin/fping -c1 -t270 $argumnet 1>>/tmpfs/icmp 2>/dev/null &
        argumnet=' '
    fi
    ((i++))
done
/usr/sbin/fping -c1 -t270 $argumnet 1>>/tmpfs/icmp 2>/dev/null &
