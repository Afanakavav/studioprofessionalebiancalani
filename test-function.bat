@echo off
echo ========================================
echo Test Firebase Function Locale
echo ========================================
echo.

:: Verifica che siamo nella cartella functions
if not exist package.json (
    echo ERRORE: Questo script deve essere eseguito dalla cartella functions
    echo Oppure naviga nella cartella functions prima
    pause
    exit /b 1
)

echo Avvio emulatore Firebase Functions...
echo.
echo La funzione sarà disponibile su:
echo http://localhost:5001
echo.
echo Premi CTRL+C per fermare l'emulatore
echo.
pause

npm run serve

