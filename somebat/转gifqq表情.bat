@echo off
chcp 65001
if %1 EQU "" ( cls
echo 请指定文件路径，例如：
echo %~n0%~x0 表情包.png
pause
goto end
)
if %1 NEQ "" (
if not "%~n1%~x1" == "%~n0%~x0" (
mkdir .\gif\
ffmpeg -i %1 -filter_complex "split[a][b];[a]palettegen[p];[b][p]paletteuse" ".\gif\%~n1_new.gif"
goto end
)
)
:end