@echo off
cd /d %~dp0

REM Git 리포지토리 초기화
git init

REM 모든 파일 추가
git add .

REM 첫 커밋
git commit -m "init"

REM 기본 브랜치 main으로
git branch -M main

REM GitHub 원격 추가 (본인 주소로 변경!)
git remote add origin https://github.com/Jibon-Kim/jibon-kim.github.io.git

REM 최초 푸시
git push -u origin main

pause
