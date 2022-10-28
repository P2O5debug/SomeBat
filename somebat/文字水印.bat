chcp 65001
cls
@echo off
if "%1" EQU "" ( cls
echo 请指定文件路径，例如：
echo.
echo %~n0%~x0 input.png 文字 34 red w/5*3 h/16*14
pause
goto end )

if "%2" EQU "" ( cls
set text=你怎么什么也没写
) else (
set text=%2
)


if "%3" EQU "" ( cls
set size=34
) else (
set size=%3
)


if "%4" EQU "" ( cls
set color=red
) else (
set color=%4
)


if "%5" EQU "" ( cls
set x=w/5*3
) else (
set x=%5
)


if "%6" EQU "" ( cls
set y=h/16*14
) else (
set y=%6
)


if "%7" EQU "" ( cls
set alpha=1
) else (
set alpha=%7
)


if not "%~n1%~x1" == "%~n0%~x0" (
mkdir .\processed\
ffmpeg -i %1 -vf "drawtext=fontfile='微软雅黑':text='%text%':x=%x%:y=%y%:fontsize=%size%:fontcolor=%color%:alpha=%alpha%" ".\processed\%~n1_new%~x1"
ffplay -x 1080 -y 720 ".\processed\%~n1_new%~x1"
goto end
)
:end