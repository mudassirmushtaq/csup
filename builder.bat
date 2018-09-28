@echo off
REM Build the Windows Binary
echo Generating the Windows Binary...

pyinstaller          ^
    --noconfirm      ^
    --onefile        ^
    --log-level=WARN ^
    --clean          ^
    --name csup.windows.x86_64 ^
    csup.py

@echo on
del /Q *.spec
rmdir /S /Q build
