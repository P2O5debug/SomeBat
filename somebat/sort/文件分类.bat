@echo off
set extension="_new"
for /F "eol=# tokens=1-2 delims=," %%A in (.\type.txt) do (
echo %%A----%%B
for %%i in (..\*.%%A) do ( echo "将对文件%%i进行操作"
if "%%i" NEQ "" (
if not exist ..\%%B\%%A\ ( echo 将执行操作mkdir ..\%%B\%%A\ & mkdir ..\%%B\%%A\ )
if exist "..\%%B\%%A\%%~nxi" (echo 将会执行命令move "%%i" "..\%%B\%%A\%%~ni%extension%%%~xi" & move "%%i" "..\%%B\%%A\%%~ni%extension%%%~xi" ) else ( echo 将会执行命令move "%%i" "..\%%B\%%A\%%~nxi" & move "%%i" "..\%%B\%%A\%%~nxi" )
)
echo.
)
echo.
)
pause