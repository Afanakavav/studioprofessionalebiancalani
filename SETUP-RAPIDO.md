# ⚡ Setup Rapido Firebase Functions

Questa è una versione semplificata per un setup rapido. Usa gli script automatizzati!

---

## 🚀 Setup Automatico (Windows)

1. **Esegui lo script di setup:**
   ```
   setup-firebase-functions.bat
   ```

2. **Segui le istruzioni**:
   - Lo script installerà dipendenze automaticamente
   - Ti chiederà le credenziali Gmail (email + App Password)
   - Configurerà tutto automaticamente

---

## 🚀 Setup Automatico (Mac/Linux)

1. **Rendi eseguibile lo script:**
   ```bash
   chmod +x setup-firebase-functions.sh
   ```

2. **Esegui lo script:**
   ```bash
   ./setup-firebase-functions.sh
   ```

3. **Segui le istruzioni** come sopra

---

## 📝 Passi Manuali Necessari

Anche con gli script automatici, devi fare manualmente:

### 1. Genera Gmail App Password

1. Vai su [Google Account Security](https://myaccount.google.com/security)
2. Attiva **"Verifica in due passaggi"** se non attiva
3. Vai su **"App passwords"** → **"Genera"**
4. Seleziona: Mail → Other (Custom name) → "Firebase Functions"
5. **COPIA LA PASSWORD** (16 caratteri) - la userai nello script

### 2. Configura Firebase nel Frontend

1. Vai su [Firebase Console](https://console.firebase.google.com/)
2. Seleziona il progetto (apheron.io)
3. ⚙️ **Settings** → **Project settings**
4. Scorri a **"Your apps"** → Seleziona web app o **"Add app"** → Web
5. **COPIA** la configurazione `firebaseConfig` che appare

6. **Apri** `js/firebase-config.js`
7. **Sostituisci** tutti i valori `YOUR_*` con quelli copiati

Esempio:
```javascript
const firebaseConfig = {
    apiKey: "AIzaSyC...",           // ← Copia da Firebase Console
    authDomain: "apheron-io.firebaseapp.com",  // ← Copia
    projectId: "apheron-io",        // ← Copia
    storageBucket: "apheron-io.appspot.com",   // ← Copia
    messagingSenderId: "123456789", // ← Copia
    appId: "1:123456789:web:abcdef" // ← Copia
};
```

---

## 🧪 Test Locale (Opzionale)

1. Apri un terminale nella cartella `functions`:
   ```bash
   cd functions
   ```

2. Avvia l'emulatore:
   ```bash
   npm run serve
   ```
   (Oppure usa: `test-function.bat` se sei in Windows)

3. La funzione sarà disponibile su `http://localhost:5001`

4. Testa il form nel sito - le email verranno inviate tramite l'emulatore

---

## 🚀 Deploy

Quando tutto funziona in locale:

1. **Windows**: Esegui `deploy-function.bat`
2. **Mac/Linux**: 
   ```bash
   firebase deploy --only functions
   ```

3. Attendi il completamento (può richiedere 2-3 minuti)

---

## ✅ Verifica

1. Apri il sito (locale o deployato)
2. Vai a **Contatti**
3. Compila e invia una richiesta di test
4. Controlla `francesco.perone00@gmail.com`

---

## 🆘 Problemi Comuni

### Script non funziona
- Verifica Node.js installato: `node --version`
- Verifica Firebase CLI: `firebase --version`
- Se manca, lo script lo installerà automaticamente

### Login Firebase fallito
- Esegui manualmente: `firebase login`
- Autorizza nel browser che si apre

### Credenziali email non funzionano
- Usa una **App Password**, non la password normale Gmail
- Verifica che la verifica in due passaggi sia attiva
- Rigenera l'App Password se necessario

### Email non arrivano dopo deploy
- Controlla logs: `firebase functions:log`
- Verifica credenziali: `firebase functions:config:get`
- Controlla spam in `francesco.perone00@gmail.com`

---

## 📚 Guida Completa

Per dettagli approfonditi, vedi: `SETUP-FIREBASE-FUNCTIONS.md`

---

## ✨ Tutto Fatto!

Una volta completati i passi manuali sopra, il sistema di invio email è operativo! 🎉

