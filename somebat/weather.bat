@echo off
if "%1" EQU "" ( cls
echo 若地区有误，则可以输入地区拼音，例如：
echo %~n0%~x0 beijing
curl wttr.in/?lang=zh
goto end
)
if "%1" NEQ "" ( cls
curl wttr.in/%1?lang=zh
goto end
)
pause
:end