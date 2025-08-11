@echo on
setlocal
chcp 65001 >nul
cd /d %~dp0

REM ▼▼ 자신의 python.exe 절대경로로 바꿔 넣기 ▼▼
set PY=C:\Users\user\anaconda3\python.exe

"%PY%" "%~dp0jemdoc" -c "%~dp0mysite.conf" "%~dp0index.jemdoc"
"%PY%" "%~dp0jemdoc" -c "%~dp0mysite.conf" "%~dp0pubs.jemdoc"

echo === Done ===
pause
