@echo off
FOR /L %%N IN () DO (
tasklist | sort /r /+58 | findstr chrome
ping -n 2 127.0.0.1 > nul
cls
)
