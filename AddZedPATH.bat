:: Copyright (c) 2025 gzqccnu. All rights reserved.
:: https://github.com/gzqccnu/win-zed

@echo off
setlocal enabledelayedexpansion

:: aquire administrator permission
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo require administrator permission
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

:: extract zed path
for /f "tokens=2*" %%A in ('reg query "HKEY_CLASSES_ROOT\*\shell\Zed\command" /ve 2^>nul') do (
    set "zedCommand=%%B"
)

:: check whether get the reg
if not defined zedCommand (
    echo not exist the reg
    pause
    exit /b 1
)

:: extract directory
set "zedPath=%zedCommand:"=%"
for %%A in ("!zedPath!") do set "zedDir=%%~dpA"

:: remove back slash
if "!zedDir:~-1!"=="\" set "zedDir=!zedDir:~0,-1!"

:: check path whether exists
if not exist "!zedDir!" (
    echo error: directory "!zedDir!" doesn't exists
    pause
    exit /b 1
)

:: get PATH
for /f "tokens=2*" %%A in ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul') do (
    set "sysPath=%%B"
)

:: check for zed directory whether exist in PATH
echo !sysPath! | find /i "!zedDir!" > nul
if !errorlevel! equ 0 (
    echo directory "!zedDir!" exists in PATH 
    pause
    exit /b 0
)

:: add to PATH
set "newPath=!sysPath!;!zedDir!"

:: update
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "!newPath!" /f

if !errorlevel! equ 0 (
    echo sucess add "!zedDir!" to PATH
    echo Attention, you should reopen cmd to let it take effect
) else (
    echo error: can't update PATH
)

pause
