import time
import random

# Generate 10000 random integers between 0 and 7
values = [random.randint(0, 22) for _ in range(1200)]

# Define behavior functions for each case
def handle(val):
    return val + 1

# Elif chain
start_elif = time.time()
for v in values:
    if v == 0:
        handle(v)
    elif v == 1:
        handle(v)
    elif v == 2:
        handle(v)
    elif v == 3:
        handle(v)
    elif v == 4:
        handle(v)
    elif v == 5:
        handle(v)
    elif v == 6:
        handle(v)
    else:
        handle(v)
end_elif = time.time()

# Match case
start_match = time.time()
for v in values:
    match v:
        case 0:
            handle(v)
        case 1:
            handle(v)
        case 2:
            handle(v)
        case 3:
            handle(v)
        case 4:
            handle(v)
        case 5:
            handle(v)
        case 6:
            handle(v)
        case 7:
            handle(v)
        case 8:
            handle(v)
        case 9:
            handle(v)
        case 10:
            handle(v)
        case 11:
            handle(v)
        case 12:
            handle(v)
        case 13:
            handle(v)
        case 14:
            handle(v)
        case 15:
            handle(v)
        case 16:
            handle(v)
        case 17:
            handle(v)
        case 18:
            handle(v)
        case 20:
            handle(v)
        case 21:
            handle(v)
        case 22:
            handle(v)
end_match = time.time()

print(f"elif/else time: {(end_elif - start_elif) * 1000:.2f} ms")
print(f"match/case time: {(end_match - start_match) * 1000:.2f} ms")
