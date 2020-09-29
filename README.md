# certutil

![JustARandomThing](https://github.com/pwnshui/certutil/workflows/CI/badge.svg)

B64 certutil-encoded binary Collection

# Naming rule

1. verb_noun(32).(bat|exe|cmd|ps1)
2. wrap-up script: bookbinder.bat - java -jar "%~dp0\bookbinder.jar"
3. shortcut script: ytdl.bat
4. zip file - deprecated





_You can do encode one-liner b64 encode as follows;_

`certutil -encode -f file.zip file.zip.tmp && type file.zip.tmp | findstr /v /c:- > filee.zip.b64 && jrepl "[\r\n]" "" /m /f filee.zip.b64 /o -`

