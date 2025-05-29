#!/usr/bin/bash

cwd="$(pwd)"
while read -r pic ; do
    chafa -c full "$pic"

done <<< "$(find "$cwd" -maxdepth 1  -iname "*.jpg" | head -n 10 )"


while read -r file; do
    # new=$(echo "$file" | sed 's/.mnt.c.Users.axelk.Pictures.Wallpapers.//g')
    chafa --color-extractor median -c full -s 75 "$file" >> master.file
done <<< "$(find /mnt/c/Users/axelk/Pictures/Wallpapers/ -maxdepth 1 -iname "1*.jpg" | head -101 | grep -v 'V')"

i=0
out_path='/home/abe/scratch_pad/motd/dump/'
while read -r file; do
    ((i++))
    chafa --optimize 0 --color-extractor median -c full "$file" > "$out_path$i"
done <<< "$(find "/mnt/c/Users/axelk/Pictures/Wallpapers" -iname "*.jpg" -o -iname "*.png" )"

while read -r file; do
    sed -E 's/\x1b/X/g;s#X\[7mX\[[34]8;2;([0-9]*);([0-9]*);([0-9]*)m#X[38;2;\1;\2;\3;48;2;\1;\2;\3m#g;s/X/\x1b/g' "$file" -i
done <<< "$(find .)"
