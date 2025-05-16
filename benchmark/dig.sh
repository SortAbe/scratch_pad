#!/usr/bin/bash
ns_server=("1.1.1.1" "8.8.8.8" "8.8.4.4" "9.9.9.9" "208.67.222.222" "149.112.112.112" "84.200.70.40" "8.26.56.26" "8.20.247.20" "1.0.0.1" "208.67.220.220" "66.96.80.43" "66.96.80.194")
/usr/bin/echo > /tmpfs/dns

i=0
for domain in "$@";do
    ns_index=$((i % 10))
    /usr/bin/dig +time=1 @"${ns_server[$ns_index]}" A "$domain" +noclass +nocmd +noadditional +nocomments +nofail +noidentify +noignore +noquestion +nostats 1>>/tmpfs/dns 2>/dev/null &
    /usr/bin/dig +time=1 @"${ns_server[$ns_index]}" NS "$domain" +noclass +nocmd +noadditional +nocomments +nofail +noidentify +noignore +noquestion +nostats 1>>/tmpfs/dns 2>/dev/null &
    ((i++))
done
