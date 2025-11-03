#!/bin/bash

echo "========================================"
echo "Setup Firebase Functions - Studio Biancalani"
echo "========================================"
echo ""

# Verifica Node.js
if ! command -v node &> /dev/null; then
    echo "ERRORE: Node.js non trovato. Installalo da https://nodejs.org/"
    exit 1
fi

echo "[1/6] Verifica Node.js... OK"
node --version

# Verifica Firebase CLI
if ! command -v firebase &> /dev/null; then
    echo ""
    echo "[2/6] Firebase CLI non trovato. Installazione..."
    npm install -g firebase-tools
    if [ $? -ne 0 ]; then
        echo "ERRORE: Impossibile installare Firebase CLI"
        exit 1
    fi
fi

echo "[2/6] Firebase CLI... OK"
firebase --version

# Verifica login Firebase
echo ""
echo "[3/6] Verifica login Firebase..."
firebase projects:list &> /dev/null
if [ $? -ne 0 ]; then
    echo ""
    echo "ATTENZIONE: Non sei loggato in Firebase."
    echo "Aprirai il browser per il login..."
    firebase login
    if [ $? -ne 0 ]; then
        echo "ERRORE: Login fallito"
        exit 1
    fi
fi

echo "[3/6] Login Firebase... OK"

# Installa dipendenze Functions
echo ""
echo "[4/6] Installazione dipendenze Functions..."
cd functions
if [ ! -d "node_modules" ]; then
    npm install
    if [ $? -ne 0 ]; then
        echo "ERRORE: Installazione dipendenze fallita"
        cd ..
        exit 1
    fi
else
    echo "Dipendenze già installate. Aggiornamento..."
    npm update
fi
cd ..

echo "[4/6] Dipendenze installate... OK"

# Inizializza Firebase Functions se necessario
echo ""
echo "[5/6] Verifica configurazione Firebase Functions..."
if [ ! -f "functions/index.js" ]; then
    echo "Configurazione non trovata. Inizializzazione..."
    firebase init functions --project default
else
    echo "Configurazione trovata... OK"
fi

# Prompt per credenziali email
echo ""
echo "[6/6] Configurazione credenziali email..."
echo ""
echo "Inserisci le credenziali Gmail per l'invio email:"
echo "(Usa una App Password Gmail, non la password normale!)"
echo ""
read -p "Email Gmail: " EMAIL_USER
read -sp "App Password Gmail (16 caratteri): " EMAIL_PASS
echo ""

if [ -z "$EMAIL_USER" ]; then
    echo "ERRORE: Email non inserita"
    exit 1
fi

if [ -z "$EMAIL_PASS" ]; then
    echo "ERRORE: Password non inserita"
    exit 1
fi

# Configura Firebase Functions config
echo ""
echo "Configurazione credenziali in Firebase..."
firebase functions:config:set email.user="$EMAIL_USER" email.password="$EMAIL_PASS"

if [ $? -ne 0 ]; then
    echo "ERRORE: Configurazione credenziali fallita"
    exit 1
fi

echo ""
echo "========================================"
echo "Setup completato!"
echo "========================================"
echo ""
echo "PROSSIMI PASSI MANUALI:"
echo ""
echo "1. Apri js/firebase-config.js"
echo "2. Inserisci la configurazione Firebase dal Console"
echo "3. Testa la funzione: npm run serve (nella cartella functions)"
echo "4. Deploy: firebase deploy --only functions"
echo ""
echo "Per vedere i dettagli, apri: SETUP-FIREBASE-FUNCTIONS.md"
echo ""

