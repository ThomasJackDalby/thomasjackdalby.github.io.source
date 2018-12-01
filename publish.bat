@echo off
set current=%cd%

echo Building site...
hugo
echo Copying public folder to thomasjackdalby.github.io
xcopy .\public ..\thomasjackdalby.github.io\ /e /Y
cd ..\thomasjackdalby.github.io\

git add .
echo =======================
echo Git Status
git status
echo =======================

set /p result="Publish to GitHub? (y/n) "
if %result%==y goto publish_to_github
goto finish

:publish_to_github
set /p commit_message="Commit message: "
echo Publishing site to GitHub...
git commit -m "%commit_message%"
git push
goto finish

:finish
git reset head
cd %current%
echo Done.