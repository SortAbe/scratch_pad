#!/usr/bin/bash

for i in {1..100}; do
    top -b -n 1 | head -40 > /root/top/"top$i";
done
