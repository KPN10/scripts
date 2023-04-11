#!/bin/python3

import os, sys, pathlib, hashlib
from argparse import ArgumentParser

def getFullPathCurrentDir():
    path = pathlib.Path().resolve()
    return path

def readArg(args):
    parser = ArgumentParser(description="The parsing commands lists.")
    parser.add_argument("-fn", "--filename", required=True, help="Set filename")
    options = parser.parse_args(args)
    return options

def md5(file):
    return hashlib.md5(pathlib.Path(file).read_bytes()).hexdigest()

    # with open(file, "rb") as f:
    #     file_hash = hashlib.md5()
    #     while chunk := f.read(8192):
    #         file_hash.update(chunk)
    # return file_hash.hexdigest()
    
    # m = hashlib.md5()
    # with open(file,'rb') as f:
    #     line = f.read()
    #     m.update(line)
    # md5code = m.hexdigest()
    # return md5code

    # hash_md5 = hashlib.md5()
    # with open(file, 'rb') as f:
    #     for chunk in iter(lambda: f.read(4096), b""):
    #         hash_md5.update(chunk)
    # return hash_md5.hexdigest()

def main():
    # print(f'Current dir: {getFullPathCurrentDir()}')

    options = readArg(sys.argv[1:])
    filename = options.filename
    print(f'Run calc md5 for file {filename}')
    pathToTargetFile = f'{getFullPathCurrentDir()}' + "/" + f'{filename}'
    # print(f'pathToTargetFile {pathToTargetFile}')

    hash_md5 = md5(pathToTargetFile)
    print(f'md5 {hash_md5}')

    md5fileName = pathToTargetFile + ".md5"
    # print(md5fileName)
    f = open(md5fileName, 'w')
    f.write(hash_md5)


if __name__ == "__main__":
    main()