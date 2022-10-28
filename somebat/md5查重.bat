@echo off
for %%m in (*.*) do (
if not "%%m" == "%~n0%~x0" (
if not "%%m" == "mdmd.txt" (
echo 显示%%m的md5：
echo.
certutil -hashfile "%%m" MD5 >mdmd.txt
for /F "skip=1 eol=C tokens=1 delims=\ " %%A in (.\mdmd.txt) do (
echo %%A
if "%%m" NEQ "" (
if not exist .\tempmd5\ ( echo 将执行操作mkdir .\tempmd5\ & mkdir .\tempmd5\ )
if exist ".\tempmd5\%%A" (echo 将会执行命令move "%%m" "%%~nm_same%%~xm" & move "%%m" "%%~nm_same%%~xm" ) else ( echo 将会执行命令echo .>.\tempmd5\%%A & echo .>.\tempmd5\%%A )
)
echo.
)
echo.
)
)
)
del .\tempmd5\*
rmdir .\tempmd5\
pause
