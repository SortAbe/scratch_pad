#!/usr/bin/env python3.11

import time

#BEGIN
sum_data = 0
sum_ok = 0
user_agents = []
#mask = int(input('Network Mask: '))
mask = 28
net_space = 32 - mask
mod_24_bit = 2**24
mod_16_bit = 2**16
mod_8_bit = 2**8

start = time.time()
with open('example.com-ssl_log', 'r') as file:
    lines = file.readlines()
    for line in lines:
        line = line.strip()
        field = line.split(' ')

        #LOOP
        if 'HTTP' not in line:
            continue
        if '-' not in field[9]:
            sum_data += int(field[9])

        if '-' not in field[8] and int(field[8]) < 400:
            sum_ok += 1

        user_agents.append(line.split('\"')[5])

        #ips
        ip_str = field[0]
        ip_arr_in = ip_str.split('.')
        ip_int = ((int(ip_arr_in[0]) << 24)
                + (int(ip_arr_in[1]) << 16)
                + (int(ip_arr_in[2]) << 8)
                + int(ip_arr_in[3]))
        ip_int = ip_int >> net_space << net_space
        ip_arr_out = []
        ip_arr_out.append(ip_int>>24)
        ip_arr_out.append((ip_int%mod_24_bit)>>16)
        ip_arr_out.append((ip_int%mod_16_bit)>>8)
        ip_arr_out.append(ip_int%mod_8_bit)

#END
print(f'Total upload: {sum_data/1024/1024:.2f}M')
print(f'Total ok: {sum_ok}')
print(f'Duration: {(time.time() - start) * 1000:.0f}ms')
