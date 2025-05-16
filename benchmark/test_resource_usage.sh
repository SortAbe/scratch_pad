#!/bin/bash

echo > history

start=$(date '+%s')
passed=0
while [[ $passed -lt 10 ]]; do
    now=$(date '+%s')
    passed=$((now-start))
    for pid in $(ps x | grep "php83\|fping" | grep -v "grep" | awk '{print $1}');do
        echo -n "$passed   " >> history
        ps aux -q "$pid" | awk 'NR>1{print $3"\t"$4}' >> history
    done
    sleep 0.1
done

awk 'BEGIN{
        previous=0;
        cpu_used=0;
        mem_used=0;
        seen=0;
    }
    NR>1{
        second=$1;
        if(second==previous){
            cpu_used+=$2;
            mem_used+=$3;
            seen++;
        }
        else {
            print previous "\t" (cpu_used/seen) "\t" (mem_used/seen);
            cpu_used=0;
            mem_used=0;
            seen=0;
        }
        previous=second;
    }' history
