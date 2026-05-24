#!/bin/bash

wc -l /var/log/apache2/domlogs/*ssl_log | sort -rn | head -45

#IP
awk '{print $1}' DOMAIN-ssl_log | sort | uniq -c | sort -rn | head -45
#User-Agent
awk -F\" '{print $6}' DOMAIN-ssl_log | sort | uniq -c | sort -rn | head -45
#Bandwidth
find /var/log/apache2/domlogs -maxdepth 1 -name "*ssl_log" | while read -r line;do
    awk 'BEGIN{sum = 0} $6 ~ /GET/{sum += $10} END{print  sum/1024/1024"MB :"FILENAME}' "$line"
done | sort -rh

for ((i = 13; i < 23; i++)); do
    echo -n "$i: "
    grep -E "02/Oct/2025:$i" abenobashi.xyz-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "02/Oct/2025:$i:0" abenobashi.xyz-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "02/Oct/2025:$i:1" abenobashi.xyz-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "02/Oct/2025:$i:2" abenobashi.xyz-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "02/Oct/2025:$i:3" abenobashi.xyz-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "02/Oct/2025:$i:4" abenobashi.xyz-ssl_log | awk '$9<400{print $1}' | wc -l
    grep -E "02/Oct/2025:$i:5" abenobashi.xyz-ssl_log | awk '$9<400{print $1}' | wc -l
done

for ((i = 13; i < 23; i++)); do
    echo -n "$i: "
    grep -E "10/May/2025:$i" liveforfilm.com-ssl_log | awk '$9>=400{print $1}' | wc -l
done

for ((i = 10; i < 28; i++)); do
    echo -en "Sep $i\n"
    grep -cE "Oct $i" syslog
done

CPDIR="/usr/local/cpanel/logs/"
for i in $(grep -oP "^.+webmaild. .{7,15} NEW" "${CPDIR}session_log" | awk '{print $6}' | sort | uniq -c | sort -rn | head -15 | awk '{print $2}');do
    # echo "========= $i";
    echo -ne "\n$i ";
    # grep -c "$i" "${CPDIR}session_log" "${CPDIR}access_log" "${CPDIR}login_log" "${CPDIR}cphulkd.log";
    # grep -oE "^.+webmaild. $i NEW [^:]+" session_log  | awk '{print $8}' | sort | uniq -c | sort -rn | tr '\n' ',' | sed 's/,/, /g;s/,$//g';
    grep -oE "^.+webmaild. $i NEW [^:]+" session_log  | awk '{print $8}' | sort -u | tr '\n' ','| sed 's/,/, /g;s/, $//g';
    # whois $i | grep -iP "^org-?name:";
    # csf -g "$i";
done

awk -e 'BEGIN{mask=27;a=(32-mask);b=(2**24);c=(2**16);d=(2**8);}$1~/[^:a-fA-F]/{split($1,e,".");f=lshift(e[1],24)+lshift(e[2],16)+lshift(e[3],8)+e[4];f=lshift(rshift(f,a),a);g[1]=rshift(f,24);g[2]=rshift(f%b,16);g[3]=rshift(f%c,8);g[4]=f%d;print g[1]"."g[2]"."g[3]"."g[4]"/"mask;}' example.com-ssl_log | sort | uniq -c | sort -rn | head -40

ss -tuna | awk 'NR>1&&$2!~/LISTEN/&&$6!~/127.0.0.1:[0-9]*/&&$6!~/\[.*\]/{split($6,stra,":");print stra[1]}' | sort | uniq -c | sort -rn | head -40

csf -d IP -t 1209600 #two weeks

conntrack -D -s IP

while read -r dir; do
    user="$(echo "$dir" | awk -F/ '{print $2}')"
    echo vpopmail:"$user" "$dir"
done <<<"$(find -type d -maxdepth 4 -wholename "*/var/*.com/mail")"

apachectl fullstatus | awk 'NF>14{print}'
grep -P "RewriteRule.*\[[^R]+\]"
