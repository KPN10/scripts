@echo off
cls

@echo off && setlocal enabledelayedexpansion 
for /f "tokens=2delims=COM:" %%i in ('mode^|findstr /C:"COM"')do set "_com=%%i"&echo COM!_com! 

set port=COM%_com%
rem echo %port%
rem pause

start "" putty.exe -serial %port% -sercfg 115200,8,n,1,N
