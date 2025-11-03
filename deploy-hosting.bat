@echo off
echo ========================================
echo Deploy Studio Biancalani - Hosting
echo ========================================
echo.

echo Verifica configurazione...
firebase use apheron-homepage

if %errorlevel% neq 0 (
    echo ERRORE: Impossibile selezionare progetto Firebase
    pause
    exit /b 1
)

echo.
echo Deploy in corso su site: studioprofessionalebiancalani
echo URL: https://studioprofessionalebiancalani.web.app
echo.

firebase deploy --only hosting:studioprofessionalebiancalani

if %errorlevel% neq 0 (
    echo.
    echo ERRORE: Deploy fallito
    pause
    exit /b 1
)

echo.
echo ========================================
echo Deploy completato!
echo ========================================
echo.
echo Il sito è disponibile su:
echo https://studioprofessionalebiancalani.web.app
echo.
echo Il progetto apheron-homepage NON è stato modificato.
echo.
pause

