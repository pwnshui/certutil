@echo off
FOR /L %%N IN () DO (
tasklist | findstr maplestory
ping -n 2 127.0.0.1 > nul
cls
)
