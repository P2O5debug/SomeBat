@echo off
if not "%~n1%~x1" == "%~n0%~x0" (
mkdir .\mp3\
ffmpeg -i %1 -vn -c:a mp3 ".\mp3\%~n1_new.mp3"
echo 执行成功
)
pause