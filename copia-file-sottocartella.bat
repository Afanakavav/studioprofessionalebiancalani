@echo off
echo ========================================
echo Copia File per Sottocartella
echo ========================================
echo.
echo Questo script copia i file necessari nella
echo cartella public di apheron-homepage
echo.

:: Verifica che apheron-homepage esista
if not exist "..\apheron-homepage\public" (
    echo ERRORE: Cartella apheron-homepage/public non trovata
    echo Assicurati che apheron-homepage sia nella cartella parent
    pause
    exit /b 1
)

:: Crea cartella destinazione
if not exist "..\apheron-homepage\public\studioprofessionalebiancalani" (
    echo Creazione cartella destinazione...
    mkdir "..\apheron-homepage\public\studioprofessionalebiancalani"
)

:: Copia file necessari
echo.
echo Copia file in corso...
echo.

:: Copia HTML
copy /Y index.html "..\apheron-homepage\public\studioprofessionalebiancalani\" >nul

:: Copia cartelle
xcopy /E /I /Y css "..\apheron-homepage\public\studioprofessionalebiancalani\css\" >nul
xcopy /E /I /Y js "..\apheron-homepage\public\studioprofessionalebiancalani\js\" >nul
xcopy /E /I /Y images "..\apheron-homepage\public\studioprofessionalebiancalani\images\" >nul

echo File copiati con successo!
echo.
echo PROSSIMI PASSI:
echo.
echo 1. Aggiungi rewrites in apheron-homepage/firebase.json
echo    (Vedi SETUP-SOTTOcartella-FINALE.md)
echo.
echo 2. Deploy: cd ..\apheron-homepage
echo    firebase deploy --only hosting
echo.
pause

