TITLE Windows Tiny7 Unattended Tweaks and Customization
COLOR 0F

CLS
@ECHO OFF

start USRMSG.exe
RRC deletekey HKCR\DesktopBackground\Shell\Gadgets


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                      Cleaning up useless shortcuts                        �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
ATTRIB -R -A -S -H %USERPROFILE%\Desktop\desktop.ini
DEL %USERPROFILE%\Desktop\desktop.ini
ATTRIB -R -A -S -H %SYSTEMDRIVE%\Users\Public\Desktop\desktop.ini
DEL %SYSTEMDRIVE%\Users\Public\Desktop\desktop.ini
DEL "%SYSTEMDRIVE%\Users\Public\Desktop\Feedback Tool.lnk"
DEL "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Feedback Tool.lnk"

XCOPY "Launch Internet Explorer Browser.lnk" "%USERPROFILE%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch" /i /r /v /k /f /c /h /y

DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Sidebar.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows DVD Maker.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows Media Player.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Games\Internet Backgammon.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Games\Internet Checkers.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Games\Internet Spades.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Games\More Games from Microsoft.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Games\Purble Place.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\System Tools\Resource Monitor.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\System Tools\Windows Easy Transfer Reports.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\System Tools\Windows Easy Transfer.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Performance Monitor.lnk"
DEL /S /F /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Windows PowerShell Modules.lnk"
RD /S /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Maintenance\"
RD /S /Q "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Windows PowerShell\"

DEL /S /Q "%USERPROFILE%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Internet Explorer.lnk
DEL /S /Q "%USERPROFILE%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Windows Explorer.lnk

REN "%USERPROFILE%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Shows Desktop.lnk" "#Shows Desktop.lnk"
REN "%USERPROFILE%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Window Switcher.lnk" "#Window Switcher.lnk"


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                             Activating Windows                            �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
START /wait Activate.exe


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                             Updating DirectX                              �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
START /wait DirectX-9c-DLL-Files-24-39.exe


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                  Installing Everything Search Engine                      �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
START /wait Everything-v1.2.1.371.exe


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                          �
ECHO  �                 Installing Flash for Internet Explorer                     �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
START /wait Flash-v10.0.22.87-IE.exe /S


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                      Installing FoxIt PDF Reader                          �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
START /wait Foxit-PDF-Reader-Pro-v3.0.1301.exe


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                            Installing HashTab                             �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
START /wait HashTab-v2.1.1.exe


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                       Removing Desktop Watermark                          �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
START /wait Watermark.exe


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                           Installing WinRAR                               �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
START /wait WinRAR-v3.80.exe


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                            Registry Tweaks                                �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
REGEDIT /S %WINDIR%\Install\Tweak.reg


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                  Do not turn off monitor or hard disks                    �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
POWERCFG -Change -monitor-timeout-ac 0
POWERCFG -Change -monitor-timeout-dc 0
POWERCFG -Change -disk-timeout-ac 0
POWERCFG -Change -disk-timeout-dc 0
POWERCFG -Change -standby-timeout-ac 0
POWERCFG -Change -standby-timeout-dc 0
POWERCFG -Change -hibernate-timeout-ac 0
POWERCFG -Change -hibernate-timeout-dc 0


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                             Turn off Hibernate                            �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
powercfg -h off


CLS

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO  ���������������������������������������������������������������������������ͻ
ECHO. �                                                                           �
ECHO  �                             Restarting Windows                            �
ECHO. �                                                                           �
ECHO  ���������������������������������������������������������������������������ͼ
ECHO.
taskkill /im USRMSG.exe /f
ATTRIB -R -A -S -H "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\START7.lnk"
DEL "%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\START7.lnk"
SHUTDOWN.EXE -R -F -T 5
