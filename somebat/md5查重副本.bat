@echo off
if not exist .\md5_temp2.txt ( echo. >md5_temp2.txt )
if not exist .\md5_temp3.txt ( echo. >md5_temp3.txt )
if not exist .\same\ ( mkdir .\same\ )
for %%m in (*.*) do (
if not "%%m" == "%~n0%~x0" (
if not "%%m" == "md5_temp2.txt" (
if not "%%m" == "md5_temp3.txt" (
echo ÏÔÊ¾%%mµÄmd5£º
echo.
certutil -hashfile "%%m" MD5 >md5_temp1.txt
for /F "skip=1 eol=C tokens=1 delims=\ " %%A in (.\md5_temp1.txt) do (
echo %%A
echo.
type "md5_temp2.txt"| findstr "%%A" > md5_temp3.txt && (
for /F "tokens=1-20 delims=" %%B in (.\md5_temp3.txt) do (
if not exist ".\same\%%~nB" ( move "%%~nB" ".\same\%%~nB" )
move "%%m" ".\same\%%~nm_same%%~xm"
)
) || (
echo %%m.%%A>>md5_temp2.txt
)
echo.
)
echo.
)
)
)
)
del md5_temp*.txt
pause
