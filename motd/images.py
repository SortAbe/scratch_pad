#!/usr/bin/env python3

import numpy as np
import os
import random
import time


class Images:
    ESC = chr(27)
    ob = chr(91) # '['OPEN BRACKET char creates IDE issues if not closed ]
    start_of_file = ESC + ob + '0m'
    end_of_line =  ESC + ob + '0m\n'
    depth = 8 # z
    # [x,y,z[0-8]] = [fr, fg, fb, br, bg, bb, symbol, optional]
    np_imgs: list[np.ndarray] = []

    # PROGENITOR INGEST
    def ingest(self, path: str = ''):
        with open(path, 'r') as file:
            lines = file.readlines()
            height = len(lines)
            lines[0] = lines[0][4:] # start of file
            lines[0] = lines[0][1:]  # start of line
            lines[0] = lines[0][:-5] # end of line
            splices = lines[0].split(self.ESC)[1::2]
            width = len(splices)
            shape = (width, height, self.depth)
            np_img = np.empty(shape, dtype=np.uint16)
            x = 0
            for splice in splices:
                splice = splice.split(';')
                cell = [
                    int((splice[2])), # fg red
                    int((splice[3])), # fg green
                    int((splice[4])), # fg blue
                    int((splice[7])), # bg red
                    int((splice[8])), # bg green
                    int((splice[9]).split('m')[0]), # bg blue
                    ord((splice[9]).split('m')[1]), # symbol
                    0,
                ]
                np_img[x,0,0:8] = cell
                x+=1
            y = 1
            for line in lines[1:]:
                line = line[1:]  # start of line
                line = line[:-5] # end of line
                splices = line.split(self.ESC)[1::2]
                x = 0
                for splice in splices:
                    splice = splice.split(';')
                    cell = [
                        int((splice[2])), # fg red
                        int((splice[3])), # fg green
                        int((splice[4])), # fg blue
                        int((splice[7])), # bg red
                        int((splice[8])), # bg green
                        int((splice[9]).split('m')[0]), # bg blue
                        ord((splice[9]).split('m')[1]), # symbol
                        0,
                    ]
                    np_img[x,y,0:8] = cell
                    x+=1
                y+=1
        self.np_imgs.append(np_img)

    # RENDER OUTPUT
    def render(self, np_img: np.ndarray):
        if type(np_img) != np.ndarray:
            print(f'Unexpected object at render() {type(np_img)}')
            exit(1)
        elif len(np_img.shape) != 3:
            print(f'render() np_img incorrect dimensions {len(np_img.shape)}')
            exit(1)
        elif np_img.shape[0] == 0 or np_img.shape[1] == 0 or np_img.shape[2] != 8:
            print(f'render() np_img incorrect shape, w{np_img.shape[0]}, h{np_img.shape[1]}, d{np_img.shape[2]}')
            exit(1)
        ESC = self.ESC
        print_out = self.start_of_file
        tnp_img = np_img.transpose(1,0,2)
        an_arr = tnp_img.tolist()
        for row in an_arr:
            line = ''
            ppx = row[0]
            first = True
            for px in row:
                fg = f'38;2;{px[0]};{px[1]};{px[2]}'
                bg = f'48;2;{px[3]};{px[4]};{px[5]}'
                symbol = px[6]
                if first:
                    line += ESC + self.ob
                    line += fg + ';' + bg + 'm' + chr(symbol)
                    first = False
                else:
                    bg_change = not px[3:6] == ppx[3:6]
                    if not px[0:3] == ppx[0:3]:
                        line += ESC + self.ob
                        line += fg
                        if bg_change:
                            line += ';' + bg
                        line += 'm'
                    elif bg_change:
                        line += ESC + self.ob
                        line += bg
                        line += 'm'
                    line += chr(symbol)
                ppx = px
            print_out += line + self.end_of_line
        print(print_out, end='')

    def get_info(self, np_img: np.ndarray):
        if type(np_img) != np.ndarray:
            print(f' Not nump.ndarray, type:{type(np_img)}')
            return
        print(f'Dimensions: {len(np_img.shape)}')
        if len(np_img.shape) != 3:
            return
        print(f'Width: {np_img.shape[0]}')
        print(f'Height: {np_img.shape[1]}')
        print(f'Depth: {np_img.shape[2]}')

img = Images()
all_files = os.listdir('dump')
start = time.time()
for file in all_files:
    img.ingest('dump/' + file)
print(f'Ingest duration: {(time.time() - start) * 1000:.2f}ms')

start = time.time()
for _ in range(1):
    img.render(img.np_imgs[random.randint(0, 299)])
    time.sleep(0.01)
print(f'Render duration: {(time.time() - start) * 1000:.2f}ms')

# arr = np.random.randint(0, 10_000, (130, 35*20_000, 8), dtype=np.uint16)
# np.save("array.npy", arr)

# my_loaded_array = np.load('array.npy')
# time.sleep(10)
