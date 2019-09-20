@echo off
certutil -urlcache -split -f %~1 %~2
exit /b 0