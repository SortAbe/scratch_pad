#!/usr/bin/env python3
import time

start = time.time()
haystack = []
with open('/tmpfs/lore', 'r') as file:
    lines = file.readlines()
    print("const haystack = '''")
    for line in lines:
        if line.strip() == '':
            continue
        print(f'{line.strip()}')
        #haystack.append(line.strip())
    print("'''")

for _ in range(0):
    needle = "potenti"
    index = next((i for i, s in enumerate(haystack) if needle in s), -1)
    needle = "paorttitor."
    index = next((i for i, s in enumerate(haystack) if needle in s), -1)
    needle = "pulvinar"
    index = next((i for i, s in enumerate(haystack) if needle in s), -1)
    needle = "paorttitor."
    index = next((i for i, s in enumerate(haystack) if needle in s), -1)

#print(f'Duration MS: {(time.time() - start) * 1000}')
