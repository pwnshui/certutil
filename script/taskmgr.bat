@echo off
FOR /L %%N IN () DO (
tasklist | sort /+65 | findstr maplestory
ping -n 2 127.0.0.1 > nul
cls
)
