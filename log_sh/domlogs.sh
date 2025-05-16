#!/bin/bash

wc -l /var/log/apache2/domlogs/*ssl_log | sort -rn | head -45

#IP
awk '{print $1}' DOMAIN-ssl_log | sort | uniq -c | sort -rn | head -45
awk '{print $1}' DOMAIN-ssl_log | awk -F. '{print $1"."$2"."$3".0/24"}'| sort | uniq -c | sort -rn | head -45
awk '{print $1}' DOMAIN-ssl_log | awk -F. '{print $1"."$2".0.0/16"}'| sort | uniq -c | sort -rn | head -45
#User-Agent
awk -F\" '{print $6}' DOMAIN-ssl_log | sort | uniq -c | sort -rn | head -45
#Bandwidth
awk 'BEGIN{sum = 0} $6 ~ /GET/{sum += $10} END{print FILENAME": "sum/1024/1024"MB"}' DOMAIN-ssl_log

for ((i = 13; i < 23; i++)); do
    echo -n "$i: "
    grep -E "10/May/2025:$i" *-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "10/May/2025:$i:0" *-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "10/May/2025:$i:1" *-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "10/May/2025:$i:2" *-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "10/May/2025:$i:3" *-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "10/May/2025:$i:4" *-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "10/May/2025:$i:5" *-ssl_log | awk '$9<400{print $1}' | wc -l
done

for ((i = 13; i < 23; i++)); do
    echo -n "10/May/2025:$i: "
    grep -E "10/May/2025:$i" *-ssl_log | awk '$9<400{print $1}' | wc -l
done

for ((i = 13; i < 23; i++)); do
    echo -n "$i: "
    grep -E "10/May/2025:$i" liveforfilm.com-ssl_log | awk '$9>=400{print $1}' | wc -l
done

CPDIR="/usr/local/cpanel/logs/"
for i in $(grep -oP "^.+webmaild. .{7,15} NEW" session_log | awk '{print $6}' | sort | uniq -c | sort -rn | head -15 | awk '{print $2}');do
    echo "========= $i"
    grep -c "$i" "${CPDIR}session_log" "${CPDIR}access_log" "${CPDIR}login_log" "${CPDIR}cphulkd.log"
    grep -oE "^.+webmaild. $i NEW [^:]+" session_log  | awk '{print $8}' | sort | uniq -c | sort -rn
    whois $i | grep -iP "^org-?name:"
done
