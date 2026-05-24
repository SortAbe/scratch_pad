#!/bin/bash


while read -r file; do
    echo "$file";
    rsync -avP root@69.46.25.42:"$file" "$file";
done <<< "$(cat remaining_files.txt)"

