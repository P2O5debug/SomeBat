@echo off
set /a sum=0
if "%1" EQU "" ( cls
echo 请指定命令，例如：
echo.
echo %~n0%~x0 certutil -hashfile XXX MD5
echo.
echo 支持两个前置参数和一个后置参数
echo.
echo 此命令作用对象为该目录下的文件（不含目录）
pause
goto end
)

if "%1" NEQ "" ( cls
set /a sum=0
for %%m in (*) do (
if not "%%m" == "%~n0%~x0" (
echo 将会执行命令
echo.
echo %1 %2 "%%m" %3
echo.
%1 %2 "%%m" %3
@echo off
echo.
set /a sum+=1
::此命令放这里不行,25-28行之间注释也放不了  echo 共执行了 %sum% 次命令
echo.
)
)
)
echo 共执行了 %sum% 次命令
pause
:end