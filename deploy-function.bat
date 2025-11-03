@echo off
echo ========================================
echo Deploy Firebase Function
echo ========================================
echo.

:: Verifica che siamo nella cartella corretta
if not exist functions\index.js (
    echo ERRORE: File functions\index.js non trovato
    echo Esegui questo script dalla root del progetto
    pause
    exit /b 1
)

:: Verifica login
echo Verifica login Firebase...
firebase projects:list >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo ERRORE: Non sei loggato in Firebase
    echo Esegui: firebase login
    pause
    exit /b 1
)

:: Verifica credenziali configurate
echo Verifica credenziali email...
firebase functions:config:get >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo ATTENZIONE: Credenziali email non configurate
    echo Esegui prima: setup-firebase-functions.bat
    echo.
    pause
    exit /b 1
)

:: Mostra configurazione attuale
echo.
echo Configurazione attuale:
firebase functions:config:get

echo.
echo Procedi con il deploy? (S/N)
set /p DEPLOY="> "

if /i not "%DEPLOY%"=="S" (
    echo Deploy annullato
    pause
    exit /b 0
)

echo.
echo Deploy in corso...
firebase deploy --only functions

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
echo La funzione è ora disponibile e può ricevere richieste.
echo.
pause

