#!/usr/bin/env python3.11
import time

s = time.time()
b = 0
for a in range(20_000_000):
    c = a
    b = c - b
    b = c
print(time.time() - s)

s = time.time()
b = 0
for j in range(20_000_000):
    c = j
    b = c + b
    b = c
print(time.time() - s)

s = time.time()
b = 0
for d in range(20_000_000):
    c = d
    if d < b:
        b = d
    b = c
print(time.time() - s)
