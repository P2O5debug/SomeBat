@echo off
for /r ./ %%i in (*.*) do (
move "%%i" ".\%%~nxi"
)
pause