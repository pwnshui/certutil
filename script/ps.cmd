@echo off
echo example: ps 1 "-a 2 -b 3"
echo Your input: %~1 %~2
if [%~1] == []  (
    echo No files matched as ps1 script.
    echo Usage: ps zen "zenn zennn" => execute zen.ps1 with parameter zenn zennn.
    echo Quote is mandatory because ps.cmd receives all parameter in second param.
    exit /B
) else (
    @powershell.exe -ExecutionPolicy Bypass -Command "%~dp0\%~1.ps1" %~2
)