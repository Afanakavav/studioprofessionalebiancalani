@echo off
echo ========================================
echo Setup Firebase Functions - Studio Biancalani
echo ========================================
echo.

:: Verifica Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ERRORE: Node.js non trovato. Installalo da https://nodejs.org/
    pause
    exit /b 1
)

echo [1/6] Verifica Node.js... OK
node --version

:: Verifica Firebase CLI
where firebase >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo [2/6] Firebase CLI non trovato. Installazione...
    call npm install -g firebase-tools
    if %errorlevel% neq 0 (
        echo ERRORE: Impossibile installare Firebase CLI
        pause
        exit /b 1
    )
)

echo [2/6] Firebase CLI... OK
firebase --version

:: Verifica login Firebase
echo.
echo [3/6] Verifica login Firebase...
firebase projects:list >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo ATTENZIONE: Non sei loggato in Firebase.
    echo Aprirai il browser per il login...
    firebase login
    if %errorlevel% neq 0 (
        echo ERRORE: Login fallito
        pause
        exit /b 1
    )
)

echo [3/6] Login Firebase... OK

:: Installa dipendenze Functions
echo.
echo [4/6] Installazione dipendenze Functions...
cd functions
if not exist node_modules (
    call npm install
    if %errorlevel% neq 0 (
        echo ERRORE: Installazione dipendenze fallita
        cd ..
        pause
        exit /b 1
    )
) else (
    echo Dipendenze già installate. Aggiornamento...
    call npm update
)
cd ..

echo [4/6] Dipendenze installate... OK

:: Inizializza Firebase Functions se necessario
echo.
echo [5/6] Verifica configurazione Firebase Functions...
if not exist functions\index.js (
    echo Configurazione non trovata. Inizializzazione...
    firebase init functions --project default
) else (
    echo Configurazione trovata... OK
)

:: Prompt per credenziali email
echo.
echo [6/6] Configurazione credenziali email...
echo.
echo Inserisci le credenziali Gmail per l'invio email:
echo (Usa una App Password Gmail, non la password normale!)
echo.
set /p EMAIL_USER="Email Gmail: "
set /p EMAIL_PASS="App Password Gmail (16 caratteri): "

if "%EMAIL_USER%"=="" (
    echo ERRORE: Email non inserita
    pause
    exit /b 1
)

if "%EMAIL_PASS%"=="" (
    echo ERRORE: Password non inserita
    pause
    exit /b 1
)

:: Configura Firebase Functions config
echo.
echo Configurazione credenziali in Firebase...
firebase functions:config:set email.user="%EMAIL_USER%" email.password="%EMAIL_PASS%"

if %errorlevel% neq 0 (
    echo ERRORE: Configurazione credenziali fallita
    pause
    exit /b 1
)

echo.
echo ========================================
echo Setup completato!
echo ========================================
echo.
echo PROSSIMI PASSI MANUALI:
echo.
echo 1. Apri js/firebase-config.js
echo 2. Inserisci la configurazione Firebase dal Console
echo 3. Testa la funzione: npm run serve (nella cartella functions)
echo 4. Deploy: firebase deploy --only functions
echo.
echo Per vedere i dettagli, apri: SETUP-FIREBASE-FUNCTIONS.md
echo.
pause

