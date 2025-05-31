#!/usr/bin/env python3

import numpy as np
import os
import time


class RenderEngine:
    ESC = chr(27)
    OB = chr(91) # '['OPEN BRACKET char creates IDE issues if not closed ]
    start_of_file = ESC + OB + '0m'
    end_of_line =  ESC + OB + '0m\n'
    depth = 8 # z
    # [x,y,z[0-8]] = [fr, fg, fb, br, bg, bb, symbol, optional]
    imgs: list[np.ndarray] = []
    sin = {} # map symbols to byte
    sout: list [ str ] = [] # map back to utf8

    def __init__(self):
        with open('symbols', 'r') as file:
            for line in file.readlines():
                matrix = line.split(',')
                self.sin[matrix[0].strip()] = int(matrix[1].strip()) + 141
        self.sin[' '] = 32
        for i in range(255)[0:32]: # reserved bits for later functions
            self.sout.append('.')
        for i in range(255)[32:127]: # alpha num
            self.sout.append(chr(i))
        for i in range(255)[127:141]:
            self.sout.append('.')
        invert = { value : key for key, value in self.sin.items()}
        sorted_values = list(invert.keys())
        sorted_values.sort()
        for i in sorted_values:
            self.sout.append(invert[i])

    def save(self, path: str):
        np.savez(path, **{f'{i}': arr for i, arr in enumerate(re_eng.imgs)})

    def load(self, path: str):
        for img in np.load(path).values(): self.imgs.append(img)

    # PROGENITOR INGEST
    def ingest(self, path: str = ''):
        for file_path in os.listdir(path):
            print(file_path)
            with open(path + '/' + file_path, 'r') as file:
                lines = file.readlines()
                height = len(lines)
                lines[0] = lines[0][4:] # start of file
                lines[0] = lines[0][1:] # start of line
                lines[0] = lines[0][:-5] # end of line
                splices = lines[0].split(self.ESC)[1::2]
                width = len(splices)
                shape = (width, height, self.depth)
                np_img = np.empty(shape, dtype=np.uint8)
                x = 0
                for splice in splices:
                    splice = splice.split(';')
                    cell = [
                        0,
                        int((splice[2])), # fg red
                        int((splice[3])), # fg green
                        int((splice[4])), # fg blue
                        int((splice[7])), # bg red
                        int((splice[8])), # bg green
                        int((splice[9]).split('m')[0]), # bg blue
                        self.sin[(splice[9]).split('m')[1]], # symbol
                    ]
                    np_img[x,0,0:8] = cell
                    if 256 in cell:
                        print(cell)
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
                            0,
                            int((splice[2])), # fg red
                            int((splice[3])), # fg green
                            int((splice[4])), # fg blue
                            int((splice[7])), # bg red
                            int((splice[8])), # bg green
                            int((splice[9]).split('m')[0]), # bg blue
                            self.sin[(splice[9]).split('m')[1]], # symbol
                        ]
                        np_img[x,y,0:8] = cell
                        x+=1
                    y+=1
            self.imgs.append(self.optimize(np_img))

    # OPTIMIZE
    def optimize(self, arr: np.ndarray):
        arr[:, :, 0] = 0
        mask =  np.all( arr[1:, :, 1:4] != arr[:-1, :,  1:4], axis=2)
        arr[1:, :, 0] = mask.astype(np.uint8)
        mask2 = np.all( arr[1:, :, 4:7] != arr[:-1, :, 4:7], axis=2)
        arr[1:, :, 0] += mask2.astype(np.uint8) * 2
        return arr


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
        print_out =  self.start_of_file
        tnp_img = np_img.transpose(1,0,2)
        an_arr = tnp_img.tolist()
        for row in an_arr:
            px = row[0]
            line = ESC + self.OB +\
            f'38;2;{px[1]};{px[2]};{px[3]}' +\
            f';48;2;{px[4]};{px[5]};{px[6]}' +\
            'm' + self.sout[px[7]]
            for px in row[1:]:
                symbol = self.sout[px[7]]
                if px[0] == 3:
                    line += ESC + self.OB +\
                    f'38;2;{px[1]};{px[2]};{px[3]}' +\
                    f';48;2;{px[4]};{px[5]};{px[6]}' +\
                    'm'
                elif px[0] == 2:
                    line += ESC + self.OB +\
                    f'48;2;{px[4]};{px[5]};{px[6]}' +\
                    'm'
                elif px[0] == 1:
                    line += ESC + self.OB +\
                    f'38;2;{px[1]};{px[2]};{px[3]}' +\
                    'm'
                line += symbol
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

start = time.time()
re_eng = RenderEngine()
print(f'init duration: {(time.time() - start) * 1000:.2f}ms')

# start = time.time()
# re_eng.ingest('lg_db')
# print(f'Ingest duration: {(time.time() - start) * 1000:.2f}ms')

# start = time.time()
# re_eng.save('lg_db.npz')
# print(f'Save duration: {(time.time() - start) * 1000:.2f}ms')

start = time.time()
re_eng.load('lg_db.npz')
print(f'Load duration: {(time.time() - start) * 1000:.2f}ms')
# time.sleep(20)


start = time.time()
for img in re_eng.imgs[100:200]:
    re_eng.render(img)
print(f'Full Render duration: {(time.time() - start) * 1000:.2f}ms')

start = time.time()
for img in re_eng.imgs:
    re_eng.optimize(img)
print(f'Full Optimize duration: {(time.time() - start) * 1000:.2f}ms')

