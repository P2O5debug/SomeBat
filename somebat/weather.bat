@echo off
if "%1" EQU "" ( cls
echo ����������������������ƴ�������磺
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