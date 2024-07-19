@echo off
REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo You need to run this script as an administrator.
    exit /b 1
)

REM Check if winget is installed
if not exist "%ProgramFiles%\WindowsApps\Microsoft.DesktopAppInstaller_*.msixbundle" (
    echo Winget is not installed. Installing Winget...
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/getwinget' -OutFile '$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'"
    powershell -Command "Add-AppxPackage -Path '$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'"
    del "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    echo Winget installation completed.
) else (
    echo Winget is already installed.
)

REM Install Git using winget
echo Installing Git...
winget install --id Git.Git -e --source winget
echo Git installation completed.
