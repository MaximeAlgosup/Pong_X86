@echo off
set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%.\"
set "NASM=%ROOT_DIR%\nasm\nasm"
set "BIN_DIR=%ROOT_DIR%\bin"
set "DOSBOX_BIN=%ProgramFiles(x86)%\DOSBox-0.74-3\DOSBox.exe"
set "CONFIG_LOC=%ROOT_DIR%"

"%NASM%" main.asm -f bin -o "%BIN_DIR%\pong.com"

::"%DOSBOX_BIN%" -conf "%CONFIG_LOC%"
"%DOSBOX_BIN%" -c "MOUNT c %BIN_DIR%"