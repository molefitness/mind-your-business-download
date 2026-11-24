@echo off
setlocal
cd /d "%~dp0"
if not exist "MindYourBusiness-win64\Mind Your Business.exe" goto extract
if exist ".windows-ready-82a30aa" goto play
:extract
echo Mind Your Business wird einmalig entpackt. Bitte kurz warten.
copy /b /y "Windows-1.0.6-82a30aa.tar.xz.001"+"Windows-1.0.6-82a30aa.tar.xz.002" "Windows-1.0.6-82a30aa.tar.xz" >nul
if errorlevel 1 goto failed
tar.exe -xf "Windows-1.0.6-82a30aa.tar.xz" -C "%~dp0."
if errorlevel 1 goto failed
if not exist "MindYourBusiness-win64\Mind Your Business.exe" goto failed
del "Windows-1.0.6-82a30aa.tar.xz" >nul 2>nul
type nul > ".windows-ready-82a30aa"
:play
start "" /D "%~dp0MindYourBusiness-win64" "%~dp0MindYourBusiness-win64\Mind Your Business.exe"
exit /b 0
:failed
echo Entpacken fehlgeschlagen. Bitte das komplette Download-ZIP erneut in einen neuen Ordner entpacken.
pause
exit /b 1
