# certutil
B64 certutil-encoded binary Collection

*** You can do encode one-liner b64 encode as follows;

[] C:\Users\pc\Downloads>certutil -encode -f filee.zip filee.zip.tmp && type filee.zip.tmp | findstr /v /c:- > filee.zip.b64 && jrepl "[\r\n]" "" /m /f filee.zip.b64 /o -

