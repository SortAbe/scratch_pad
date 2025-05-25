#!/usr/bin/env python3

with open('sample.log', 'r') as file:
    lines = file.readlines()
    #BEGIN
    transfer_sum = 0

    #LOOP
    for line in lines:
        line_array = line.split(' ')
        if ('GET' in line_array[5] or 'POST' in line_array[5]) and len(line_array) > 10:
            size = line_array[8]
            if '-' not in size:
                transfer_sum+=int(size)

#END
print(transfer_sum)
