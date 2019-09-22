REM Dummy file for NTVDM

SLEEP 5
powercfg -h off
powercfg -h on

cmdow @ /hid
INTL.CPL
EXIT

control userpasswords2

COLOR 0F
CLS
@ECHO OFF

IF EXIST "Full Registry Backup.reg" GOTO EXHAUSTED

IF NOT EXIST "Full Registry Backup.reg" GOTO MAKE

:MAKE
ECHO.
ECHO  Creating Registry Backup...
REGEDIT /E "Full Registry Backup.reg"
GOTO END

:EXHAUSTED
ECHO.
ECHO  The file "Full Registry Backup.reg" already exists!
ECHO.
ECHO  NO BACKUP HAS BEEN MADE!
ECHO.
ECHO  You should rename the current registry backup file
ECHO  so a new backup can be made, or, move the current
ECHO  registry file out of this folder, then run this
ECHO  batch file again to make a new backup.
ECHO.

PAUSE
GOTO END

:END

EXIT
