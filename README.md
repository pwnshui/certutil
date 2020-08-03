# certutil

![CI](https://github.com/pwnshui/certutil/workflows/CI/badge.svg)

B64 certutil-encoded binary Collection

_You can do encode one-liner b64 encode as follows;_

`certutil -encode -f file.zip file.zip.tmp && type file.zip.tmp | findstr /v /c:- > filee.zip.b64 && jrepl "[\r\n]" "" /m /f filee.zip.b64 /o -`

