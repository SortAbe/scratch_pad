#!/usr/bin/env python3.11

import time
import keyboard

start = time.time()
characters = 0

while characters < 100:
    input = keyboard.read_key()
    print(input)
    characters += 1
print(f'Rolling speed: {(time.time()-start)*10}')
