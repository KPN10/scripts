#!/bin/python3

import os, sys, pathlib, glob, tarfile
from argparse import ArgumentParser

def readArg(args):
    parser = ArgumentParser(description="The parsing commands lists.")
    parser.add_argument("-f", "--folder", nargs="+", required=True, help="Set folder")
    parser.add_argument("-m", "--mask", nargs="+", required=False, help="Set mask file name.")
    parser.add_argument("-e", "--extension", nargs="+", required=False, help="Set extension file")
    parser.add_argument("-n", "--archive_name", required=True, help="Set archive name")
    options = parser.parse_args(args)
    return options

def main():
    options = readArg(sys.argv[1:])
    print(f'options {options}')
    print(f'options.mask {options.mask}')
    print(f'options.extension {options.extension}')

    pathCurrentDir = pathlib.Path().resolve()
    print(f'pathCurrentDir {pathCurrentDir}')

    resultListFiles = []

    for folder in options.folder:
        targetDir = f'{pathCurrentDir}' + '/' + f'{folder}'
        print(f'targetDir {targetDir}')

        listFilesOnMask = []
        if options.mask:
            for x in options.mask:
                listFilesOnMask += glob.glob(f'{targetDir}/*{x}*')
            print(f'listFilesOnMask {listFilesOnMask}')

        listFilesOnExtension = []
        if options.extension:
            for x in options.extension:
                listFilesOnExtension += glob.glob(f'{targetDir}/*{x}')
            print(f'listFilesOnExtension {listFilesOnExtension}')

        if listFilesOnMask or listFilesOnExtension:
            resultListFiles += list(set(listFilesOnMask) | set(listFilesOnExtension)) # merge lists without duplicate
            # print(f'resultListFiles {resultListFiles}')

    print(f'resultListFiles {resultListFiles}')

    # Архивируем
    tar = tarfile.open(''.join(f'{options.archive_name}' + ".tar.xz"), "w:xz")
    for x in resultListFiles:
        x = x.replace(f'{pathCurrentDir}'+"/", "")
        filename = os.path.basename(x)
        tar.add(x, arcname=filename)
    tar.close()

if __name__  == "__main__":
    main()