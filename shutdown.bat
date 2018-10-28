@echo off
cls
echo --- Automatic Shutdown ---

REM ##### Reset & Declare Variable
Color 1D
set timeout=1200
set minutes=30

REM ##### Main Loop
:main
call:schedulePoweroff
set /p userChoice= Do you confirm ? [y/n] 
echo.
if /I not "%userChoice%"=="y" (
  shutdown.exe /a
	set /p minutes= How many minutes ? 
	echo.
	call:main
) else (
	pause
	exit
)

REM #####  Shutdown
:schedulePoweroff
shutdown.exe /a
set /a timeout=%minutes%*60
shutdown.exe /s /t %timeout%
echo Your computer will shutdown automatically in %minutes% minutes
goto:eof
