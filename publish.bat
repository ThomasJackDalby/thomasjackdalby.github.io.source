@echo off
set current=%cd%
cd ..
xcopy .\thomasjackdalby.github.io.source\public .\thomasjackdalby.github.io\ /e
cd %current%