@echo off
title Git Installation Script

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ===================================
    echo Please run this script as an administrator.
    echo ===================================
    echo.
    pause
    timeout /t 10 /nobreak >nul
    exit /b 1
)

REM Enable delayed expansion
setlocal enabledelayedexpansion

echo.
echo ==========================================
echo Git Automation Installation Script by tekadesukant
echo ==========================================
echo.

REM Check if winget is installed
if not exist "%ProgramFiles%\WindowsApps\Microsoft.DesktopAppInstaller_*.msixbundle" (
    echo [INFO] Winget is not installed. Installing Winget...
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/getwinget' -OutFile '$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'"
    powershell -Command "Add-AppxPackage -Path '$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'"
    del "%TEMP%\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    echo [INFO] Winget installation completed.
) else (
    echo [INFO] Winget is already installed.
)

REM Install Git using winget
echo.
echo [INFO] Installing Git...
echo.


winget install --id Git.Git -e --source winget

echo.
echo [INFO] Git installation completed successfully!
echo.

REM Pause to allow the user to see the final message
pause
