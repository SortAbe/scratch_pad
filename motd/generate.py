#!/usr/bin/env python3

import time

ESC = chr(27) # ASCII 1B escape sequence
ob = chr(91) # '['OPEN BRACKET char creates IDE issues if not closed ]
start_of_file = ESC + ob + '0m'
end_of_line =  ESC + ob + '0m\n'

# PROGENITOR INGEST
progenitor = []
start = time.time()
with open('pel0.txt', 'r') as file:
    lines = file.readlines()
    lines[0] = lines[0][4:] # start of file
    for line in lines:
        line = line[:-5] # end of line
        line = line[1:]  # start of line
        row = line.split(ESC)
        progenitor.append(row)

# FINAL RASTER
raster = []
for row in progenitor:
    clean_row = []
    for px in row[1::2]:
        pxs = px.split(';')
        clean_row.append([
        int((pxs[2])), # fg red
        int((pxs[3])), # fg green
        int((pxs[4])), # fg blue
        int((pxs[7])), # bg red
        int((pxs[8])), # bg green
        int((pxs[9]).split('m')[0]), # bg blue
        (pxs[9]).split('m')[1], # symbol
        ])
    raster.append(clean_row)
width = len(raster[0])
print(f'Native ingest {(time.time() - start) * 1000:.2f}ms')

# print(f'{(time.time() - start) * 1000:.0f}ms')

def imprint(x: int = 0, y: int = 0, message: str = ''):
    message = ' ' + message + ' '
    message_length = len(message)
    if message_length + x > width:
        print('Text message too long to add!')
        return
    for i in range(message_length):
        raster[y][x+i][6] = message[i]
        raster[y][x+i][0] = 0
        raster[y][x+i][1] = 0
        raster[y][x+i][2] = 0



# RENDER OUTPUT
def render():
    print_out = start_of_file
    for row in raster:
        line = ''
        for i in range(width):
            px = row[i]
            fg = f'38;2;{px[0]};{px[1]};{px[2]}'
            bg = f'48;2;{px[3]};{px[4]};{px[5]}'
            symbol = px[6]
            if i == 0:
                line += ESC + ob
                line += fg + ';' + bg + 'm' + symbol
            else:
                ppx = row[i-1]
                if px[0] != ppx[0] or px[1] != ppx[1] or px[2] != ppx[2]:
                    line += ESC + ob
                    line += fg
                    if px[3] != ppx[3] or px[4] != ppx[4] or px[5] != ppx[5]:
                        line += ';' + bg
                    line += 'm'
                elif px[3] != ppx[3] or px[4] != ppx[4] or px[5] != ppx[5]:
                    line += ESC + ob
                    line += bg
                    line += 'm'
                line += symbol
        print_out += line + end_of_line
    # print(print_out, end='')

imprint(130, 1, 'Hello world!')
start = time.time()
render()
print(f'Render time python native: {(time.time() - start) * 1000:.2f}ms')
