#!/bin/bash

for file in $(ls);do
    size=$(du -b $file | awk '{print $1}');
    new_name=$(echo $file | sed -E "s/(^.*)(S=[0-9]+)(.*$)/\1S=${size}\3/g");
    echo "$file $new_name"
done
