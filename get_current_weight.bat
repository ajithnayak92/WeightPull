@echo off
setlocal

:: Define the PowerShell script path
set "PS_SCRIPT=%~dp0scale_interface.ps1"

:: Check if PowerShell is installed
where powershell >nul 2>nul
if errorlevel 1 (
    echo PowerShell is not installed. Please install PowerShell and try again.
    exit /b 1
)

:: Execute the PowerShell script
powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"

:: Pause to keep the command window open
::pause
