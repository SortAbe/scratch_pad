#!/usr/bin/env python3

import time
import keyboard

start = time.time()
for i in range(10):
    keyboard.read_key()
print(f'\n{time.time() - start}')
