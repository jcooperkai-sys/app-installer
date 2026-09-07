; NSIS Installer Script
; Windows Application Installer

!include "MUI2.nsh"
!include "x64.nsh"

; Installer settings
Name "Application"
OutFile "AppInstaller.exe"
InstallDir "$PROGRAMFILES\Application"
InstallDirRegKey HKCU "Software\Application" ""

; Request admin rights
RequestExecutionLevel admin

; MUI Settings
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

; Installer Section
Section "Install Application"
  SetOutPath "$INSTDIR"
  
  ; Copy application files
  File /r "..\src\*.*"
  File "..\requirements.txt"
  
  ; Create registry entries
  WriteRegStr HKCU "Software\Application" "" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Application" "DisplayName" "Application"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Application" "UninstallString" "$INSTDIR\uninstall.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Application" "DisplayVersion" "1.0.0"
  
  ; Create start menu shortcuts
  CreateDirectory "$SMPROGRAMS\Application"
  CreateShortcut "$SMPROGRAMS\Application\Application.lnk" "$INSTDIR\main.py"
  CreateShortcut "$SMPROGRAMS\Application\Uninstall.lnk" "$INSTDIR\uninstall.exe"
  
  ; Create desktop shortcut
  CreateShortcut "$DESKTOP\Application.lnk" "$INSTDIR\main.py"
  
  ; Create uninstaller
  WriteUninstaller "$INSTDIR\uninstall.exe"
  
  MessageBox MB_OK "Installation Complete"
SectionEnd

; Uninstaller Section
Section "Uninstall"
  Delete "$INSTDIR\uninstall.exe"
  Delete "$DESKTOP\Application.lnk"
  RMDir /r "$INSTDIR"
  RMDir /r "$SMPROGRAMS\Application"
  DeleteRegKey HKCU "Software\Application"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Application"
SectionEnd
