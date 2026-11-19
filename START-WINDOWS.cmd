@echo off
setlocal
cd /d "%~dp0"
if not exist "MindYourBusiness-win64\Mind Your Business.exe" goto extract
if exist ".windows-ready-a27d603" goto play
:extract
echo Mind Your Business wird einmalig entpackt. Bitte kurz warten.
copy /b /y "Windows-a27d603.tar.xz.001"+"Windows-a27d603.tar.xz.002" "Windows-a27d603.tar.xz" >nul
if not exist "Windows-a27d603.tar.xz" goto failed
where tar.exe >nul 2>nul
if errorlevel 1 goto notar
tar.exe -xf "Windows-a27d603.tar.xz" -C "%~dp0."
if errorlevel 1 goto failed
if not exist "MindYourBusiness-win64\Mind Your Business.exe" goto failed
del "Windows-a27d603.tar.xz" >nul 2>nul
type nul > ".windows-ready-a27d603"
:play
start "" /D "%~dp0MindYourBusiness-win64" "%~dp0MindYourBusiness-win64\Mind Your Business.exe"
exit /b 0
:notar
echo Der Windows-Entpacker tar.exe fehlt. Dieses Paket braucht Windows 10 ab Version 1803 oder Windows 11.
pause
exit /b 1
:failed
echo Entpacken fehlgeschlagen. Bitte das komplette Download-ZIP erneut in einen neuen Ordner entpacken.
pause
exit /b 1
