@ECHO OFF

REM // delete some intermediate assembler output just in case
IF EXIST Player.gen del Player.gen
IF EXIST Player.gen goto LABLERROR3
IF EXIST Player.p del Player.p
IF EXIST Player.p goto LABLERROR2
IF EXIST Player.h del Player.h
IF EXIST Player.h goto LABLERROR1

REM // clear the output window
cls

REM // run the assembler
REM // -xx shows the most detailed error output
REM // -c outputs a shared file (Player.h)
REM // -A gives us a small speedup
set AS_MSGPATH=Win32
set USEANSI=n

REM // allow the user to choose to print error messages out by supplying the -pe parameter
IF "%1"=="-logerrors" ( "Win32/asw.exe" -xx -q -c -E -A -L Player.asm ) ELSE "Win32/asw.exe" -xx -q -c -A -L Player.asm
IF "%1"=="-logerrors" ( IF EXIST Player.log goto LABLERROR4 )
IF EXIST Player.p "Win32/s1p2bin" Player.p Player.gen Player.h
IF NOT EXIST Player.p goto LABLPAUSE

REM // generate debug information
IF EXIST Player.gen "Win32/convsym" Player.lst Player.gen -a -input as_lst

IF EXIST Player.gen "Win32/rompad" Player.gen 255 0

REM REM // fix the rom header (checksum)
IF EXIST Player.gen "Win32/fixheadr" Player.gen

REM // done -- pause if we seem to have failed, then exit
IF EXIST Player.p del Player.p
IF EXIST Player.h del Player.h
IF EXIST Player.gen goto LABLEXIT
:LABLPAUSE
pause
goto LABLEXIT
:LABLERROR1
echo Failed to build because write access to Player.h was denied.
pause
goto LABLEXIT
:LABLERROR2
echo Failed to build because write access to Player.p was denied.
pause
goto LABLEXIT
:LABLERROR3
echo Failed to build because write access to Player.gen was denied.
pause
goto LABLEXIT
:LABLERROR4
REM // display a noticeable message
echo.
echo **********************************************************************
echo *                                                                    *
echo *   There were build errors/warnings. See Player.log for more details.   *
echo *                                                                    *
echo **********************************************************************
echo.
pause
:LABLEXIT
exit /b