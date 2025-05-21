#!/bin/bash

for ((i = 0; i < 10; i++)); do
    curl -w "%{http_version} %{size_download} %{speed_download} %{time_namelookup} %{time_connect} %{time_appconnect} %{time_starttransfer} %{time_total}\n" -o /dev/null -s "$1"
done | awk '
BEGIN{
    ns=0;
    tcp_c=0;
    tls_c=0;
    fb=0;
    total=0
}
{
    ns+=$4;
    tcp_c+=$5;
    tls_c+=$6;
    fb+=$7;
    total+=$8
}
END{
    printf "Scheme:                HTTP/%s\n", $1;
    printf "Transfer Size:         %.0f KB\n", $2/1024;
    printf "Transfer Speed         %.0f KB/s\n", $3/1024;
    printf "\n\n"
    printf "DNS Lookup:            %.0f ms\n", ns/NR*1000;
    printf "TCP Handshake Window:  %.0f ms\n", (tcp_c - ns)/NR*1000;
    printf "TLS Handshake Window:  %.0f ms\n", (tls_c - tcp_c)/NR*1000;
    printf "Wait on Server:        %.0f ms\n", (fb - tls_c)/NR*1000;
    printf "First Byte:            %.0f ms\n", fb/NR*1000;
    printf "Transfer Window:       %.0f ms\n", (total - fb)/NR*1000;
    printf "Last Byte:             %.0f ms\n", total/NR*1000;
}'
