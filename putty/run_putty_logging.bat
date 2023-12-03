@echo off
cls

@echo off && setlocal enabledelayedexpansion 
for /f "tokens=2delims=COM:" %%i in ('mode^|findstr /C:"COM"')do set "_com=%%i"&echo COM!_com! 

set port=COM%_com%

set log_prefix_file_name=log
if exist %log_prefix_file_name%*.txt (
	echo log file exist

	set /a count = 0
	for %%f in (%log_prefix_file_name%*.txt) do (
		rem echo %%~nf
		set /a count +=1
		)
	set /a count +=1
	set log_file_name=%log_prefix_file_name%_!count!
) else (
	echo log file not exist
	set log_file_name=log_1
)

set file_name=%log_file_name%.txt
start "" putty.exe -sessionlog %file_name% -serial %port% -sercfg 115200,8,n,1,N
