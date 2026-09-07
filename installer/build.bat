@echo off
REM Build script for Application Installer
REM Requires NSIS to be installed: https://nsis.sourceforge.io/

setlocal enabledelayedexpansion

echo.
echo ========================================
echo Application Installer Builder
echo ========================================
echo.

REM Check if NSIS is installed
if not exist "C:\Program Files (x86)\NSIS\makensis.exe" (
    echo Error: NSIS not found at default location
    echo Please install NSIS from: https://nsis.sourceforge.io/
    echo.
    pause
    exit /b 1
)

REM Build the installer
echo Building installer...
"C:\Program Files (x86)\NSIS\makensis.exe" installer.nsi

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Build Successful!
    echo ========================================
    echo.
    echo Output: AppInstaller.exe
    echo Location: %cd%\AppInstaller.exe
    echo.
) else (
    echo.
    echo ========================================
    echo Build Failed!
    echo ========================================
    echo.
    pause
    exit /b 1
)

pause
