@echo on
setlocal
chcp 65001 >nul
cd /d %~dp0

:: 커밋 메시지 (인자 없으면 날짜/시간)
set "MSG=%*"
if "%MSG%"=="" set "MSG=site update %date% %time%"

:: (선택) Git 저장소 가드
git rev-parse --is-inside-work-tree >nul 2>&1 || (
  echo [ERROR] Not a git repository here.
  pause & exit /b 1
)

git add -A
git commit -m "%MSG%" || echo (변경 사항 없음)
git push origin main

echo === Deploy Done ===
pause
endlocal