#!/usr/bin/python3

import numpy
from PIL import Image

def genRandomImage():
    for n in range(10):
        a = numpy.random.rand(30,30,3) * 255
        im_out = Image.fromarray(a.astype('uint8')).convert('RGB')
        im_out.save('out%000d.jpg' % n)

def main():
    genRandomImage()

if __name__ == "__main__":
    main()

