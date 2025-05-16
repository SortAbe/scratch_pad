#!/usr/bin/env python3


import time
import keyboard

while True:
    if keyboard.read_key() == "p":
        print("You pressed p")
        break
