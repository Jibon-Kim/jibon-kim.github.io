@echo on
setlocal
chcp 65001 >nul
cd /d %~dp0

:: Python 경로 지정 (없으면 where python으로 보완)
set "PY=C:\Users\user\anaconda3\python.exe"
if not exist "%PY%" for /f "delims=" %%P in ('where python 2^>nul') do set "PY=%%P"
if not exist "%PY%" (
  echo [ERROR] Python not found.
  pause & exit /b 1
)

:: jemdoc 스크립트 존재 확인
if not exist "%~dp0jemdoc" (
  echo [ERROR] jemdoc script not found: "%~dp0jemdoc"
  pause & exit /b 1
)

:: 모든 .jemdoc → .html 변환
for %%F in (*.jemdoc) do (
    echo --- Building %%F ---
    "%PY%" "%~dp0jemdoc" -c "%~dp0mysite.conf" "%~dp0%%F" || (
        echo [ERROR] 빌드 실패: %%F
        pause & exit /b 1
    )
)

echo === Build Done ===
pause
endlocal