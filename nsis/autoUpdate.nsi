; �ýű�ʹ�� HM VNISEdit �ű��༭���򵼲���

; ��װ�����ʼ���峣��
!define PRODUCT_NAME "autoUpdate"
!define PRODUCT_VERSION "1.0.0"
!define PRODUCT_PUBLISHER "fancylin"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\autoUpdate.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor lzma

; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI.nsh"

; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_ICON "..\build\icon.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!insertmacro MUI_PAGE_LICENSE "C:\Users\tencent\Desktop\credit.txt"
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!define MUI_FINISHPAGE_RUN "$INSTDIR\autoUpdate.exe"
!insertmacro MUI_PAGE_FINISH

; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

; ��װԤ�ͷ��ļ�
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "autoUpdate.exe"
InstallDir "$PROGRAMFILES\autoUpdate"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUnInstDetails show
BrandingText "autoUpdate"

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "..\dist\win-unpacked\views_resources_200_percent.pak"
  CreateDirectory "$SMPROGRAMS\autoUpdate"
  CreateShortCut "$SMPROGRAMS\autoUpdate\autoUpdate.lnk" "$INSTDIR\autoUpdate.exe"
  CreateShortCut "$DESKTOP\autoUpdate.lnk" "$INSTDIR\autoUpdate.exe"
  File "..\dist\win-unpacked\vcruntime140.dll"
  File "..\dist\win-unpacked\ui_resources_200_percent.pak"
  File "..\dist\win-unpacked\ucrtbase.dll"
  File "..\dist\win-unpacked\snapshot_blob.bin"
  File "..\dist\win-unpacked\pdf_viewer_resources.pak"
  File "..\dist\win-unpacked\node.dll"
  File "..\dist\win-unpacked\natives_blob.bin"
  File "..\dist\win-unpacked\msvcp140.dll"
  File "..\dist\win-unpacked\LICENSES.chromium.html"
  File "..\dist\win-unpacked\LICENSE.electron.txt"
  File "..\dist\win-unpacked\libGLESv2.dll"
  File "..\dist\win-unpacked\libEGL.dll"
  File "..\dist\win-unpacked\icudtl.dat"
  File "..\dist\win-unpacked\ffmpeg.dll"
  File "..\dist\win-unpacked\d3dcompiler_47.dll"
  File "..\dist\win-unpacked\content_shell.pak"
  File "..\dist\win-unpacked\content_resources_200_percent.pak"
  File "..\dist\win-unpacked\blink_image_resources_200_percent.pak"
  File "..\dist\win-unpacked\autoUpdate.exe"
  File "..\dist\win-unpacked\api-ms-win-crt-utility-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-time-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-string-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-stdio-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-runtime-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-process-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-private-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-multibyte-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-math-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-locale-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-heap-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-filesystem-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-environment-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-convert-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-crt-conio-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-util-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-timezone-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-sysinfo-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-synch-l1-2-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-synch-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-string-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-rtlsupport-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-profile-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-processthreads-l1-1-1.dll"
  File "..\dist\win-unpacked\api-ms-win-core-processthreads-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-processenvironment-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-namedpipe-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-memory-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-localization-l1-2-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-libraryloader-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-interlocked-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-heap-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-handle-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-file-l2-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-file-l1-2-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-file-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-errorhandling-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-debug-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-datetime-l1-1-0.dll"
  File "..\dist\win-unpacked\api-ms-win-core-console-l1-1-0.dll"
  File /r "..\dist\win-unpacked\*.*"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\autoUpdate\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\autoUpdate.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\autoUpdate.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

/******************************
 *  �����ǰ�װ�����ж�ز���  *
 ******************************/

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\api-ms-win-core-console-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-datetime-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-debug-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-errorhandling-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l1-2-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l2-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-handle-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-heap-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-interlocked-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-libraryloader-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-localization-l1-2-0.dll"
  Delete "$INSTDIR\api-ms-win-core-memory-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-namedpipe-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-processenvironment-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-processthreads-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-processthreads-l1-1-1.dll"
  Delete "$INSTDIR\api-ms-win-core-profile-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-rtlsupport-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-string-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-synch-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-synch-l1-2-0.dll"
  Delete "$INSTDIR\api-ms-win-core-sysinfo-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-timezone-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-util-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-conio-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-convert-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-environment-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-filesystem-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-heap-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-locale-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-math-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-multibyte-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-private-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-process-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-runtime-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-stdio-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-string-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-time-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-utility-l1-1-0.dll"
  Delete "$INSTDIR\autoUpdate.exe"
  Delete "$INSTDIR\blink_image_resources_200_percent.pak"
  Delete "$INSTDIR\content_resources_200_percent.pak"
  Delete "$INSTDIR\content_shell.pak"
  Delete "$INSTDIR\d3dcompiler_47.dll"
  Delete "$INSTDIR\ffmpeg.dll"
  Delete "$INSTDIR\icudtl.dat"
  Delete "$INSTDIR\libEGL.dll"
  Delete "$INSTDIR\libGLESv2.dll"
  Delete "$INSTDIR\LICENSE.electron.txt"
  Delete "$INSTDIR\LICENSES.chromium.html"
  Delete "$INSTDIR\msvcp140.dll"
  Delete "$INSTDIR\natives_blob.bin"
  Delete "$INSTDIR\node.dll"
  Delete "$INSTDIR\pdf_viewer_resources.pak"
  Delete "$INSTDIR\snapshot_blob.bin"
  Delete "$INSTDIR\ucrtbase.dll"
  Delete "$INSTDIR\ui_resources_200_percent.pak"
  Delete "$INSTDIR\vcruntime140.dll"
  Delete "$INSTDIR\views_resources_200_percent.pak"

  Delete "$SMPROGRAMS\autoUpdate\Uninstall.lnk"
  Delete "$DESKTOP\autoUpdate.lnk"
  Delete "$SMPROGRAMS\autoUpdate\autoUpdate.lnk"

  RMDir "$SMPROGRAMS\autoUpdate"

  RMDir /r "$INSTDIR\resources"
  RMDir /r "$INSTDIR\locales"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���������е������" IDYES +2
  Abort
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش����ļ�����Ƴ���"
FunctionEnd
