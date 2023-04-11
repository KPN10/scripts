#!/usr/bin/python3

import pyautogui as pag
screenWidth, screenHeight = pag.size()
pag.FAILSAFE = False
targetWidthPoint = screenWidth / 2
targetHeightPoint = screenHeight
pag.moveTo(targetWidthPoint, targetHeightPoint)
