#!/usr/bin/env python3.11
import time

start = time.time()
milis = 16.7 / 1000
index = 0
while time.time() - milis < start:
    file = open('/tmpfs/benchmark', 'w')
    if index % 2 == 0:
        file.write('hello')
    else:
        file.write('there')
    file.close()
    file = open('/tmpfs/lore', 'r')
    lines = file.readlines()
    file.close()
    index += 1
print(index)
