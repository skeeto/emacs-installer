!include "MUI2.nsh"

Name "GNU Emacs"
Outfile "emacs-${VERSION}-installer-${ARCH}.exe"
XPStyle on

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

InstallDir "$PROGRAMFILES\Emacs"

!insertmacro MUI_LANGUAGE "English"

!define ADDREM "Software\Microsoft\Windows\CurrentVersion\Uninstall"

section
  SetShellVarContext all
  setOutPath $INSTDIR
  File /r emacs-${VERSION}\*
  writeUninstaller $INSTDIR\uninstall.exe
  WriteRegStr HKLM "${ADDREM}\Emacs" \
                   "DisplayName" "Emacs"
  WriteRegStr HKLM "${ADDREM}\Emacs" \
                   "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  WriteRegStr HKLM "${ADDREM}\Emacs" \
                   "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
sectionEnd

section "Start Menu shortcut" StartMenuLnk
  createShortCut "$SMPROGRAMS\Emacs.lnk" "$INSTDIR\bin\runemacs.exe"
sectionEnd

section "Desktop shortcut" DesktopLnk
  createShortCut "$DESKTOP\Emacs.lnk" "$INSTDIR\bin\runemacs.exe"
sectionEnd

section "Uninstall"
  SetShellVarContext all
  delete $INSTDIR\uninstall.exe
  RMDir /r $INSTDIR
  delete "$SMPROGRAMS\Emacs.lnk"
  delete "$DESKTOP\Emacs.lnk"
  DeleteRegKey HKLM "${ADDREM}\Emacs"
sectionEnd


; Section descriptions

LangString DESC_DesktopLnk ${LANG_ENGLISH} \
           "Create a shortcut on your desktop."
LangString DESC_StartMenuLnk ${LANG_ENGLISH} \
           "Add a root Start Menu shortcut."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${DesktopLnk} $(DESC_DesktopLnk)
  !insertmacro MUI_DESCRIPTION_TEXT ${StartMenuLnk} $(DESC_StartMenuLnk)
!insertmacro MUI_FUNCTION_DESCRIPTION_END
