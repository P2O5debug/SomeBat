@echo off
set /a sum=0
if "%1" EQU "" ( cls
echo ��ָ��������磺
echo.
echo %~n0%~x0 certutil -hashfile XXX MD5
echo.
echo ֧������ǰ�ò�����һ�����ò���
echo.
echo ���������ö���Ϊ��Ŀ¼�µ��ļ�������Ŀ¼��
pause
goto end
)

if "%1" NEQ "" ( cls
set /a sum=0
for %%m in (*) do (
if not "%%m" == "%~n0%~x0" (
echo ����ִ������
echo.
echo %1 %2 "%%m" %3
echo.
%1 %2 "%%m" %3
@echo off
echo.
set /a sum+=1
::����������ﲻ��,25-28��֮��ע��Ҳ�Ų���  echo ��ִ���� %sum% ������
echo.
)
)
)
echo ��ִ���� %sum% ������
pause
:end