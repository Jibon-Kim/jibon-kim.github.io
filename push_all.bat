@echo on
setlocal
chcp 65001 >nul
cd /d %~dp0

:: 1) Python 경로 지정 (where python 해서 확인 가능)
set "PY=C:\Users\user\anaconda3\python.exe"

:: 2) 모든 .jemdoc → .html 변환
for %%F in (*.jemdoc) do (
    echo --- Building %%F ---
    "%PY%" "%~dp0jemdoc" -c "%~dp0mysite.conf" "%~dp0%%F" || (
        echo [ERROR] 빌드 실패: %%F
        pause
        exit /b 1
    )
)

:: 3) Git 작업 (커밋 메시지를 인자로 받을 수 있음)
set "MSG=%*"
if "%MSG%"=="" set "MSG=site update %date% %time%"

git add -A
git commit -m "%MSG%" || echo (변경 사항 없음)
git push origin main

echo === Done ===
pause
