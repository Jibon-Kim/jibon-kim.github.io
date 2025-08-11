@echo on
setlocal
chcp 65001 >nul
set PYTHONUTF8=1
set PYTHONIOENCODING=utf-8
cd /d %~dp0

set "PY=C:\Users\user\anaconda3\python.exe"
for %%F in (*.jemdoc) do (
  echo --- Building %%F ---
  "%PY%" "%~dp0jemdoc" -c "%~dp0mysite.conf" "%~dp0%%F" || (
    echo [ERROR] 빌드 실패: %%F
    pause & exit /b 1
  )
)
git add -A
git commit -m "site update %date% %time%" || echo (변경 없음)
git push
pause
