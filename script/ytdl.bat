@setlocal enableextensions enabledelayedexpansion
@echo off

set str1="%*"
md "%appdata%\youtube-dl"
if not x%str1:-x=%==x%str1% curl https://raw.githubusercontent.com/pwnshui/certutil/master/config/config_audio.txt -o "%appdata%\youtube-dl\config.txt"
if x%str1:-x=%==x%str1% curl https://raw.githubusercontent.com/pwnshui/certutil/master/config/config_video.txt -o "%appdata%\youtube-dl\config.txt"
endlocal

youtube-dl "%str1%"

exit /b 0