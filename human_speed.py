#!/usr/bin/env python3

import time
import keyboard

start = time.time()
for i in range(10):
    keyboard.read_key()
print(f'\n{time.time() - start}')

def fun(cls):
    cls.class_name = cls.__name__
    return cls

@fun
class Person:
    pass

print(Person.class_name)
