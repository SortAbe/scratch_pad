#!/usr/bin/bash

cwd="$(pwd)"
while read -r pic ; do
    chafa -c full "$pic"

done <<< "$(find "$cwd" -maxdepth 1  -iname "*.jpg" | head -n 10 )"


while read -r file; do
    chafa --color-extractor median -c full -s 75 "$file" >> master.file
done <<< "$(find /mnt/c/Users/axelk/Pictures/Wallpapers/ -maxdepth 1 -iname "1*.jpg" | head -101 | grep -v 'V')"

i=0
count=0
out_path='/home/abe/scratch_pad/motd/lg_db/'
while read -r file; do
    ((i++))
    ((count++))
    chafa -f symbols --optimize 0 --color-extractor median -c full -s 150 "$file" > "$out_path$i" &
    if [[ count -eq 16 ]]; then
        wait -n
        ((count--))
    fi
done <<< "$(find "/mnt/c/Users/axelk/Pictures/" -iname "*.jpg" -o -iname "*.png" )"

while read -r file; do
    sed -E 's/\x1b/X/g;s#X\[7mX\[[34]8;2;([0-9]*);([0-9]*);([0-9]*)m#X[38;2;\1;\2;\3;48;2;\1;\2;\3m#g;s/X/\x1b/g' "$file" -i
    sed -E 's/(\x1b\[0m)( *)\x1b\[0m/\1\x1b[38;2;0;0;0;48;2;0;0;0m\2\1/g' "$file" -i
done <<< "$(find . -type f)"

sed -E 's/\x1b/Y/g' 1* | grep -o 'm.Y' | sed 's/m//g;s/Y//' | sort | uniq -c | sort -rn
awk '{printf "%-3s, %-4s, %s\n", $2, NR, $1}' symbols_list > symbols
