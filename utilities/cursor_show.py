#!/usr/bin/python3

import pyautogui as pag
screenWidth, screenHeight = pag.size()
# print(f'Screen size: {screenWidth}x{screenHeight}')
pag.FAILSAFE = False
targetWidthPoint = screenWidth / 2
targetHeightPoint = screenHeight / 2
pag.moveTo(targetWidthPoint, targetHeightPoint)
