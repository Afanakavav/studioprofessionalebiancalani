@echo off
echo ========================================
echo Aggiorna Studio Biancalani nella Sottocartella
echo ========================================
echo.
echo Questo script copia i file aggiornati nella
echo cartella public di apheron-homepage
echo.

:: Verifica che apheron-homepage esista
if not exist "..\apheron-homepage\public\studioprofessionalebiancalani" (
    echo ERRORE: Cartella studioprofessionalebiancalani non trovata
    echo Esegui prima: copia-file-sottocartella.bat
    pause
    exit /b 1
)

echo Copia file aggiornati...
echo.

:: Copia HTML
copy /Y index.html "..\apheron-homepage\public\studioprofessionalebiancalani\" >nul

:: Copia cartelle
xcopy /E /I /Y css "..\apheron-homepage\public\studioprofessionalebiancalani\css\" >nul
xcopy /E /I /Y js "..\apheron-homepage\public\studioprofessionalebiancalani\js\" >nul
xcopy /E /I /Y images "..\apheron-homepage\public\studioprofessionalebiancalani\images\" >nul

echo.
echo ✅ File aggiornati!
echo.
echo PROSSIMO PASSO:
echo.
echo 1. Vai in: cd ..\apheron-homepage
echo 2. Deploy: firebase deploy --only hosting
echo.
pause

